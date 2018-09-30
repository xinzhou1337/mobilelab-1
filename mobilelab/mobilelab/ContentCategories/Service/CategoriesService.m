//
//  CategoriesService.m
//  mobilelab
//
//  Created by Ilya Zimonin on 30/09/2018.
//  Copyright © 2018 Ilya Zimonin. All rights reserved.
//

#import "CategoriesService.h"
#import "Settings.h"
#import <sqlite3.h>
#import "Category.h"

@implementation CategoriesService

-(void)getCategoriesFromDB:(void (^)(NSMutableArray *))complition {
    NSMutableArray *categories = [NSMutableArray new];
    sqlite3 *database;
    if (sqlite3_open([[Settings sharedInstance].pathToDatabase UTF8String], &database) == SQLITE_OK) {
        const char *request = "SELECT category_id, name FROM categories";
        sqlite3_stmt *statement;
        if (sqlite3_prepare_v2(database, request, -1, &statement, NULL) == SQLITE_OK) {
            while (sqlite3_step(statement) == SQLITE_ROW) {
                Category *category = [Category new];
                category.categoryId = sqlite3_column_int(statement, 0);
                category.name = [NSString stringWithUTF8String: (char *)sqlite3_column_text(statement, 1)];
                [categories addObject:category];
            }
        }
    }
    
    if (complition) {
        complition(categories);
    }
}

@end
