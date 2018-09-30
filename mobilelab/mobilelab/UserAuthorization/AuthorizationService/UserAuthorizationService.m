//
//  UserAuthorizationService.m
//  mobilelab
//
//  Created by Ilya Zimonin on 30/09/2018.
//  Copyright © 2018 Ilya Zimonin. All rights reserved.
//

#import "UserAuthorizationService.h"
#import "NSString+MD5.h"

#define kUserPassword @"password"

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

-(void)savePassword:(NSString *)password {
    NSString *hash = [self passwordHash:password];
    [[NSUserDefaults standardUserDefaults] setObject:hash forKey:kUserPassword];
}

@end
