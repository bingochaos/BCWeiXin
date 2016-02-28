//
//  WeiXinChatViewController.m
//  BCWeiXin
//
//  Created by 黄斌超 on 2/27/16.
//  Copyright © 2016 bingoc. All rights reserved.
//

#import "WeiXinChatViewController.h"


#define nameTag          1
#define detailTag        2
#define timeTag          3
#define imageTag         4
#define nameFontSize    15
#define fontSize        12

#define toolbarH        40
#define statusbarH      24




@interface WeiXinChatViewController (){
    NSArray *_stuArray;
    UITableView *dropdownTabView;
}

@end

@implementation WeiXinChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //初始化学生数据(class,name,stuNumber,image)
    NSDictionary *dic1 = [[NSDictionary alloc]initWithObjectsAndKeys:@"你好",@"detail",@"李秋",@"name",@"2016/1/1",@"time",@"airplane-in-clouds.png",@"image",nil];
    NSDictionary *dic2 = [[NSDictionary alloc]initWithObjectsAndKeys:@"测试123",@"detail",@"张亮",@"name",@"2016/1/1",@"time",@"armchair.png",@"image",nil];
    NSDictionary *dic3 = [[NSDictionary alloc]initWithObjectsAndKeys:@"再见",@"detail",@"杨光",@"name",@"2016/1/1",@"time",@"bandage.png",@"image",nil];
    NSDictionary *dic4 = [[NSDictionary alloc]initWithObjectsAndKeys:@"回车\n回车",@"detail",@"atany",@"name",@"2016/1/1",@"time",@"fingerprint.png",@"image",nil];

    _stuArray = [[NSArray alloc]initWithObjects:dic1, dic2, dic3, dic4, nil];


    self.chatToolBar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, statusbarH, self.view.bounds.size.width, toolbarH)];
    UIBarItem *item = [[UIBarButtonItem alloc]initWithTitle:@"微信" style:UIBarButtonItemStylePlain target:self action:nil];
    UIBarButtonItem *plusButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(dropdown)];
    UIBarButtonItem *spaceButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:      UIBarButtonSystemItemFixedSpace target:nil action:nil];
    [spaceButtonItem setWidth:self.view.bounds.size.width-100];

    [self.chatToolBar setItems:[NSArray arrayWithObjects:item,spaceButtonItem ,plusButtonItem,nil]animated:YES];




    self.chatListTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, statusbarH+toolbarH, self.view.bounds.size.width, self.view.bounds.size.height-49-44) style:UITableViewStylePlain];
    //设置代理
    self.chatListTableView.delegate = self;
    self.chatListTableView.dataSource = self;

    [self.view addSubview:self.chatToolBar];
    [self.view addSubview:self.chatListTableView];

}


- (void)dropdown{
    if(dropdownTabView==nil){
    dropdownTabView                 = [[UITableView alloc]initWithFrame:CGRectMake(self.view.bounds.size.width-100, statusbarH+toolbarH, 100, 50)];
    dropdownTabView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:dropdownTabView];
        [self.view setNeedsDisplay];
    }else if(dropdownTabView.hidden==NO){
        dropdownTabView.hidden =YES;
        [self.view setNeedsDisplay];
    }else{
        dropdownTabView.hidden =NO;
        [self.view setNeedsDisplay];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_stuArray count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *customCellIndentifier = @"CustomCellIndentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:customCellIndentifier];

    if(cell == nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:customCellIndentifier];

        CGRect nameRect = CGRectMake(88, 10, 70, 15);
        UILabel *nameLabel = [[UILabel alloc]initWithFrame:nameRect];
        nameLabel.tag = nameTag;
        nameLabel.textColor = [UIColor blackColor];
        nameLabel.font = [UIFont boldSystemFontOfSize:nameFontSize];
        [cell.contentView addSubview:nameLabel];

        CGRect detailRect = CGRectMake(88, 25, 200, 10);
        UILabel *detailLabel = [[UILabel alloc]initWithFrame:detailRect];
        detailLabel.tag = detailTag;
        detailLabel.textColor = [UIColor blackColor];
        detailLabel.font = [UIFont boldSystemFontOfSize:fontSize];
        [cell.contentView addSubview:detailLabel];


        CGRect timeRect = CGRectMake(188, 10, 70, 15);
        UILabel *timeLabel = [[UILabel alloc]initWithFrame:timeRect];
        timeLabel.tag = timeTag;
        timeLabel.textColor = [UIColor blackColor];
        timeLabel.font = [UIFont boldSystemFontOfSize:fontSize];
        [cell.contentView addSubview:timeLabel];



        CGRect imageRect = CGRectMake(10, 10, 25, 25);
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:imageRect];
        imageView.tag = imageTag;

        CALayer *layer = [imageView layer];
        layer.cornerRadius = 8;
        layer.borderColor = [[UIColor whiteColor]CGColor];
        layer.borderWidth = 1;
        layer.masksToBounds = YES;
        [cell.contentView addSubview:imageView];

    }
    NSUInteger row = [indexPath row];

    NSDictionary *dictionary = [_stuArray objectAtIndex:row];

    UIImageView *image = (UIImageView *)[cell.contentView viewWithTag:imageTag];
    image.image = [UIImage imageNamed:[dictionary objectForKey:@"image"]];

    UILabel *detail  = (UILabel *)[cell.contentView viewWithTag:detailTag];
    detail.text = [dictionary objectForKey:@"detail"];

    UILabel *time = (UILabel *)[cell.contentView viewWithTag:timeTag];
    time.text = [dictionary objectForKey:@"time"];

    UILabel *name = (UILabel *)[cell.contentView viewWithTag:nameTag];
    name.text = [dictionary objectForKey:@"name"];



    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
