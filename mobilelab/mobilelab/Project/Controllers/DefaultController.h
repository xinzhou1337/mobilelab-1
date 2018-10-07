//
//  DefaultController.h
//  mobilelab
//
//  Created by Ilya Zimonin on 06/10/2018.
//  Copyright © 2018 Ilya Zimonin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Colors.h"

@interface DefaultController : UIViewController

@property (nonatomic, strong) Colors *colors;

-(void)initController;

@end
