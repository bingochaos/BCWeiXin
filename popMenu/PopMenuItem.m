//
//  PopMenuItem.m
//  BCWeiXin
//
//  Created by 黄斌超 on 2/27/16.
//  Copyright © 2016 bingoc. All rights reserved.
//

#import "PopMenuItem.h"

@interface PopMenuItem()
@property (nonatomic ,assign)BOOL showSelected;

@end

@implementation PopMenuItem
@synthesize showSelected = _showSelected;
+ (instancetype)menuTitle:(NSString *)title WithIcon:(UIImage *)icon{
    PopMenuItem *item = [[PopMenuItem alloc] init:title image:icon tag:0 userInfo:nil target:nil action:NULL];
    item.showSelected = NO;
    item.alignment = NSTextAlignmentCenter;
    return item;
}

+ (instancetype)menuItem:(NSString *)title image:(UIImage *)image tag:(NSInteger)tag userInfo:(NSDictionary *)userInfo{
    PopMenuItem *item = [[PopMenuItem alloc]init:title image:image tag:tag userInfo:userInfo target:nil action:NULL];
    item.showSelected = NO;
    item.alignment = NSTextAlignmentCenter;
    return item;
}

+ (instancetype)menuItem:(NSString *)title image:(UIImage *)image target:(id)target action:(SEL)action{
    PopMenuItem *item = [[PopMenuItem alloc]init:title image:image tag:0 userInfo:nil target:target action:action];
    item.showSelected = NO;
    item.alignment = NSTextAlignmentCenter;
    return item;
}

- (BOOL)enabled{
    return self.showSelected;
}

- (void)perforAction{
    __strong id target = self.target;
    if(target && [target respondsToSelector:_action]){
        [target performSelectorOnMainThread:_action withObject:self waitUntilDone:YES];
    }
}
//初始化方法
- (id)init:(NSString *)title image:(UIImage *)image tag:(NSInteger)tag userInfo:(NSDictionary *)userInfo target:(id)target action:(SEL) action {
    NSParameterAssert(title.length || image);
    self = [super init];
    if (self) {
        _title = title;
        _image = image;
        _tag =tag;
        _userInfo = userInfo;
        _target = target;
        _action = action;
    }
    return self;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"<%@ :%p> \n {\n\ttitle: %@,\n\timage: %@,\n\ttag: %zd,\n\tuserInfo: %@\n}\n", [self class], self, _title, _image, _tag, _userInfo];
}
@end
