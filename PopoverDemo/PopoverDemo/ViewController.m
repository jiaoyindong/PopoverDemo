//
//  ViewController.m
//  PopoverDemo
//
//  Created by qianfeng on 15/9/15.
//  Copyright (c) 2015年 jydong. All rights reserved.
//

#import "ViewController.h"
#import "MyTableViewController.h"

@interface ViewController ()
- (IBAction)popItemClick:(id)sender;
- (IBAction)btnClick:(id)sender;
@property (nonatomic,strong) UIPopoverController *popOver;
@property (strong, nonatomic) IBOutlet UIButton *button;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (void)popoverInit {
    //创建泡泡
    //懒加载模式 需要对象的时候在创建 总共创建一次
    if (self.popOver == nil) {
        MyTableViewController *table = [[MyTableViewController alloc]initWithStyle:UITableViewStylePlain];
        //创建泡泡 设置内容视图
        self.popOver = [[UIPopoverController alloc]initWithContentViewController:table];
        //设置弹出内容的大小 气泡的大小
        self.popOver.popoverContentSize = CGSizeMake(200, 200);
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)popItemClick:(UIBarButtonItem *)sender {
    [self popoverInit];
    //从item弹出
    [_popOver presentPopoverFromBarButtonItem:sender permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
}

- (IBAction)btnClick:(id)sender {
    [self popoverInit];
    //点击 弹出气泡
    //在某个view上弹出泡泡
    /*
     1.从哪个区域弹出 2.从哪个视图弹出 3.三角标的方向
     */
    [_popOver presentPopoverFromRect:CGRectMake(0, 0, self.button.frame.size.width, self.button.frame.size.height) inView:self.button permittedArrowDirections:UIPopoverArrowDirectionDown animated:YES];
}
@end
