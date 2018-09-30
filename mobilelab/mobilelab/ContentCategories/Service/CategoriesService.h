//
//  CategoriesService.h
//  mobilelab
//
//  Created by Ilya Zimonin on 30/09/2018.
//  Copyright © 2018 Ilya Zimonin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CategoriesService : NSObject

-(void)getCategoriesFromDB:(void (^)(NSMutableArray *))complition;

@end
