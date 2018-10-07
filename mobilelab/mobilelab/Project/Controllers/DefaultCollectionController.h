//
//  DefaultCollectionController.h
//  mobilelab
//
//  Created by Ilya Zimonin on 06/10/2018.
//  Copyright © 2018 Ilya Zimonin. All rights reserved.
//

#import "DefaultController.h"

@interface DefaultCollectionController : DefaultController

@property (nonatomic, assign) NSInteger rowHeight;
@property (nonatomic, assign) NSInteger minColumnCount;
@property (nonatomic, assign) CGFloat minRowWidth;
@property (nonatomic, assign) CGFloat maxRowWidth;

-(void)registerNib:(nullable UINib *)nib forCellWithReuseIdentifier:(nonnull NSString*)reuseId;

@end
