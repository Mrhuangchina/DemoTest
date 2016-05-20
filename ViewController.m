//
//  ViewController.m
//  DemoTest
//
//  Created by hzzc on 16/5/11.
//  Copyright © 2016年 hzzc. All rights reserved.
//

#import "ViewController.h"
#import "Demo1ViewController.h"
#import "Demo2ViewController.h"
#import "Demo3ViewController.h"
#import "Demo4ViewController.h"


#define kCell @"Mrhuang"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    flowLayout.itemSize = CGSizeMake(self.view.bounds.size.width, 44);
    flowLayout.minimumLineSpacing = 0;
    
    
    self.collectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds
                                                    collectionViewLayout:flowLayout];
    
    [self.view addSubview:self.collectionView];
//    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    //是否显示滚动条
    self.collectionView.showsVerticalScrollIndicator = YES;
    [self.collectionView registerClass:[UICollectionViewCell class]
                                forCellWithReuseIdentifier:kCell];
    
  self.dataArray = @[[[Demo1ViewController alloc]initWithTitle:@"网格布局"],
                     [[Demo2ViewController alloc]initWithTitle:@"水平切换"],
                     [[Demo3ViewController alloc]initWithTitle:@"水平缩放"],
                     [[Demo4ViewController alloc]initWithTitle:@"垂直缩放"]
                    ];
    
    [self.collectionView reloadData];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark - UICollectionViewDataSource & UICollectionViewDelegate

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCell
                                                                           forIndexPath:indexPath];
    
    UILabel *titleLabel = [cell.contentView viewWithTag:1000];
    if (!titleLabel) {
        titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(20,
                                                              0,
                                                              cell.contentView.bounds.size.width-40,
                                                              cell.contentView.bounds.size.height)];
        
        titleLabel.tag = 1000;
        [cell.contentView addSubview:titleLabel];
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0,
                                                                  cell.contentView.bounds.size.height,
                                                                  cell.contentView.bounds.size.width,
                                                                  0.5)];
       
        label.backgroundColor = [UIColor lightGrayColor];
        [cell.contentView addSubview:label];
    }
    
    UIViewController *Vc = self.dataArray[indexPath.item];
    titleLabel.text = Vc.title;
    
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{

    return _dataArray.count;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    UIViewController *vc = self.dataArray[indexPath.item];
    
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
