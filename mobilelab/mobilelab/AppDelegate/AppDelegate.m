//
//  AppDelegate.m
//  mobilelab
//
//  Created by Ilya Zimonin on 30/09/2018.
//  Copyright © 2018 Ilya Zimonin. All rights reserved.
//

#import "AppDelegate.h"
#import "VCUserAuthorization.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [UIWindow new];
    
    self.window.rootViewController = [VCUserAuthorization new];
    [self.window makeKeyAndVisible];
    return YES;
}


@end
