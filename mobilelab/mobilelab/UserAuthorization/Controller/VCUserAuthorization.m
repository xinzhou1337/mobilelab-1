//
//  VCUserAuthorization.m
//  mobilelab
//
//  Created by Ilya Zimonin on 30/09/2018.
//  Copyright © 2018 Ilya Zimonin. All rights reserved.
//

#import "VCUserAuthorization.h"
#import "UserAuthorizationService.h"
#import "Settings.h"
#import "VCCategories.h"

#import "NSString+MD5.h"

#define hintEmptyField @"Поле не может быть пустым"
#define hintPasswordsNotEqual @"Пароли не совпадают"
#define hintUncorrectPassword @"Введен неверный пароль"
#define hintUncorrectSymbols @"Пароль может содержать латинские буквы A-Z, a-z и цифры 0-9 и длиной не более 32 символов"
#define hintRegisterFailure @"Не удалось зарегистрировать базу данных"

@interface VCUserAuthorization ()

@property (weak, nonatomic) IBOutlet UITextField *textFieldPassword;
@property (weak, nonatomic) IBOutlet UILabel *labelRepeatPassword;
@property (weak, nonatomic) IBOutlet UITextField *textFieldRepeatPassword;
@property (weak, nonatomic) IBOutlet UILabel *labelHint;

@property (nonatomic, strong) UserAuthorizationService *service;
@property (nonatomic) BOOL authorizationScreen;
@property (nonatomic, strong) UINavigationController *navigation;

@end

@implementation VCUserAuthorization

- (void)viewDidLoad {
    [super viewDidLoad];
    self.service = [UserAuthorizationService new];
    
    self.authorizationScreen = [self.service userDataExists];
    if (self.authorizationScreen) {
        self.labelRepeatPassword.hidden = YES;
        self.textFieldRepeatPassword.hidden = YES;
    }
}

- (IBAction)buttonAcceptPress:(id)sender {
    
    NSString *password = self.textFieldPassword.text;
    
    if (!password.length) {
        [self showHint:hintEmptyField];
        return;
    }
    
    if (self.authorizationScreen) {
        // authorization
        NSString *passwordHash = [password MD5String];
        NSString *savedPasswordHash = [self.service savedPasswordHash];
        if (![passwordHash isEqualToString:savedPasswordHash]) {
            [self showHint:hintUncorrectPassword];
            return;
        }
        
        
        
    } else {
        // registration
        NSString *repeatPassword = self.textFieldRepeatPassword.text;
        if (!repeatPassword.length) {
            [self showHint:hintEmptyField];
            return;
        }
        if (![password isEqualToString:repeatPassword]) {
            [self showHint:hintPasswordsNotEqual];
            return;
        }
        
        if (![self isPasswordCorrect]) {
            [self showHint:hintUncorrectSymbols];
            return;
        }
        
        if (![self.service registerUser:password]) {
            [self showHint:hintRegisterFailure];
            return;
        }
        
    }
    
    Settings *settings = [Settings sharedInstance];
    settings.sessionPassword = password;
    settings.pathToDatabase = [self.service pathToDatabase];
    VCCategories *vc = [VCCategories new];
    self.navigation = [UINavigationController new];
    [self.navigation setViewControllers:@[vc]];
    [self presentViewController:self.navigation animated:NO completion:nil];
}

-(BOOL)isPasswordCorrect {
    NSString *password = self.textFieldPassword.text;
    if (password.length > 32) {
        return NO;
    }
    NSCharacterSet *set = [NSCharacterSet alphanumericCharacterSet];
    NSRange range = [password rangeOfCharacterFromSet:set];
    if (range.location == NSNotFound) {
        return NO;
    }
    
    return YES;
}

-(void)showHint:(NSString *)hintText {
    self.labelHint.text = hintText;
    self.labelHint.alpha = 1.0;
    [UITextView animateWithDuration:3 delay:3 options:UIViewAnimationOptionCurveLinear animations:^{
        self.labelHint.alpha = 0.0;
    } completion:nil];
}

@end
