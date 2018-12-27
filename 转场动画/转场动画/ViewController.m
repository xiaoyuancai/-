//
//  ViewController.m
//  转场动画
//
//  Created by Yuan Le on 2018/12/27.
//  Copyright © 2018年 Yuan Le. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (nonatomic,strong)NSArray* imgArry;
@property (nonatomic,assign)NSInteger index;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _imgArry = @[@"view0",@"view1",@"view2"];
    _index = 0;

    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    _index++;
    if (_index >= _imgArry.count) {
        _index = 0;
    }
    _imageView.image = [UIImage imageNamed:_imgArry[_index]];
    
    CATransition* transition = [CATransition animation];
    transition.type = @"pageCurl";
    transition.duration = .5;
    [_imageView.layer addAnimation:transition forKey:nil];
}

@end
