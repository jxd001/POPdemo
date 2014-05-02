//
//  CombinePOPbox.h
//  TestPop
//
//  Created by XuDong Jin on 14-5-2.
//  Copyright (c) 2014年 XuDong Jin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CombinePOPbox : UIViewController

@property (strong, nonatomic) UIImageView *popView;

@property (assign, nonatomic) CGRect showPosition;

@property (assign, nonatomic) CGRect hidePosition;

@property (assign, nonatomic) BOOL isOpened;


- (void)showPop;

- (void)hidePop;

@end
