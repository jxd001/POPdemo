//
//  POPSpringPOPViewFrame.m
//  TestPop
//
//  Created by XuDong Jin on 14-5-1.
//  Copyright (c) 2014年 XuDong Jin. All rights reserved.
//

#import "POPSpringPOPViewFrame.h"

@interface POPSpringPOPViewFrame ()

@end

@implementation POPSpringPOPViewFrame

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
    //添加手势
    UIPanGestureRecognizer *gesture = [[UIPanGestureRecognizer alloc] init];
    [gesture addTarget:self action:@selector(changeSize:)];
    [self.view addGestureRecognizer:gesture];
    
}

- (void)changeSize:(UIPanGestureRecognizer*)tap{

    POPSpringAnimation *springAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewFrame];
    
    CGPoint point = [tap locationInView:self.view];
    
    springAnimation.toValue = [NSValue valueWithCGRect:CGRectMake(0, 0, point.x, point.y)];
    
    
    //弹性值
    springAnimation.springBounciness = 20.0;
    //弹性速度
    springAnimation.springSpeed = 20.0;
    
    [_springView pop_addAnimation:springAnimation forKey:@"changeframe"];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
