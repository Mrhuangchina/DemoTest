//
//  Demo1Model.h
//  DemoTest
//
//  Created by hzzc on 16/5/11.
//  Copyright © 2016年 hzzc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface Demo1Model : NSObject

@property (nonatomic,copy)NSString *imageName;
@property (nonatomic,copy)NSString *title;

//剪裁后的图片
@property (nonatomic, strong) UIImage *clipedImage;

@end
