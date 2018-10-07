//
//  DefaultCollectionController.m
//  mobilelab
//
//  Created by Ilya Zimonin on 06/10/2018.
//  Copyright © 2018 Ilya Zimonin. All rights reserved.
//

#import "DefaultCollectionController.h"

@interface DefaultCollectionController () <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, weak) IBOutlet UIView *viewForCollection;


@end

@implementation DefaultCollectionController

-(void)initController {
    self.rowHeight = 44;
    self.minColumnCount = 1;
    self.minRowWidth = 999999;
    self.maxRowWidth = 999999;
}

-(void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *parentView = self.viewForCollection ?: self.view;
    
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    self.collection = [[UICollectionView alloc] initWithFrame:parentView.bounds collectionViewLayout:layout];
    self.collection.backgroundColor = UIColor.clearColor;
    self.collection.dataSource = self;
    self.collection.delegate = self;
    [parentView addSubview:self.collection];
    self.collection.autoresizingMask = 34;
}

-(void)registerNib:(nullable UINib *)nib forCellWithReuseIdentifier:(nonnull NSString*)reuseId {
    [self.collection registerNib:nib forCellWithReuseIdentifier:reuseId];
}



#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat rowWidth = self.viewForCollection.bounds.size.width / self.minColumnCount;
    CGFloat totalRowWidth;
    if (rowWidth > self.maxRowWidth) {
        NSInteger newCount = (NSInteger)(self.viewForCollection.bounds.size.width / self.maxRowWidth) + 1;
        totalRowWidth = self.viewForCollection.bounds.size.width / newCount;
    } else {
        totalRowWidth = rowWidth;
    }
    return CGSizeMake(totalRowWidth, self.rowHeight);
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0, 0, 0, 0);
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

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(nonnull id<UIViewControllerTransitionCoordinator>)coordinator {
    __weak typeof(self) weakSelf = self;
    [coordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext> context) {
         [weakSelf.collection.collectionViewLayout invalidateLayout];
     } completion:^(id<UIViewControllerTransitionCoordinatorContext> context){}];
}



@end
