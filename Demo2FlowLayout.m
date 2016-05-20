//
//  Demo2FlowLayout.m
//  DemoTest
//
//  Created by hzzc on 16/5/12.
//  Copyright © 2016年 hzzc. All rights reserved.
//

#import "Demo2FlowLayout.h"

@implementation Demo2FlowLayout
//必须重写此方法指定布局大小
//每次layout invalidated或者重新query布局信息时会调用
- (void)prepareLayout {
    CGFloat inset = 32;
    self.itemSize = CGSizeMake(self.collectionView.frame.size.width - 2 * inset,
                               self.collectionView.frame.size.height *3 / 4);
    //距离顶部 左侧 底部 右侧的距离
    self.sectionInset = UIEdgeInsetsMake(0, inset, 0, inset);
    //水平移动
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    [super prepareLayout];

}

#pragma mark - Delegate

//当重新查询布局信息时就会调用此API 必须要设置成为YES，才能实现自定义布局
// return YES to cause the collection view to requery the layout for geometry information
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds{
    return YES;
}

// 用于决定布局信息 必须重写它来实现布局信心
- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    NSArray *arraySuper = [super layoutAttributesForElementsInRect:rect];
    //深复制一份，不能修改父类的属性，不然会有很多error打印出来
    NSArray *attributes = [[NSArray alloc]initWithArray:arraySuper copyItems:YES];
   
    NSArray *visibleIndexPaths = [self.collectionView indexPathsForVisibleItems];
    
    if (visibleIndexPaths.count <= 0) {
        return attributes;
    }else if (visibleIndexPaths.count == 1){
        self.mainIndexPath = [visibleIndexPaths firstObject];
        self.WillMoveToMainIndexPath = nil;
    }else if (visibleIndexPaths.count >1) {
        NSIndexPath *indexPath = [visibleIndexPaths firstObject];
        
        //往左边移动
        if (indexPath == self.mainIndexPath) {
            
            //记录将要移进来的位置
            self.WillMoveToMainIndexPath = visibleIndexPaths[1];
        }else{
            
            //往右移动
            self.WillMoveToMainIndexPath = visibleIndexPaths[0];
            
            //更新下一个成为main
            self.mainIndexPath = visibleIndexPaths[1];
        }
        for (UICollectionViewLayoutAttributes *attribute in attributes) {
            //
            [self setTransformForLayoutAttributes:attribute];
        }
    
    }
    return attributes;
}

- (void)setTransformForLayoutAttributes:(UICollectionViewLayoutAttributes *) attribute{
    UICollectionViewCell *cell = [self.collectionView cellForItemAtIndexPath:attribute.indexPath];
    if (self.mainIndexPath && attribute.indexPath.section == self.mainIndexPath.section) {
        attribute.transform3D = [self tranforForView:cell];
    }

}


- (CATransform3D)tranforForView:(UICollectionViewCell *)View{
    //cell的起始偏移
    
    CGFloat w = self.collectionView.frame.size.width;
    CGFloat offset = [self.collectionView indexPathForCell:View].section *w;
    
    //当前偏移量
    CGFloat  currentOffset = self.collectionView.contentOffset.x;

    //计算偏移量
    CGFloat angleView = (currentOffset - offset)/w;

    CATransform3D t = CATransform3DIdentity;
    
    //m34负责z轴方向的translation（移动），m34= -1/D,  默认值是0，也就是说D无穷大，这意味layer in projection plane（投射面）和layer in world coordinate重合了。
    //D越小透视效果越明显。 所谓的D，是eye（观察者）到投射面的距离。
    
    t.m34 = 1.0 / -500;
    
    if (currentOffset - offset >= 0) {
        t = CATransform3DRotate(t, angleView, 1, 1, 0);
    }else{
        t = CATransform3DRotate(t, angleView, -1, 1, 0);
    }
    return t;
   
}



@end
