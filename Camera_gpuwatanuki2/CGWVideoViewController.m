//
//  CGWVideoViewController.m
//  Camera_gpuwatanuki2
//
//  Created by Takemi Watanuki on 2014/11/12.
//  Copyright (c) 2014年 Takemi Watanuki. All rights reserved.
//

#import "CGWVideoViewController.h"

@interface CGWVideoViewController ()

@end

@implementation CGWVideoViewController
-(void)viewDidAppear:(BOOL)animated{
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    videoCamera = [[GPUImageVideoCamera alloc] initWithSessionPreset:AVCaptureSessionPreset640x480 cameraPosition:AVCaptureDevicePositionFront];
    
    videoCamera.outputImageOrientation = UIInterfaceOrientationPortrait;
    videoCamera.horizontallyMirrorFrontFacingCamera = NO;
    videoCamera.horizontallyMirrorRearFacingCamera = NO;
    
    //    filter = [[GPUImageSepiaFilter alloc] init];
    
        filter = [[GPUImageTiltShiftFilter alloc] init];
        [(GPUImageTiltShiftFilter *)filter setTopFocusLevel:0.65];
        [(GPUImageTiltShiftFilter *)filter setBottomFocusLevel:0.85];
        [(GPUImageTiltShiftFilter *)filter setBlurRadiusInPixels:1.5];// setBlurSize:1.5];
        [(GPUImageTiltShiftFilter *)filter setFocusFallOffRate:0.2];
    
//        filter = [[GPUImageSketchFilter alloc] init];
//    filter = [[GPUImageColorInvertFilter alloc] init];
    //    filter = [[GPUImageSmoothToonFilter alloc] init];
    //    GPUImageRotationFilter *rotationFilter = [[GPUImageRotationFilter alloc] initWithRotation:kGPUImageRotateRightFlipVertical];
    
    [videoCamera addTarget:filter];
    GPUImageView *filterView = (GPUImageView *)self.view;
    //    filterView.fillMode = kGPUImageFillModeStretch;
    //    filterView.fillMode = kGPUImageFillModePreserveAspectRatioAndFill;
    
    
    
    
    // Record a movie for 10 s and store it in /Documents, visible via iTunes file sharing
    
    
    
    NSString *pathToMovie = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/Movie.m4v"];
    unlink([pathToMovie UTF8String]); // If a file already exists, AVAssetWriter won't let you record new frames, so delete the old movie
    NSURL *movieURL = [NSURL fileURLWithPath:pathToMovie];
    
    
    
    
    //ムービーサイズを指定
    movieWriter = [[GPUImageMovieWriter alloc] initWithMovieURL:movieURL size:CGSizeMake(480.0, 640.0)];
    
    movieWriter.encodingLiveVideo = YES;
    //    movieWriter = [[GPUImageMovieWriter alloc] initWithMovieURL:movieURL size:CGSizeMake(640.0, 480.0)];
    //    movieWriter = [[GPUImageMovieWriter alloc] initWithMovieURL:movieURL size:CGSizeMake(720.0, 1280.0)];
    //    movieWriter = [[GPUImageMovieWriter alloc] initWithMovieURL:movieURL size:CGSizeMake(1080.0, 1920.0)];
    [filter addTarget:movieWriter];
    [filter addTarget:filterView];
    
    [videoCamera startCameraCapture];
    
    
    //カメラで映像を記録しているみたいだからコメントあうと!!
    /*
    
    
    double delayToStartRecording = 0.5;
    dispatch_time_t startTime = dispatch_time(DISPATCH_TIME_NOW, delayToStartRecording * NSEC_PER_SEC);
    dispatch_after(startTime, dispatch_get_main_queue(), ^(void){
        NSLog(@"Start recording");
        
        videoCamera.audioEncodingTarget = movieWriter;
        [movieWriter startRecording];
        
        //        NSError *error = nil;
        //        if (![videoCamera.inputCamera lockForConfiguration:&error])
        //        {
        //            NSLog(@"Error locking for configuration: %@", error);
        //        }
        //        [videoCamera.inputCamera setTorchMode:AVCaptureTorchModeOn];
        //        [videoCamera.inputCamera unlockForConfiguration];
        
        double delayInSeconds = 10.0;
        dispatch_time_t stopTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
        dispatch_after(stopTime, dispatch_get_main_queue(), ^(void){
            
            [filter removeTarget:movieWriter];
            videoCamera.audioEncodingTarget = nil;
            [movieWriter finishRecording];
            NSLog(@"Movie completed");
            
            //            [videoCamera.inputCamera lockForConfiguration:nil];
            //            [videoCamera.inputCamera setTorchMode:AVCaptureTorchModeOff];
            //            [videoCamera.inputCamera unlockForConfiguration];
        });
    });
    
    
    */
    
    
}





- (void)viewDidLoad {
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(IBAction)back{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)one:(id)sender {
    NSLog(@"1");
    
    [videoCamera removeAllTargets];
    [filter removeAllTargets];
    filter = [[GPUImageSketchFilter alloc] init];
    GPUImageView *filterView = (GPUImageView *)self.view;
    [filter addTarget:filterView];
    [videoCamera addTarget:filter];
}

- (IBAction)two:(id)sender {
    NSLog(@"2");
    
    [videoCamera pauseCameraCapture];
    [videoCamera removeAllTargets];
    [filter removeAllTargets];
    filter = [[GPUImagePolkaDotFilter alloc]init];
    GPUImageView *filterView = (GPUImageView *)self.view;
    [filter addTarget:filterView];
    [videoCamera addTarget:filter];
    [videoCamera resumeCameraCapture];

}

- (IBAction)three:(id)sender {
    NSLog(@"3");
    [videoCamera pauseCameraCapture];
    [videoCamera removeAllTargets];
    [filter removeAllTargets];
    filter = [[GPUImage3x3ConvolutionFilter alloc]init];
    GPUImageView *filterView = (GPUImageView *)self.view;
    [filter addTarget:filterView];
    [videoCamera addTarget:filter];
    [videoCamera resumeCameraCapture];
}

- (IBAction)four:(id)sender {
    NSLog(@"4");
    [videoCamera removeAllTargets];
    [filter removeAllTargets];
    filter = [[GPUImageSwirlFilter alloc]init];
    GPUImageView *filterView = (GPUImageView *)self.view;
    [filter addTarget:filterView];
    [videoCamera addTarget:filter];
}
- (IBAction)off:(id)sender {

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
