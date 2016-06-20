//
//  TOMBaseViewHelper.h
//  toastmaster
//
//  Created by apple on 16/6/19.
//  Copyright (c) 2016年 toastmaster. All rights reserved.
//

#ifndef toastmaster_TOMBaseViewHelper_h
#define toastmaster_TOMBaseViewHelper_h

/*!
 上拉刷新和下拉刷新支持
 */
@protocol P_QLDragToRefresh <NSObject>

@required
- (UIScrollView *)dragRefreshView;
- (BOOL)hasHeaderDragRefresh;
- (BOOL)hasFootterDragRefresh;

@optional
//// 下一页，上拉刷新风格， 立即刷新 或者 等待用户上拉刷新
//- (QLNextPageDragRefreshStyle)footerDragRefreshStyle;
//
//// 默认 content
//- (QLHeaderDragRefreshStyle)headerDragRefreshStyle;
//
///*!
// 非必要方法
// 返回页面使用到的数据加载类，下拉刷新或者加载更多的使用会自动调用 model 的方法
// 如果页面比较复杂可以忽略该方法，重写刷新激活方法 dragReload:
// */
//- (QLRequestModel *)requestModel;
//
///* 拖拽刷新
// @param bMore YES:上拉刷新，加载下一页  NO:下拉刷新页面
// */
//- (void)dragReload:(BOOL)bMore;
//
///*
// * QLNewBaseViewController 使用，作用同上  add by helo: 20140325
// */
//- (void) RequestData:(QL_MOMENT_LOAD_MODE)mode;

@end

typedef NS_ENUM(NSInteger, TOMPageLoadingStatus){
    TOMLoadingStatusNone = 0,
    TOMLoadingStatusHeader,
    TOMLoadingStatusFotter
};
#endif
