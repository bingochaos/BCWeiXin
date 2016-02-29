//
//  WeiXinChatViewController.h
//  BCWeiXin
//
//  Created by 黄斌超 on 2/27/16.
//  Copyright © 2016 bingoc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WeiXinChatViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>{
    NSArray *_rowArray;
    NSArray *_imageArray;
}

@property (nonatomic,strong)UITableView *chatListTableView;

@property (nonatomic,strong)UIToolbar *chatToolBar;

@property (nonatomic,strong)UIBarButtonItem *plusButtonItem;

@end
