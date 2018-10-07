//
//  DefaultController.m
//  mobilelab
//
//  Created by Ilya Zimonin on 06/10/2018.
//  Copyright © 2018 Ilya Zimonin. All rights reserved.
//

#import "DefaultController.h"

@interface DefaultController ()

@end

@implementation DefaultController

-(instancetype)init {
    self = [super init];
    if (self) {
        [self initController];
    }
    return self;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initController];
    }
    return self;
}

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self initController];
    }
    return self;
}

-(void)initController {
    self.colors = [Colors new];
}

@end
