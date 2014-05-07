//
//  CombinePOPbox.m
//  TestPop
//
//  Created by XuDong Jin on 14-5-2.
//  Copyright (c) 2014年 XuDong Jin. All rights reserved.
//

#import "CombinePOPbox.h"

@interface CombinePOPbox ()

@end

@implementation CombinePOPbox

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
    
    _showPosition = CGRectMake(320-147, 5, 147, 160);
    _hidePosition = CGRectMake(320, 5, 0, 0);
    
    _popView = [[UIImageView alloc] initWithFrame:_hidePosition];
    _popView.image = [UIImage imageNamed:@"menu.png"];
    [self.view addSubview:_popView];

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"+" style:UIBarButtonItemStyleDone target:self action:@selector(showPop)];
    
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)]) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    
}

- (void)showPop{
    
    if (_isOpened) {
        [self hidePop];
        return;
    }
    _isOpened = YES;
    
    POPSpringAnimation *positionAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewFrame];
    positionAnimation.fromValue = [NSValue valueWithCGRect:_hidePosition];
    positionAnimation.toValue = [NSValue valueWithCGRect:_showPosition];
    positionAnimation.springBounciness = 15.0f;
    positionAnimation.springSpeed = 20.0f;
    [_popView pop_addAnimation:positionAnimation forKey:@"frameAnimation"];
}

- (void)hidePop{
    
    POPBasicAnimation *positionAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPViewFrame];
    positionAnimation.fromValue = [NSValue valueWithCGRect:_showPosition];
    positionAnimation.toValue = [NSValue valueWithCGRect:_hidePosition];
    [_popView pop_addAnimation:positionAnimation forKey:@"frameAnimation"];
 
    _isOpened = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
