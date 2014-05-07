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

```objective-c
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
- 
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
```

### 效果如下
![image](https://github.com/jxd001/POPdemo/blob/master/TestPop/Untitled1.gif?raw=true)


### 上面的代码是改变view的size，下面示例改变position
```objective-c
 POPSpringAnimation *springAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPosition];
    
    CGPoint point = _springView.center;

    if (point.y==240) {
        springAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(point.x, -230)];
    }
    else{
        springAnimation.toValue = [NSValue valueWithCGSize:CGSizeMake(point.x, 240)];
    }
    
    //弹性值
    springAnimation.springBounciness = 20.0;
    //弹性速度
    springAnimation.springSpeed = 20.0;
    
    [_springView pop_addAnimation:springAnimation forKey:@"changeposition"];
```

### 一个比较实用的效果，弹出菜单：
![image](https://github.com/jxd001/POPdemo/blob/master/TestPop/Untitled3.gif?raw=true)
代码如下：
```objective-c

self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"+" style:UIBarButtonItemStyleDone target:self action:@selector(showPop)];


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

```
