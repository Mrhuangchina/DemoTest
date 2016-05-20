//
//  Demo2Cell.m
//  DemoTest
//
//  Created by hzzc on 16/5/12.
//  Copyright © 2016年 hzzc. All rights reserved.
//

#import "Demo2Cell.h"

@implementation Demo2Cell


-(instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {
        self.imageView = [[UIView alloc]initWithFrame:self.bounds];
        self.imageView.layer.cornerRadius = 12;
        self.imageView.layer.masksToBounds = YES;
        
        [self.contentView addSubview:self.imageView];
    }

    return self;
}

- (void)configWithImage:(id)image{
    self.imageView.layer.contents = (__bridge id _Nullable)([UIImage imageNamed:image].CGImage);
}
@end
