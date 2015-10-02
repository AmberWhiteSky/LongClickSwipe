//
//  ViewController.m
//  LongSwipe(长按轻扫)
//
//  Created by AmberWhiteSky on 15/10/2.
//  Copyright © 2015年 AmberWhiteSky. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIGestureRecognizerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *tkimage;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    //    [self  longtest];
    
    //    [self  testSwipe];
    
  
    
    [self pinchView];
    [self roate];
    
    
}

#pragma   mark  手势的代理方法
//是否允许多个手势识别器同时有效
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    
    
    return  YES;

}





//捏合手势
-(void)  pinchView{
    UIPinchGestureRecognizer  *pich=[[UIPinchGestureRecognizer  alloc]  initWithTarget:self action:@selector(pinchClick: )];
    pich.delegate=self;
    [self.tkimage addGestureRecognizer:pich];
    
}

//捏合
-(void)pinchClick:(UIPinchGestureRecognizer  *)pinch{
    
    pinch.view.transform =CGAffineTransformScale(pinch.view.transform, pinch.scale, pinch.scale);
    
    pinch.scale=1;//这个很重要
    
    
}

-(void) roate{
    UIRotationGestureRecognizer *amrotat =[[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(roateview:)];
    amrotat.delegate=self;
    [self.tkimage  addGestureRecognizer:amrotat];
}


//旋转
-(void)roateview: (UIRotationGestureRecognizer *) amrotat{
    
    //    self.tkimage.transform =CGAffineTransformMakeRotation(amrotat.rotation);
    self.tkimage.transform = CGAffineTransformRotate(self.tkimage.transform, amrotat.rotation);
    
    amrotat.rotation=0;//这个很重要
    
    
}

//轻扫
-(void) testSwipe{
    UISwipeGestureRecognizer *swipe =[[UISwipeGestureRecognizer  alloc] initWithTarget:self action:@selector(swipeclick)];
    
    swipe.direction  =UISwipeGestureRecognizerDirectionLeft;
    //    [self.redView  addGestureRecognizer:swipe];
    
}


-(void)swipeclick{
    NSLog(@"swipe");
    
}

-(void)longtest{
    
    //声明长按手势的对象
    UILongPressGestureRecognizer  *longPress =[[UILongPressGestureRecognizer  alloc] init];
    
    //给对象添加监听事件
    [longPress  addTarget:self action:@selector(longpressVIew)];
    
    //设置长按的时间
    longPress.minimumPressDuration =2;
    
    //在触发手势之前， 50px 范围内长按有效
    longPress.allowableMovement=10;
    
    //把对象设置给监听的对象
    //    [self.redView addGestureRecognizer:longPress];
}

-(void)  longpressVIew {
    NSLog(@"长按了红色的view");
}


@end
