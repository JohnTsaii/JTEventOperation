//
//  ViewController.m
//  CustomOperation
//
//  Created by John TSai on 2018/3/28.
//  Copyright © 2018年 CaoCao. All rights reserved.
//

#import "ViewController.h"

#import "JTEventOperation.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    view.backgroundColor = [UIColor blackColor];
    [self.view addSubview:view];
    
    NSOperationQueue *q = [[NSOperationQueue alloc] init];
    JTEventOperation *op1 = [JTEventOperation initWithAction:^(BOOL *end) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [UIView animateWithDuration:0.5 animations:^{
                view.backgroundColor = [UIColor redColor];
            } completion:^(BOOL finished) {
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    NSLog(@"this is op1");
                    
                    *end = YES;
                });
            }];
        });
    }];

    JTEventOperation *op2 = [JTEventOperation initWithAction:^(BOOL *end) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [UIView animateWithDuration:0.5 animations:^{
                view.backgroundColor = [UIColor yellowColor];
            } completion:^(BOOL finished) {
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    NSLog(@"this is op2");
                    
                    *end = YES;
                });
            }];
        });
    }];
    
    
    JTEventOperation *op3 = [JTEventOperation initWithAction:^(BOOL *end) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [UIView animateWithDuration:0.5 animations:^{
                view.backgroundColor = [UIColor grayColor];
            } completion:^(BOOL finished) {
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    NSLog(@"this is op3");
                    
                    *end = YES;
                });
            }];
        });
    }];
    
    
    JTEventOperation *op4 = [JTEventOperation initWithAction:^(BOOL *end) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [UIView animateWithDuration:0.5 animations:^{
                view.backgroundColor = [UIColor blueColor];
            } completion:^(BOOL finished) {
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    NSLog(@"this is op4");
                    
                    *end = YES;
                });
            }];
        });
    }];

    [op2 addDependency:op1];
    [op3 addDependency:op2];
    [op4 addDependency:op3];
    [q addOperation:op1];
    [q addOperation:op2];
    [q addOperation:op3];
    [q addOperation:op4];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.

}
@end
