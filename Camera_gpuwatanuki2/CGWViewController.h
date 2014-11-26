//
//  CGWViewController.h
//  Camera_gpuwatanuki2
//
//  Created by LiT026 on 2014/11/10.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//


#import <UIKit/UIKit.h>
#import <GPUImageView.h>
#import <GPUImage.h>

@interface CGWViewController : UIViewController

@property (weak, nonatomic) IBOutlet GPUImageView *imageView;
- (IBAction)changedSliderValue:(UISlider *)sender;
- (IBAction)changedSliderValue2:(UISlider *)sender;
- (IBAction)changedSliderValue3:(UISlider *)sender;

@end
