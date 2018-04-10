//
//  JTEventOperation.m
//  CustomOperation
//
//  Created by John TSai on 2018/3/28.
//  Copyright © 2018年 CaoCao. All rights reserved.
//

#import "JTEventOperation.h"

@interface JTEventOperation () <NSMachPortDelegate>

@property (nonatomic, copy)  JTEventOperationBlock block;
@property (nonatomic, assign) BOOL end;

@end

@implementation JTEventOperation

@synthesize name = _name;
@synthesize isFinished = _isFinished;
@synthesize isExecuting = _isExecuting;

+ (instancetype)initWithAction:(JTEventOperationBlock)block {
    JTEventOperation *op = [[JTEventOperation alloc] init];
    op.block = block;
    return op;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.isExecuting = NO;
        self.isFinished = NO;
    }
    return self;
}

- (void)start {
    
    if (self.block) {
        self.block(&_end);
    }
    self.isExecuting = YES;
    
    while (!self.end) {
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate dateWithTimeIntervalSinceNow:0.1]];
    }
    
    self.isExecuting = NO;
    self.isFinished = YES;
    
}

- (BOOL)isAsynchronous {
    return YES;
}

- (BOOL)isConcurrent {
    return NO;
}


@end
