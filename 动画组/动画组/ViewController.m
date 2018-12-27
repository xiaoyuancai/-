//
//  ViewController.m
//  动画组
//
//  Created by Yuan Le on 2018/12/27.
//  Copyright © 2018年 Yuan Le. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

-(void)test{
    UIBezierPath* bPath = [UIBezierPath bezierPath];
    [bPath moveToPoint:CGPointMake(50, 200)];
    [bPath addCurveToPoint:CGPointMake(350, 200) controlPoint1:CGPointMake(150, 100) controlPoint2:CGPointMake(250, 300)];
    
    CAShapeLayer* shapelayer = [CAShapeLayer layer];
    shapelayer.path = bPath.CGPath;
    shapelayer.fillColor = nil;
    shapelayer.strokeColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:shapelayer];
    
    
    CALayer* layer = [CALayer layer];
    layer.frame = CGRectMake(0, 150, 50, 50);
    layer.position = CGPointMake(50, 200);
    layer.backgroundColor = [UIColor blueColor].CGColor;
    [self.view.layer addSublayer:layer];
    
    CAKeyframeAnimation* keyAnim = [CAKeyframeAnimation animation];
    keyAnim.path = bPath.CGPath;
    keyAnim.keyPath = @"position";
//    keyAnim.removedOnCompletion = NO;
//    keyAnim.fillMode = kCAFillModeForwards;
//    keyAnim.duration = 4;
//    [layer addAnimation:k eyAnim forKey:nil];
    
    CABasicAnimation* scalAnim = [CABasicAnimation animation];
    scalAnim.keyPath = @"transform.scale";
    scalAnim.toValue = @0.5f;
//    scalAnim.removedOnCompletion = NO;
//    scalAnim.fillMode = kCAFillModeForwards;
//    scalAnim.duration = 4;
//    [layer addAnimation:scalAnim forKey:nil];
    
    CGFloat redC = arc4random()/(CGFloat)INT_MAX;
    CGFloat greenC = arc4random()/(CGFloat)INT_MAX;
    CGFloat blueC = arc4random()/(CGFloat)INT_MAX;
    UIColor* colo = [UIColor colorWithRed:redC green:greenC blue:blueC alpha:1.0];
    
    CABasicAnimation* colorAnim = [CABasicAnimation animation];
    colorAnim.keyPath = @"backgroundColor";
    colorAnim.toValue = (id)colo.CGColor;
//    colorAnim.removedOnCompletion = NO;
//    colorAnim.fillMode = kCAFillModeForwards;
//    colorAnim.duration = 4;
//    [layer addAnimation:colorAnim forKey:nil];

    
    CAAnimationGroup* animGroup = [CAAnimationGroup animation];
    animGroup.animations = @[keyAnim,scalAnim,colorAnim];
    animGroup.removedOnCompletion = NO;
    animGroup.fillMode = kCAFillModeForwards;
    animGroup.duration = 4.0f;
    [layer addAnimation:animGroup forKey:nil];
    
    
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self test];
}
@end
