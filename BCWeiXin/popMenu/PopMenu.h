//
//  PopMenu.h
//  BCWeiXin
//
//  Created by 黄斌超 on 2/27/16.
//  Copyright © 2016 bingoc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PopMenuItem.h"

typedef void(^PopMenuSelectedItem)(NSInteger index,PopMenuItem *item);
typedef enum {
    PopMenuBackGroundColorEffectSolid = 0,
    PopMenuBackGroundColorEffectGradient = 1,
} PopMenuBackGroundColorEffect;
@interface PopMenu : NSObject

+ (void)showMenuInView:(UIView *)view fromRect:(CGRect)rect menuItems:(NSArray *)menuitems selected:(PopMenuSelectedItem)selectedItem;


+ (void)dismissMenu;


//主题色
+ (UIColor *)tintColor;
+ (void)setTintColor:(UIColor *)tintColor;

//标题字体
+ (UIFont *)titleFont;
+ (void)setTitleFont:(UIFont *)titleFont;


//背景效果
+ (PopMenuBackGroundColorEffect)backgroundColorEffect;
+ (void)setBackGroundColorEffect:(PopMenuBackGroundColorEffect)effect;

//是否显示阴影
+ (BOOL)hasShadow;
+ (void)setHasShadow:(BOOL)flag;

@end
