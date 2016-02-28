//
//  PopMenuItem.h
//  BCWeiXin
//
//  Created by 黄斌超 on 2/27/16.
//  Copyright © 2016 bingoc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface PopMenuItem : NSObject

@property (nonatomic,strong) UIImage         *image;
@property (nonatomic,strong) NSString        *title;
@property (nonatomic,assign) NSInteger       tag;
@property (nonatomic,strong) NSDictionary    *userInfo;

@property (nonatomic,strong) UIFont          *titleFont;
@property (nonatomic       ) NSTextAlignment alignment;
@property (nonatomic,strong) UIColor         *foreColor;

@property (nonatomic,weak  ) id              target;
@property (nonatomic       ) SEL             action;

+ (instancetype)menuTitle:(NSString *)title WithIcon:(UIImage *)icon;

+ (instancetype)menuItem:(NSString *)title image:(UIImage *)image tag:(NSInteger)tag userInfo:(NSDictionary *)userInfo;

+ (instancetype)menuItem:(NSString *)title image:(UIImage *)image target:(id)target action:(SEL)action;

- (void)perforAction;

- (BOOL)enabled;


@end
