//
//  POPBasicPOPViewAlpha.m
//  TestPop
//
//  Created by XuDong Jin on 14-5-1.
//  Copyright (c) 2014年 XuDong Jin. All rights reserved.
//

#import "POPBasicPOPViewAlpha.h"

@interface POPBasicPOPViewAlpha ()

@end

@implementation POPBasicPOPViewAlpha

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
    [gestureForSpring addTarget:self action:@selector(changeAlpha:)];
    [self.view addGestureRecognizer:gestureForSpring];

}

- (void)changeAlpha:(UITapGestureRecognizer*)tap{

    POPBasicAnimation *anim = [POPBasicAnimation animationWithPropertyNamed:kPOPViewAlpha];
    
    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];

    float alpha = _basicView.alpha;
    if (alpha==1.0) {
        anim.toValue = @(0.0);
    }
    else{
        anim.toValue = @(1.0);
    }
    
    [_basicView pop_addAnimation:anim forKey:@"alpha"];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
