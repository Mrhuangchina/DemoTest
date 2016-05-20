//
//  Demo1Cell.m
//  DemoTest
//
//  Created by hzzc on 16/5/11.
//  Copyright © 2016年 hzzc. All rights reserved.
//

#import "Demo1Cell.h"
#import "Demo1Model.h"


@implementation Demo1Cell


- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        _imageView = [[UIView alloc]init];
        _imageView.frame = CGRectMake(0,
                                      0,
                                      self.frame.size.width,
                                      self.frame.size.width);
        [self.contentView addSubview:_imageView];
        
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0,
                                                               self.frame.size.height-20,
                                                               self.frame.size.width,
                                                               20)];
        _titleLabel.numberOfLines = 0;
        _titleLabel.font = [UIFont systemFontOfSize:16];
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.backgroundColor = [UIColor blackColor];
        _titleLabel.layer.masksToBounds = YES;
        
        [self.contentView addSubview:_titleLabel];
    }

    return self;
}
- (void)configCellWithMode:(Demo1Model *)model
{
    if (model.clipedImage) {
        
        self.imageView.layer.contents = (__bridge id _Nullable)(model.clipedImage.CGImage);
    }else{
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            UIImage *image = [UIImage imageNamed:model.imageName];
            image = [self clipImage:image toSize:self.imageView.frame.size];
            dispatch_async(dispatch_get_main_queue(), ^{
                model.clipedImage = image;
                self.imageView.layer.contents = (__bridge id _Nullable)((model.clipedImage.CGImage));
            });
        });
    
    }
 
    self.titleLabel.text = model.title;

}


- (UIImage *)clipImage:(UIImage *)image toSize:(CGSize)size {
    UIGraphicsBeginImageContextWithOptions(size, YES, [UIScreen mainScreen].scale);
    
    CGSize imageSize = image.size;
    CGFloat x = MAX(size.width/imageSize.width, size.height/imageSize.height);
    CGSize resultSize = CGSizeMake(x * imageSize.width, x * imageSize.height);
    [image drawInRect:CGRectMake(0, 0, resultSize.width, resultSize.height)];
    
    UIImage *finaImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return finaImage;

}

@end
