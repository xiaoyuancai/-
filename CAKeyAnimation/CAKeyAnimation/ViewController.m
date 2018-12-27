//
//  ViewController.m
//  CAKeyAnimation
//
//  Created by Yuan Le on 2018/12/26.
//  Copyright © 2018年 Yuan Le. All rights reserved.
//

#import "ViewController.h"

#define angleToRadias(angle) ((angle)/(180*M_PI))

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *userImage;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

}

//过山车
-(void)test{

    UIBezierPath* path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(50, 100)];
    [path addCurveToPoint:CGPointMake(350, 100) controlPoint1:CGPointMake(150, 50) controlPoint2:CGPointMake(250, 150)];
    
    CAShapeLayer* layer = [CAShapeLayer layer];
    layer.path = path.CGPath;
    layer.fillColor = nil;
    layer.strokeColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:layer];
    
    CALayer* carLayer = [CALayer layer];
    carLayer.contents = (id)[UIImage imageNamed:@"car"].CGImage;
    carLayer.frame = CGRectMake(0, 100-20, 36, 36);
    carLayer.anchorPoint = CGPointMake(0, 0.7);

    [self.view.layer addSublayer:carLayer];
    
    CAKeyframeAnimation* carAnimation = [CAKeyframeAnimation animation];
    carAnimation.path = path.CGPath;
    carAnimation.keyPath = @"position";
    carAnimation.rotationMode = kCAAnimationRotateAuto;
    carAnimation.duration = 4;
    carAnimation.removedOnCompletion = NO;
    carAnimation.fillMode = kCAFillModeForwards;
    [carLayer addAnimation:carAnimation forKey:nil];
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    CAKeyframeAnimation* anim = [CAKeyframeAnimation animation];
    anim.keyPath = @"transform.rotation";
    anim.repeatCount = MAX_CANON;
    anim.values = @[@angleToRadias(-15),@angleToRadias(15)];
    anim.autoreverses = YES;
    anim.speed = 2;
    [_userImage.layer addAnimation:anim forKey:nil];
    
    
    [self test];
}
@end
