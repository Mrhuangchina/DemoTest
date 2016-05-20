//
//  ViewController.h
//  DemoTest
//
//  Created by hzzc on 16/5/11.
//  Copyright © 2016年 hzzc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate>

@property(nonatomic,strong)UICollectionView *collectionView;
@property(nonatomic,copy)NSArray *dataArray;

@end

