//
//  XQZLoginViewController.m
//  PuzzledSister
//
//  Created by liwei on 16/3/20.
//  Copyright © 2016年 liwei. All rights reserved.
//

#import "XQZLoginViewController.h"

@interface XQZLoginViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *phoneTextField; /**< 手机号输入框*/
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField; /**< 密码输入框*/
@property (weak, nonatomic) IBOutlet UITextField *registerPhone;
@property (weak, nonatomic) IBOutlet UITextField *registerPassword;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *registerConstraint;

@end

@implementation XQZLoginViewController

#pragma mark - 生命周期方法
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    // 设置登录和注册文本输入框占位文字的属性
    [self setupLoginAndRegisterTextFieldPlaceholder];
    
    // 设置手机和密码输入框的代理
    self.phoneTextField.delegate = self;
    self.passwordTextField.delegate = self;
    
}

- (void)setupLoginAndRegisterTextFieldPlaceholder {
    // 设置登录文本输入框占位文字的属性
    [self setupTextFieldPlaceHolderAttributeWithTextField:self.phoneTextField color:nil font:nil];
    [self setupTextFieldPlaceHolderAttributeWithTextField:self.passwordTextField color:nil font:nil];
    
    // 设置注册文本输入框占位文字的属性
    [self setupTextFieldPlaceHolderAttributeWithTextField:self.registerPhone color:nil font:nil];
    [self setupTextFieldPlaceHolderAttributeWithTextField:self.registerPassword color:nil font:nil];
}

#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [self.view endEditing:YES];
    
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    [self setupTextFieldPlaceHolderAttributeWithTextField:textField color:[UIColor whiteColor] font:[UIFont systemFontOfSize:18]];
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    [self setupTextFieldPlaceHolderAttributeWithTextField:textField color:nil font:nil];

}

/**
 *  设置文本输入框占位文字的属性
 */
- (void)setupTextFieldPlaceHolderAttributeWithTextField:(UITextField *)textField color:(UIColor *)color font:(UIFont *)font {
    
    UIColor *col = color;
    
    if (color == nil) {
        col = [UIColor grayColor];
    }
    
    // 占位文字属性
    NSDictionary *colorAttribute = @{NSForegroundColorAttributeName : col};
    NSRange phoneRange = NSMakeRange(0, textField.placeholder.length);
    
    if (font != nil) {
        colorAttribute = @{NSForegroundColorAttributeName : col, NSFontAttributeName : font};
    }

    // 输入文本框占位文字的属性
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:textField.placeholder];
    [attributedStr setAttributes:colorAttribute range:phoneRange];
    
    textField.attributedPlaceholder = attributedStr;
}

#pragma mark - 按钮的点击事件方法
/**
 *  关闭登录按钮的点击事件
 */
- (IBAction)loginBtnClose:(UIButton *)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

/**
 *  登录或者注册按钮的点击事件
 */
- (IBAction)LoginOrRegisterBtnClick:(UIButton *)sender {
    sender.selected = !sender.selected;
    if (self.registerConstraint.constant == 0 ) {
        
        self.registerConstraint.constant = -self.view.frame.size.width;
    } else {
        self.registerConstraint.constant = 0;
    }
    
    [UIView animateWithDuration:0.25 animations:^{
        [self.view layoutIfNeeded];
    }];
    
    // 将键盘退出
    [self.view endEditing:YES];
    MYLogFunc
}
- (IBAction)forgotPwd:(UIButton *)sender {
    
    
    MYLogFunc
}

/**
 *  登录按钮的点击事件
 */
- (IBAction)loginBtnAction:(UIButton *)sender {
    MYLogFunc
}

/**
 *  注册按钮的点击事件
 */
- (IBAction)registerBtnAction:(UIButton *)sender {
    
    MYLogFunc
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
