//
//  Demo1ViewController.h
//  DemoTest
//
//  Created by hzzc on 16/5/11.
//  Copyright © 2016年 hzzc. All rights reserved.
//

#import "DemoViewController.h"

@interface Demo1ViewController : DemoViewController<UICollectionViewDelegate,UICollectionViewDataSource>

@property(nonatomic,strong) UICollectionView *collectionView;
@property(nonatomic,copy) NSMutableArray *dataArray;

@end
