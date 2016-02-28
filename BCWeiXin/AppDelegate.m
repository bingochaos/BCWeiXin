//
//  AppDelegate.m
//  BCWeiXin
//
//  Created by 黄斌超 on 2/27/16.
//  Copyright © 2016 bingoc. All rights reserved.
//

#import "AppDelegate.h"
#import "WeiXinChatViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //创建windows
    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    self.window.backgroundColor = [UIColor whiteColor];

    //初始化tabbar控制器
    UITabBarController *tabBarController = [[UITabBarController alloc]init];
    //设置为根控制器
    self.window.rootViewController = tabBarController;

    //创建子控件

    WeiXinChatViewController *weiXinChatController = [[WeiXinChatViewController alloc]init];
    weiXinChatController.view.backgroundColor = [UIColor grayColor];
    weiXinChatController.tabBarItem.title = @"微信";
    weiXinChatController.tabBarItem.badgeValue = @"!";

    UIViewController *contactsController = [[UIViewController alloc]init];
    contactsController.view.backgroundColor = [UIColor grayColor];
    contactsController.tabBarItem.title = @"通讯录";

    UIViewController *discoverController = [[UIViewController alloc]init];
    discoverController.view.backgroundColor = [UIColor grayColor];
    discoverController.tabBarItem.title = @"发现";

    UIViewController *meController = [[UIViewController alloc]init];
    meController.view.backgroundColor = [UIColor grayColor];
    meController.tabBarItem.title = @"我";

    //添加子控制器到tabbar中
    tabBarController.viewControllers = @[weiXinChatController,contactsController,discoverController,meController];
    

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
