//
//  ViewController.m
//  objc-write-to-txt-file-sample
//
//  Created by devWill on 2019/06/29.
//  Copyright © 2019 devWill. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *message = @"File Create \nin Objective-C \n";
    
    NSString *documentDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSString *tmpDocumentDirectory = [documentDirectory stringByAppendingPathComponent:@"tmp"];
    NSString *filePath = [tmpDocumentDirectory stringByAppendingPathComponent:@"message.txt"];
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:tmpDocumentDirectory]) {
        [self create:tmpDocumentDirectory];
    }
    
    [self write:message toFile:filePath];
    
}

- (void) create:(NSString *)path {
    NSError *error = nil;
    BOOL result = [[NSFileManager defaultManager] createDirectoryAtPath:path
                                            withIntermediateDirectories:YES
                                                             attributes:nil
                                                                  error:&error];
    if (result) {
        NSLog(@"Create Success");
    } else {
        NSLog(@"%@", [error description]);
    }
}

- (void) write:(NSString *)message toFile:(NSString *)filePath {
    NSError *error = nil;
    BOOL result = [message writeToFile:filePath atomically:YES encoding:NSUTF8StringEncoding error:&error];
    if (result) {
        NSLog(@"Write Success");
    } else {
        NSLog(@"%@", [error description]);
    }
}


@end
