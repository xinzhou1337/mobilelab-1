//
//  Colors.m
//  mobilelab
//
//  Created by Ilya Zimonin on 30/09/2018.
//  Copyright © 2018 Ilya Zimonin. All rights reserved.
//

#import "Colors.h"

@implementation Colors

@synthesize navigationBackground = _navigationBackground;

+(instancetype)sharedInstance {
    static Colors *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[Colors alloc] init];
    });
    return sharedInstance;
}

-(instancetype)init {
    self = [super init];
    if (self) {
        _navigationBackground = [UIColor colorWithRed:0.2 green:1.0 blue:0.2 alpha:1.0];
    }
    return self;
}

@end
