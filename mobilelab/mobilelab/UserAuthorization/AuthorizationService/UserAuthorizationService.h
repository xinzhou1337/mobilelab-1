//
//  UserAuthorizationService.h
//  mobilelab
//
//  Created by Ilya Zimonin on 30/09/2018.
//  Copyright © 2018 Ilya Zimonin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserAuthorizationService : NSObject

-(BOOL)userDataExists;
-(NSString *)savedPasswordHash;
-(void)savePassword:(NSString *)password;


@end
