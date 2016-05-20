//
//  Demo4Cell.m
//  DemoTest
//
//  Created by hzzc on 16/5/14.
//  Copyright © 2016年 hzzc. All rights reserved.
//

#import "Demo4Cell.h"

@implementation Demo4Cell

- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self != nil) {
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
