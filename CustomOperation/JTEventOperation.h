//
//  JTEventOperation.h
//  CustomOperation
//
//  Created by John TSai on 2018/3/28.
//  Copyright © 2018年 CaoCao. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^JTEventOperationBlock)(BOOL *end);

@interface JTEventOperation : NSOperation

@property (nonatomic) BOOL isFinished;
@property (nonatomic) BOOL isExecuting;

+ (instancetype)initWithAction:(JTEventOperationBlock)block;

@end
