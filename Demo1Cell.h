//
//  Demo1Cell.h
//  DemoTest
//
//  Created by hzzc on 16/5/11.
//  Copyright © 2016年 hzzc. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Demo1Model;

@interface Demo1Cell : UICollectionViewCell

@property (nonatomic,strong)UILabel *titleLabel;
@property (nonatomic,strong)UIView *imageView;

- (void)configCellWithMode:(Demo1Model *)model;

@end
