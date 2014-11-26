//
//  CGWVideoViewController.h
//  Camera_gpuwatanuki2
//
//  Created by Takemi Watanuki on 2014/11/12.
//  Copyright (c) 2014年 Takemi Watanuki. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "GPUImage.h"

@interface CGWVideoViewController : UIViewController{
    GPUImageVideoCamera *videoCamera;
    GPUImageOutput<GPUImageInput> *filter;
    GPUImageMovieWriter *movieWriter;
}

@end
