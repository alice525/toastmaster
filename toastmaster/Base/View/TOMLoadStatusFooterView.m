//
//  TOMLoadStatusFooterView.m
//  toastmaster
//
//  Created by apple on 16/6/19.
//  Copyright (c) 2016年 toastmaster. All rights reserved.
//

#import "TOMLoadStatusFooterView.h"
#import "TOMLoadingStatusView.h"

static const NSInteger kLoadingViewWH = 30;

@interface TOMLoadStatusFooterView ()

@property (nonatomic, strong) TOMLoadingStatusView *loadingView;

@end


@implementation TOMLoadStatusFooterView

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        _loadingView = [[TOMLoadingStatusView alloc] init];
        
        [self addSubview:_loadingView];
    }
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    _loadingView.frame = CGRectMake((CGRectGetWidth(self.frame)- kLoadingViewWH)/2, 20, kLoadingViewWH, kLoadingViewWH);
}

- (void)showActivity:(BOOL)shouldShow
{
    if (shouldShow) {
        [_loadingView startAnimate];
    } else {
        [_loadingView stopAnimate];
    }
}


@end
