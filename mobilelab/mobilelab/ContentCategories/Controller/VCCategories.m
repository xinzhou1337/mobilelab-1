//
//  VCCategories.m
//  mobilelab
//
//  Created by Ilya Zimonin on 30/09/2018.
//  Copyright © 2018 Ilya Zimonin. All rights reserved.
//

#import "VCCategories.h"
#import "CategoryCell.h"
#import "CategoriesService.h"
#import "Category.h"

@interface VCCategories ()

@property (strong, nonatomic) CategoriesService *service;
@property (strong, nonatomic) NSMutableArray *categories;
@property (strong, nonatomic) NSArray<UIColor *> *colorsArray;

@end

@implementation VCCategories

-(void)initController {
    [super initController];
    
    self.service = [CategoriesService new];
    [self.service getCategoriesFromDB:^(NSMutableArray *categories) {
        self.categories = categories;
        NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"categoryId" ascending:YES];
        [categories sortUsingDescriptors:@[sortDescriptor]];
    }];
    [self initColors];
    
    self.minRowWidth = 200;
    self.maxRowWidth = 400;
    self.rowHeight = 60;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self registerNib:[UINib nibWithNibName:@"CategoryCell" bundle:nil] forCellWithReuseIdentifier:@"CategoryCell"];
}

-(void)initColors {
    self.colorsArray = @[[UIColor colorWithRed:1.0 green:0.0 blue:0.0 alpha:1.0],
                    [UIColor colorWithRed:0.0 green:1.0 blue:0.0 alpha:1.0],
                    [UIColor colorWithRed:1.0 green:0.0 blue:1.0 alpha:1.0],
                    [UIColor colorWithRed:1.0 green:1.0 blue:0.0 alpha:1.0],
                    [UIColor colorWithRed:1.0 green:0.0 blue:1.0 alpha:1.0],
                    [UIColor colorWithRed:0.0 green:1.0 blue:1.0 alpha:1.0],
                    [UIColor colorWithRed:1.0 green:0.5 blue:0.25 alpha:1.0],
                    [UIColor colorWithRed:0.25 green:0.25 blue:0.75 alpha:1.0]];
}

#pragma mark DataSource

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    CategoryCell *cell = [self.collection dequeueReusableCellWithReuseIdentifier:@"CategoryCell" forIndexPath:indexPath];
    Category *category = self.categories[indexPath.row];
    cell.labelName.text = category.name;
    if (indexPath.row < 2) {
        cell.viewColor.backgroundColor = UIColor.grayColor;
    } else {
        cell.viewColor.backgroundColor = self.colorsArray[indexPath.row % 8];
    }
    
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.categories.count;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

@end
