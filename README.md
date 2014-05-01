POPdemo
=======

A simple demo for facebook's pop framework.

### pop一共有四个大类

    POPSpringAnimation  有弹性效果的动画类（个人比较喜欢这个）
    POPBasicAnimation 基本动画类
    POPDecayAnimation 衰减动画类
    POPCustomAnimation 可以自定义动画的类


### 导入pop
很简单，直接把pop文件夹拖到项目里，然后导入pop.h即可。

    #import "POP.h"

### 下面的代码示例用POPSpringAnimation做一个弹性放大-缩小的效果

        - (void)viewDidLoad
        {
           [super viewDidLoad];
           // Do any additional setup after loading the view from its nib.
    
          //添加手势
          UITapGestureRecognizer *gestureForSpring = [[UITapGestureRecognizer alloc] init];
          [gestureForSpring addTarget:self action:@selector(changeSize:)];
          [_springView addGestureRecognizer:gestureForSpring];

        }
