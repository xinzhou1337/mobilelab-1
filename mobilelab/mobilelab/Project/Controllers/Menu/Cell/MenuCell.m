//
//  MenuCell.m
//  mobilelab
//
//  Created by Ilya Zimonin on 07/10/2018.
//  Copyright © 2018 Ilya Zimonin. All rights reserved.
//

#import "MenuCell.h"

@interface MenuCell()

@property (weak, nonatomic) IBOutlet UIView *viewCell;

@end

@implementation MenuCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.viewCell.layer.masksToBounds = YES;
    self.viewCell.layer.cornerRadius = 5;
}

@end
