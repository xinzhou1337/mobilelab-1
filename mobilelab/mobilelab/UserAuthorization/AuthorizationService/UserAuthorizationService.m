//
//  UserAuthorizationService.m
//  mobilelab
//
//  Created by Ilya Zimonin on 30/09/2018.
//  Copyright © 2018 Ilya Zimonin. All rights reserved.
//

#import "UserAuthorizationService.h"
#import "NSString+MD5.h"
#import <UIKit/UIKit.h>

#define kUserPassword @"password"
#define kDBPath @"dbPath"

@implementation UserAuthorizationService

-(BOOL)userDataExists {
    NSString *savedPassword = [[NSUserDefaults standardUserDefaults] objectForKey:kUserPassword];
    return savedPassword ? YES : NO;
}

-(NSString *)passwordHash:(nonnull NSString *)password {
    return [password MD5String];
}

-(NSString *)savedPasswordHash {
    return [[NSUserDefaults standardUserDefaults] objectForKey:kUserPassword];
}

-(BOOL)registerUser:(NSString *)password {
    NSString *hash = [self passwordHash:password];
    [[NSUserDefaults standardUserDefaults] setObject:hash forKey:kUserPassword];
    NSDataAsset *db = [[NSDataAsset alloc] initWithName:@"passwordDB"];
    NSString *path = [self pathToDatabase];
    if (![db.data writeToFile:path atomically:YES]) {
        return NO;
    }
    [[NSUserDefaults standardUserDefaults] setObject:path forKey: kDBPath];
    return YES;
}

-(NSString *)pathToDatabase {
    NSString *path = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES).firstObject;
    return [path stringByAppendingPathComponent:@"passwordDB.db"];
}

@end
