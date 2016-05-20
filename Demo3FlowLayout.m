//
//  Demo3FlowLayout.m
//  DemoTest
//
//  Created by hzzc on 16/5/13.
//  Copyright © 2016年 hzzc. All rights reserved.
//

#import "Demo3FlowLayout.h"

@implementation Demo3FlowLayout

-(void)prepareLayout {
    
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.minimumLineSpacing = 20;
    self.sectionInset = UIEdgeInsetsMake(0, 30, 0, 30);
    self.itemSize = CGSizeMake(self.collectionView.frame.size.width - 60,
                               self.collectionView.frame.size.height - 180);
    
    [super prepareLayout];

}


- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds{
   
    return YES;
    
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    NSArray *superAttrobutes = [super layoutAttributesForElementsInRect:rect];
    
    NSArray *attributes = [[NSArray alloc]initWithArray:superAttrobutes copyItems:YES];
    CGRect visibleRect = CGRectMake(self.collectionView.contentOffset.x,
                                    self.collectionView.contentOffset.y,
                                    self.collectionView.frame.size.width,
                                    self.collectionView.frame.size.height);
    CGFloat offset = CGRectGetMidX(visibleRect);
    //枚举block遍历
    [attributes enumerateObjectsUsingBlock:^(UICollectionViewLayoutAttributes *attribute, NSUInteger idx, BOOL * _Nonnull stop) {
        CGFloat distance = offset - attribute.center.x;
        //越往中心移动则值越小，那么缩放就越小，从而显示越大
        //同理超过中心越往左 或者右 缩放就越大 显示越小
        CGFloat sacleForDistance = distance / self.itemSize.height;
        // 0.2值可调整 值越大显示就越大
        CGFloat scaleForCell = 1 + 0.2 *(1 - fabs(sacleForDistance));
        attribute.transform3D = CATransform3DMakeScale(1, scaleForCell, 1);
        attribute.zIndex = 1;
    }];
    //与上面的方法相比较此方法多了一个参数 用来标示是从前往后遍历  还是从后往前遍历。
//    [attributes enumerateObjectsWithOptions:<#(NSEnumerationOptions)#> usingBlock:<#^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop)block#>]
    
    return attributes;
}


- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity{
    //分页以1/3处
    if (proposedContentOffset.x > self.previousOffsetx + self.itemSize.width / 3.0) {
        self.previousOffsetx += self.collectionView.frame.size.width - self.minimumLineSpacing *2;
        
    }else if (proposedContentOffset.x < self.previousOffsetx + self.itemSize.width / 3.0){
        self.previousOffsetx -= self.collectionView.frame.size.width - self.minimumLineSpacing *2;
    }
    proposedContentOffset.x = self.previousOffsetx;

    return proposedContentOffset;
}
@end
