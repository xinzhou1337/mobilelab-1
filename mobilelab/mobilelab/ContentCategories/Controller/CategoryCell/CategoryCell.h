//
//  CategoryCell.h
//  mobilelab
//
//  Created by Ilya Zimonin on 30/09/2018.
//  Copyright © 2018 Ilya Zimonin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CategoryCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UILabel *labelName;
@property (weak, nonatomic) IBOutlet UIView *viewColor;

@end
