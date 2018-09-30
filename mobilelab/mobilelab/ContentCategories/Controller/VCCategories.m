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

@interface VCCategories () <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UICollectionView *collection;
@property (strong, nonatomic) CategoriesService *service;
@property (strong, nonatomic) NSMutableArray *categories;
@property (strong, nonatomic) NSArray<UIColor *> *colors;

@end

@implementation VCCategories

- (void)viewDidLoad {
    [super viewDidLoad];
    self.collection.delegate = self;
    self.collection.dataSource = self;
    [self.collection registerNib:[UINib nibWithNibName:@"CategoryCell" bundle:nil] forCellWithReuseIdentifier:@"CategoryCell"];
    
    self.service = [CategoriesService new];
    [self.service getCategoriesFromDB:^(NSMutableArray *categories) {
        self.categories = categories;
        NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"categoryId" ascending:YES];
        [categories sortUsingDescriptors:@[sortDescriptor]];
    }];
    [self initColors];
}

-(void)initColors {
    self.colors = @[[UIColor colorWithRed:1.0 green:0.0 blue:0.0 alpha:1.0],
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
    cell.viewColor.backgroundColor = self.colors[indexPath.row % 8];
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.categories.count;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(nonnull id<UIViewControllerTransitionCoordinator>)coordinator {
    
}

#pragma mark Delegate

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat width = [self.view bounds].size.width;
    return CGSizeMake(width / 2.0, 80);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(8, 0, 8, 0);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    return CGSizeMake(0, 0);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
    return CGSizeMake(0, 0);
}

@end
