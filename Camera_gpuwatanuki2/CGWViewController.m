//
//  CGWViewController.m
//  Camera_gpuwatanuki2
//
//  Created by LiT026 on 2014/11/10.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "CGWViewController.h"

@interface CGWViewController ()

// あとで変更が必要あなものをインスタンス変数にする
@property(nonatomic) GPUImagePicture *imagePicture;
@property(nonatomic) GPUImageContrastFilter *contrastFilter;
@property(nonatomic) GPUImageMonochromeFilter *monochromFilter;
@property(nonatomic) GPUImageSaturationFilter *saturationFilter;

@property(nonatomic) GPUImageFilterGroup *filterGroup;

@end

@implementation CGWViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    // 画像を作る
    UIImage *image = [UIImage imageNamed:@"954690_718052348278316_5391308107826475792_n.jpg"];
    self.imagePicture = [[GPUImagePicture alloc] initWithImage:image];
    
    // コントラストフィルター
    self.contrastFilter = [[GPUImageContrastFilter alloc] init];
    // コントラストを設定する。コントラストは0~4の間の値で、1が普通
    [self.contrastFilter setContrast:1];
    
    // 画像 → コントラストフィルターをつなげる
    [self.imagePicture addTarget:self.contrastFilter];
    
    // コントラストフィルター → imageViewをつなげる
    [self.contrastFilter addTarget:self.imageView];
    
    // フィルター実行！
    [self.imagePicture processImage];
    
    
  /*
    
    //////////////////////////////////////////////////
    
    // モノクロフィルター
    self.monochromFilter = [[GPUImageMonochromeFilter alloc] init];
    // モノクロフィルターのカラー設定
    [self.monochromFilter setColor:(GPUVector4){0.3f, 0.3f, 0.3f, 0.2f}];
    // イメージにモノクロフィルターを加える
    [self.contrastFilter addTarget:self.monochromFilter];
    
    
    //////////////////////////////////////////////////

    // コントラストフィルター
    self.saturationFilter = [[GPUImageSaturationFilter alloc] init];
    [self.saturationFilter setSaturation:1.9];
    
    // 画像 → コントラストフィルターをつなげる
    //[self.monochromFilter addTarget:self.saturationFilter];
    
    // コントラストフィルター → imageViewをつなげる
    //[self.contrastFilter addTarget:self.imageView];
    
    
    
    self.filterGroup=[[GPUImageFilterGroup alloc] init];
    //効果を掛けたいフィルタから順に記述
    [self.filterGroup addFilter:self.contrastFilter];
    //[self.filterGroup addFilter:self.saturationFilter];
    [self.filterGroup addFilter:self.monochromFilter];
    
    
    //フィルタグループを設定
    //一番最初のフィルターを設定
    [self.filterGroup setInitialFilters:@[self.contrastFilter]];
    
    //[self.filterGroup setInitialFilters:@[self.saturationFilter]];
    
    //一番最後のフィルターを設定
    [self.filterGroup setTerminalFilter:self.monochromFilter];
    
    //フィルタ同士を追加する
   // [self.contrastFilter addTarget:self.saturationFilter];
    //[self.saturationFilter addTarget:self.monochromFilter];
    [self.monochromFilter addTarget:self.contrastFilter];
    [self.contrastFilter addTarget:self.monochromFilter];
      
    //GPUImagePictureにフィルタグループを追加
    [self.imagePicture addTarget:self.filterGroup];
    
    // フィルタ実行
    [self.imagePicture processImage];
    // 実行したフィルタから、画像を取得する
  //[self.filterGroup imageFromCurrentlyProcessedOutput];
    [self.imagePicture addTarget:self.filterGroup];
    [self.imagePicture processImage];
    
    
    
    
    */
    
    // 取得した画像をセット
  //  [self.imagePicture
    
    
   
    
    
    
    
    
    



//    UIImage *outputImage
    //self.imagePicture= [self.saturationFilter imageFromCurrentlyProcessedOutput];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)changedSliderValue:(UISlider *)sender {

     NSLog(@"%f", sender.value);

    // コントラストをスライダーの値にする
    [self.contrastFilter setContrast:sender.value*2];
    
    // フィルターを実行する
    [self.imagePicture processImage];
    
}

- (IBAction)changedSliderValue2:(UISlider *)sender {
    
    // コントラストをスライダーの値にする
    [self.monochromFilter setColor:(GPUVector4){sender.value*0.3f, sender.value*0.3f, sender.value*0.3f,sender.value* 0.2f}];
    
    // フィルターを実行する
    [self.imagePicture processImage];
}

- (IBAction)changedSliderValue3:(UISlider *)sender {
    [self.saturationFilter setSaturation:sender.value*2];
    
}

@end
