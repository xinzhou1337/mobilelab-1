//
//  Settings.h
//  mobilelab
//
//  Created by Ilya Zimonin on 30/09/2018.
//  Copyright © 2018 Ilya Zimonin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Settings : NSObject

@property (nonatomic, strong) NSString *sessionPassword;
@property (nonatomic, strong) NSString *pathToDatabase;

+(instancetype)sharedInstance;

@end
