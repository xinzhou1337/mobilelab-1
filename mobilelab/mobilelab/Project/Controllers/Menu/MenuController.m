//
//  MenuController.m
//  mobilelab
//
//  Created by Ilya Zimonin on 07/10/2018.
//  Copyright © 2018 Ilya Zimonin. All rights reserved.
//

#import "MenuController.h"
#import "MenuCell.h"

@interface MenuController () <UITableViewDelegate, UITableViewDataSource, UIGestureRecognizerDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *tapGestureRecognizer;

@property (strong, nonatomic) NSArray *dataArray;

@end

@implementation MenuController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerNib:[UINib nibWithNibName:@"MenuCell" bundle:nil] forCellReuseIdentifier:@"menuCell"];
    self.dataArray = @[@"Пункт 1", @"Пункт 2", @"Пункт 3"];
    
    self.tapGestureRecognizer.delegate = self;
    [self.view addGestureRecognizer:self.tapGestureRecognizer];
}

- (IBAction)tapped:(UITapGestureRecognizer *)recognizer {
    CGPoint location = [recognizer locationInView:self.view];
    if (!CGRectIntersectsRect(self.tableView.frame, CGRectMake(location.x, location.y, 1, 1))) {
        [self dismissViewControllerAnimated:NO completion:nil];
    }
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    if ([touch.view isDescendantOfView:self.tableView]) {
        return NO;
    }
    return YES;
}

#pragma mark - Data source

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    MenuCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"menuCell" forIndexPath:indexPath];
    cell.labelText.text = self.dataArray[indexPath.row];
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"" message:self.dataArray[indexPath.row] preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:action];
    [self presentViewController:alert animated:YES completion:nil];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

@end
