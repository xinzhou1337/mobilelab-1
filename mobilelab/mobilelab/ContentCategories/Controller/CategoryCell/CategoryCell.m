//
//  CategoryCell.m
//  mobilelab
//
//  Created by Ilya Zimonin on 30/09/2018.
//  Copyright © 2018 Ilya Zimonin. All rights reserved.
//

#import "CategoryCell.h"

@implementation CategoryCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.viewColor.layer.cornerRadius = 5;
    self.viewColor.layer.masksToBounds = YES;
}

@end
