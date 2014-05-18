//
//  POPSpringPOPLayerPosition.m
//  TestPop
//
//  Created by XuDong Jin on 14-5-1.
//  Copyright (c) 2014年 XuDong Jin. All rights reserved.
//

#import "POPSpringPOPLayerPosition.h"

@interface POPSpringPOPLayerPosition ()

@end

@implementation POPSpringPOPLayerPosition

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
    [gestureForSpring addTarget:self action:@selector(changePosition:)];
    [self.view addGestureRecognizer:gestureForSpring];
}

- (void)changePosition:(UITapGestureRecognizer*)tap{

    POPSpringAnimation *springAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPosition];
    
    CGPoint point = _springView.center;

    if (point.y==240) {
        springAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(point.x, -230)];
    }
    else{
        springAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(point.x, 240)];
    }
    
    //弹性值
    springAnimation.springBounciness = 20.0;
    //弹性速度
    springAnimation.springSpeed = 20.0;
    
    [_springView pop_addAnimation:springAnimation forKey:@"changeposition"];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
