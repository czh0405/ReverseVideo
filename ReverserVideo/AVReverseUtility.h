//
//  AVReverseUtility.h
//
//  Created by chengzhao on 2018/11/12.
//  Copyright © 2018年 chengzhao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

typedef void(^ReverseCallBack)(AVAssetWriterStatus status, float progress, NSError *error);

@interface AVReverseUtility : NSObject

- (instancetype)initWithAsset:(AVAsset *)asset outputPath:(NSString *)path;

- (void)startProcessing;

- (void)cancelProcessing;

@property (nonatomic, copy) ReverseCallBack callBack;

@property (nonatomic, assign) CMTimeRange timeRange;

@end
