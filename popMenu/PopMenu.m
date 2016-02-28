//
//  PopMenu.m
//  BCWeiXin
//
//  Created by 黄斌超 on 2/27/16.
//  Copyright © 2016 bingoc. All rights reserved.
//

#import "PopMenu.h"
#import <QuartzCore/QuartzCore.h>

#define kArrowSize          12.0f                 //箭头尺寸
#define kCornerRadius       8.0f                  //圆角
#define kTintColor [UIColor WhiteColor]
#define kTitleFont [UIFont  systemFontOfSize:16.0]

typedef enum {

    PopMenuViewArrowDirectionNone,
    PopMenuViewArrowDirectionUp,
    PopMenuViewArrowDirectionDown,
    PopMenuViewArrowDirectionLeft,
    PopMenuViewArrowDirectionRight,

} PopMenuViewArrowDirection;
@interface PopMenuView : UIView

/**
 *  @method
 *  @brief 隐藏Menu
 *
 *  @param animated 是否有动画
 */
-(void)dismissMenu:(BOOL)animated;

@end
@interface PopMenuOverlay : UIView

@end

@interface PopMenu()

+ (void)reset;

@end

#pragma mark - PopMenuOverLay

@implementation PopMenuOverlay



@end
@implementation PopMenu

@end
