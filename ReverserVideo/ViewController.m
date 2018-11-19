//
//  ViewController.m
//  ReverserVideo
//
//  Created by chengzhao on 2018/11/14.
//  Copyright © 2018年 chengzhao. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

#import "AVUtilities.h"
#import "AVReverseUtility.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions
- (IBAction)reverseClipBtnPressed:(id)sender {
    NSString *sourceFilePath = [[NSBundle mainBundle] pathForResource:@"720x1280_25_44s.mp4" ofType:nil];
    NSURL *sourceFileURL = [NSURL fileURLWithPath:sourceFilePath];
    
//    AVAsset *originalAsset = [[AVURLAsset alloc] initWithURL:sourceFileURL options:nil];
    AVAsset *originalAsset = [AVURLAsset URLAssetWithURL:sourceFileURL options:nil];
    
    NSDate *date=[NSDate date];//获取当前时间
    NSDateFormatter *formatTime =[[NSDateFormatter alloc]init];
    [formatTime setDateFormat:@"yyyy-MM-dd_HH:mm:ss"];
    NSString *strTime=[formatTime stringFromDate:date];
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentPath = [paths objectAtIndex:0];
    NSString *filePath = [NSString stringWithFormat:@"%@/%@.mp4", documentPath, strTime];
    
    // 第一种方法，读取源文件的整个文件，都缓存下来，然后写反着写文件
    // 此方法对短文件可以，如果是长文件就会有占用内存
//    NSURL *reverseVideoURL = [NSURL fileURLWithPath:filePath];
//    AVURLAsset *reversedAsset = [AVUtilities assetByReversingAsset:originalAsset outputURL:reverseVideoURL];
    
    // 第二种方法
    
    AVReverseUtility *reverseUtility = [[AVReverseUtility alloc] initWithAsset:originalAsset outputPath:filePath];
    
    [reverseUtility startProcessing];
}

@end
