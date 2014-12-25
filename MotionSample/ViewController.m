//
//  ViewController.m
//  MotionSample
//
//  Created by jollyjoester_pro on 2014/12/25.
//  Copyright (c) 2014年 jollyjoester. All rights reserved.
//

#import "ViewController.h"
#import <CoreMotion/CoreMotion.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *xAc;
@property (weak, nonatomic) IBOutlet UILabel *yAc;
@property (weak, nonatomic) IBOutlet UILabel *zAc;
@property (weak, nonatomic) IBOutlet UIImageView *image;
@end

@implementation ViewController {
    CMMotionManager *motionManager;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    motionManager = [CMMotionManager new];
    
    if (motionManager.accelerometerAvailable) {
        motionManager.accelerometerUpdateInterval = 0.1;
    }
    
    CMAccelerometerHandler handler = ^(CMAccelerometerData *data, NSError *error){
        
        _xAc.text = [NSString stringWithFormat:@"x %f", data.acceleration.x];
        _yAc.text = [NSString stringWithFormat:@"y %f", data.acceleration.y];
        _zAc.text = [NSString stringWithFormat:@"z %f", data.acceleration.z];
        
        float xB = data.acceleration.x * 100;
        float yB = data.acceleration.y * 100;
        
        CGAffineTransform t1 = CGAffineTransformMakeTranslation(xB, yB);
        _image.transform = t1;
        
    };
    
    [motionManager startAccelerometerUpdatesToQueue:[NSOperationQueue currentQueue] withHandler:handler];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
