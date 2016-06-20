//
//  TOMBaseViewController.m
//  toastmaster
//
//  Created by apple on 16/6/19.
//  Copyright (c) 2016年 toastmaster. All rights reserved.
//

#import "TOMBaseViewController.h"
#import "TOMLoadStatusHeaderView.h"
#import "TOMLoadStatusFooterView.h"

static const CGFloat kLoadViewH = 100;

@interface TOMBaseViewController () <UIScrollViewDelegate>

@property (nonatomic, strong) TOMLoadStatusHeaderView *headerView;

@property (nonatomic, strong) TOMLoadStatusFooterView *footerView;

@property (nonatomic, assign) TOMPageLoadingStatus loadingStatus;

@end

@implementation TOMBaseViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if ([self conformsToProtocol:@protocol(P_QLDragToRefresh)]) {
        [self configureDragFreshHeaderView];
        
        [self performSelector:@selector(configureDragFreshFooterView) withObject:nil afterDelay:20];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)configureDragFreshHeaderView
{
    if (![self conformsToProtocol:@protocol(P_QLDragToRefresh) ]) {
        return;
    }
    
    id <P_QLDragToRefresh> dragObj = (id <P_QLDragToRefresh>)self;
    
    UIScrollView *dragView = [dragObj dragRefreshView];
    
    if ([dragView isKindOfClass:[UIScrollView class]]) {
        if ([dragObj hasHeaderDragRefresh]) {
            if (!_headerView) {
                _headerView = [[TOMLoadStatusHeaderView alloc] initWithFrame:CGRectZero];
                
                _headerView.backgroundColor = [UIColor redColor];
            }
            
            CGFloat originY = -kLoadViewH;
            
            _headerView.frame = CGRectMake(0, originY, CGRectGetWidth(dragView.frame), kLoadViewH);
            
            [dragView addSubview:_headerView];
        } else {
            [_headerView removeFromSuperview];
        }
        
    }
}

- (void)configureDragFreshFooterView
{
    if (![self conformsToProtocol:@protocol(P_QLDragToRefresh) ]) {
        return;
    }
    
    id <P_QLDragToRefresh> dragObj = (id <P_QLDragToRefresh>)self;
    
    UIScrollView *dragView = [dragObj dragRefreshView];
    
    if ([dragView isKindOfClass:[UIScrollView class]]) {
        if ([dragObj hasFootterDragRefresh]) {
            if (!_footerView) {
                _footerView = [[TOMLoadStatusFooterView alloc] initWithFrame:CGRectZero];
                
                _footerView.backgroundColor = [UIColor redColor];
            }
            
            CGFloat originY = dragView.contentSize.height;
            
            _footerView.frame = CGRectMake(0, originY, CGRectGetWidth(dragView.frame), kLoadViewH);
            
            [dragView addSubview:_footerView];
        } else {
            [_footerView removeFromSuperview];
        }
        
    }
}

#pragma mark -
#pragma mark UIScrollViewDelegate
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    
}

- (void)scrollViewDidScroll:(UIScrollView*)scrollView {
    if ( ![self conformsToProtocol:@protocol(P_QLDragToRefresh)])
        return;
    
    id <P_QLDragToRefresh> dragObj = (id <P_QLDragToRefresh>)self;
    
    if(_headerView) {
        if (scrollView.dragging) {
            if (scrollView.contentOffset.y <= -kLoadViewH) {
                [_headerView showActivity:YES];
                
                [self performSelector:@selector(stopAnimate) withObject:nil afterDelay:20];
            }
        }
    }
}

- (void)stopAnimate
{
    [_headerView showActivity:NO];
}

- (void)scrollViewDidEndDragging:(UIScrollView*)scrollView willDecelerate:(BOOL)decelerate {
    NSLog(@">>>scrollViewDidEndDragging");
    if ( ![self conformsToProtocol:@protocol(P_QLDragToRefresh)] )
        return;
    
    id <P_QLDragToRefresh> dragObj = (id <P_QLDragToRefresh>)self;
    if( _headerView.superview ) {
        // If dragging ends and we are far enough to be fully showing the footer view trigger a
        // load as long as we arent loading already
        if (scrollView.contentOffset.y > 0) {
    
        }
    }
}

-(void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView {
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSLog(@">>>scrollViewDidEndDecelerating");
}


@end
