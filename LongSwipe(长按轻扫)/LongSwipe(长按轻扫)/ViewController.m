//
//  ViewController.m
//  LongSwipe(长按轻扫)
//
//  Created by AmberWhiteSky on 15/10/2.
//  Copyright © 2015年 AmberWhiteSky. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *tkimage;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
//    [self  longtest];
    
//    [self  testSwipe];
    
    UIRotationGestureRecognizer *amrotat =[[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(roateview:)];
    
    
    [self.tkimage  addGestureRecognizer:amrotat];
    
    
}

//旋转
-(void)roateview: (UIRotationGestureRecognizer *) amrotat{
    
    self.tkimage.transform =CGAffineTransformMakeRotation(amrotat.rotation);
    
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
