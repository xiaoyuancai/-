//
//  ViewController.m
//  Amition
//
//  Created by Yuan Le on 2018/12/25.
//  Copyright © 2018年 Yuan Le. All rights reserved.
//

#import "ViewController.h"
#import "MyView.h"

@interface ViewController ()<CAAnimationDelegate>
@property (weak, nonatomic) IBOutlet MyView *redView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction)];
    [_redView addGestureRecognizer:tap];
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
 
    CABasicAnimation* anim = [CABasicAnimation animation];
    anim.keyPath = @"position.y";
    anim.toValue = @400;
    anim.removedOnCompletion = NO;
    anim.fillMode = kCAFillModeForwards;
    anim.delegate = self;
    [_redView.layer addAnimation:anim forKey:nil];
    
    
    CALayer* tmp = [CALayer new];
    tmp.frame = CGRectMake(200, 100, 100, 100);
    tmp.backgroundColor = [UIColor yellowColor].CGColor;
    [self.view.layer addSublayer:tmp];
    
    tmp.frame = CGRectMake(200, 100, 50,50);
    
}

-(void)animationDidStart:(CAAnimation *)anim{
    NSLog(@"start = %@",NSStringFromCGRect(_redView.layer.presentationLayer.frame));

}

-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    NSLog(@"stop = %@",NSStringFromCGRect(_redView.layer.presentationLayer.frame));

}



@end
