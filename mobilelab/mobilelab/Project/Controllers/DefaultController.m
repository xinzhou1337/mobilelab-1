//
//  DefaultController.m
//  mobilelab
//
//  Created by Ilya Zimonin on 06/10/2018.
//  Copyright © 2018 Ilya Zimonin. All rights reserved.
//

#import "DefaultController.h"
#import "MenuController.h"

@interface DefaultController ()

@property (nonatomic, strong) MenuController *menuController;

@end

@implementation DefaultController

-(instancetype)init {
    self = [super init];
    if (self) {
        [self initController];
    }
    return self;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initController];
    }
    return self;
}

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self initController];
    }
    return self;
}

-(void)initController {
    self.colors = [Colors new];
}

-(void)viewDidLoad {
    [super viewDidLoad];
    
    if (self.navigationItem) {
        UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"menuBarButton"] style:UIBarButtonItemStylePlain target:self action:@selector(onMenuClick)];
        self.navigationItem.rightBarButtonItem = item;
        
        self.menuController = [[MenuController alloc] init];
        self.menuController.providesPresentationContextTransitionStyle = YES;
        self.menuController.definesPresentationContext = YES;
        self.menuController.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    }
}

-(void)onMenuClick {
    [self presentViewController:self.menuController animated:NO completion:nil];
}

@end
