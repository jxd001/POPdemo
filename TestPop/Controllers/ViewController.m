//
//  ViewController.m
//  TestPop
//
//  Created by XuDong Jin on 14-5-1.
//  Copyright (c) 2014年 XuDong Jin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSArray *dataArray;
}
@end

@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    NSDictionary *springDic = @{@"type":@"POPSpringAnimation",@"animations":@[@"kPOPLayerSize",@"kPOPLayerPosition",@"kPOPViewFrame"]};
    NSDictionary *basicDic = @{@"type":@"POPBasicAnimation",@"animations":@[@"kPOPViewAlpha"]};
    NSDictionary *combinDic = @{@"type":@"CombineAnimation",@"animations":@[@" POPbox"]};
    
    dataArray = @[springDic,basicDic,combinDic];

    
    self.title = @"POP";
    
    
    /*
    POPSpringAnimation  有弹簧效果的动画类
    
    POPBasicAnimation 基本动画类
    
    POPDecayAnimation 衰减动画类
    
    POPCustomAnimation 可以自定义动画的类
     */
}

#pragma mark - UITableView Datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UILabel *senctionHeader = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 30)];
    senctionHeader.text = dataArray[section][@"type"];
    senctionHeader.backgroundColor = [UIColor lightGrayColor];
    senctionHeader.textAlignment = NSTextAlignmentCenter;
    senctionHeader.textColor = [UIColor whiteColor];
    senctionHeader.font = [UIFont systemFontOfSize:14];
    return senctionHeader;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *animations = dataArray[section][@"animations"];
    return animations.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    NSArray *animations = dataArray[indexPath.section][@"animations"];

    cell.textLabel.text = animations[indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:13];
    
    return cell;
}

#pragma mark - UITableView Delegate methods

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *sectionName = dataArray[indexPath.section][@"type"];
    NSString *classNamePre = [sectionName stringByReplacingOccurrencesOfString:@"Animation" withString:@""];
    NSArray *animations = dataArray[indexPath.section][@"animations"];
    NSString *classNameSuf = [animations[indexPath.row] substringFromIndex:1];
    NSString *classNmae = [classNamePre stringByAppendingString:classNameSuf];
    
    Class class = NSClassFromString([classNamePre stringByAppendingString:classNameSuf]);
    
    UIViewController *ctrl = [[class alloc] initWithNibName:classNmae bundle:nil];
    ctrl.title = classNameSuf;
    
    [self.navigationController pushViewController:ctrl animated:YES];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
