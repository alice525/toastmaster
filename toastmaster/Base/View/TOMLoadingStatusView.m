//
//  TOMLoadingStatusView.m
//  toastmaster
//
//  Created by apple on 16/6/19.
//  Copyright (c) 2016年 toastmaster. All rights reserved.
//

#import "TOMLoadingStatusView.h"

@interface TOMLoadingStatusView ()

@property (nonatomic, strong) UIImageView *rotateView;
@property (nonatomic, assign) BOOL isAnimating;

@end

@implementation TOMLoadingStatusView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        _rotateView = [[UIImageView alloc] initWithFrame:self.bounds];
        
        [_rotateView setImage:[UIImage imageNamed:@"sync_loading.png"]];

        [self addSubview:_rotateView];
    }
    
    return self;
}

- (void)layoutSubviews
{
    _rotateView.frame = self.bounds;
}

- (void)startAnimate
{
    if (!_isAnimating) {
        _isAnimating = YES;
        
        CABasicAnimation *rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
        rotationAnimation.toValue = [NSNumber numberWithInt:M_PI * 2.0];
        rotationAnimation.duration = 2;
        rotationAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
        rotationAnimation.repeatCount = HUGE_VAL;
        
        if ([NSThread isMainThread]) {
            [_rotateView.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
        } else {
            dispatch_async(dispatch_get_main_queue(), ^(void){
                [_rotateView.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
            });
        }
    }
}

- (void)stopAnimate
{
    [_rotateView.layer removeAnimationForKey:@"rotationAnimation"];
    
    _isAnimating = NO;
}

@end
