//
//  SpringAnimateCtrl.m
//  TestPop
//
//  Created by XuDong Jin on 14-5-1.
//  Copyright (c) 2014年 XuDong Jin. All rights reserved.
//

#import "POPSpringPOPLayerSize.h"

@interface POPSpringPOPLayerSize ()

@end

@implementation POPSpringPOPLayerSize

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
    UITapGestureRecognizer *gestureForSpring = [[UITapGestureRecognizer alloc] init];
    [gestureForSpring addTarget:self action:@selector(changeSize:)];
    [_springView addGestureRecognizer:gestureForSpring];
    
}

- (void)changeSize:(UITapGestureRecognizer*)tap{
    //用POPSpringAnimation 让viewBlue实现弹性放大缩小的效果
    POPSpringAnimation *springAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerSize];
    
    CGRect rect = _springView.frame;
    if (rect.size.width==100) {
        springAnimation.toValue = [NSValue valueWithCGSize:CGSizeMake(300, 300)];
    }
    else{
        springAnimation.toValue = [NSValue valueWithCGSize:CGSizeMake(100, 100)];
    }
    

    //弹性值
    springAnimation.springBounciness = 20.0;
    //弹性速度
    springAnimation.springSpeed = 20.0;

    [_springView.layer pop_addAnimation:springAnimation forKey:@"changesize"];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
