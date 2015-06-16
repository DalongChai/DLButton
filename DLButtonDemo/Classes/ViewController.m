//
//  ViewController.m
//  DLButtonDemo
//
//  Created by 柴达龙 on 15/6/16.
//  Copyright (c) 2015年 柴达龙. All rights reserved.
//

#import "ViewController.h"
#import "DLButton.h"

@interface ViewController ()

@property (strong, nonatomic) DLButton * buttonOne;

@property (strong, nonatomic) DLButton * buttonForDisable;

@property (strong, nonatomic) DLButton * buttonForControlDisable;

@property (strong, nonatomic) DLButton * buttonForSelect;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.buttonOne = [[DLButton alloc] initWithFrame:CGRectMake(0, 110, [UIScreen mainScreen].bounds.size.width, 30)];
    [_buttonOne setTitle:@"Button created from code." forState:UIControlStateNormal];
    [_buttonOne setNormalBackgroundColorWithAutoHighlightSet:[UIColor colorWithRed:0.358 green:1.000 blue:0.256 alpha:1.000]];
    [self.view addSubview:_buttonOne];
    
    self.buttonForDisable = [[DLButton alloc] initWithFrame:CGRectMake(0, 150, [UIScreen mainScreen].bounds.size.width, 30)];
    [_buttonForDisable setTitle:@"Button test for disable." forState:UIControlStateNormal];
    [_buttonForDisable setNormalBackgroundColorWithAutoHighlightSet:[UIColor colorWithRed:1.000 green:0.033 blue:0.097 alpha:1.000]];
    [_buttonForDisable setBackgroundColor:[UIColor colorWithRed:0.092 green:0.087 blue:0.091 alpha:1.000] forState:UIControlStateDisabled];
    _buttonForDisable.enabled = false;
    [self.view addSubview:_buttonForDisable];

    self.buttonForControlDisable = [[DLButton alloc] initWithFrame:CGRectMake(0, 190, [UIScreen mainScreen].bounds.size.width, 30)];
    [_buttonForControlDisable setTitle:@"Button control pre button's enable." forState:UIControlStateNormal];
    [_buttonForControlDisable setNormalBackgroundColorWithAutoHighlightSet:[UIColor colorWithRed:0.205 green:0.273 blue:1.000 alpha:1.000]];
    [_buttonForControlDisable addTarget:self action:@selector(changePreviousButtonEnable) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_buttonForControlDisable];

    
    self.buttonForSelect = [[DLButton alloc] initWithFrame:CGRectMake(0, 230, [UIScreen mainScreen].bounds.size.width, 30)];
    [_buttonForSelect setTitle:@"Button test for select." forState:UIControlStateNormal];
    [_buttonForSelect setNormalBackgroundColorWithAutoHighlightSet:[UIColor colorWithRed:0.626 green:0.185 blue:1.000 alpha:1.000]];
    [_buttonForSelect setBackgroundColor:[UIColor colorWithRed:1.000 green:0.315 blue:0.026 alpha:1.000] forState:UIControlStateSelected];
    [_buttonForSelect addTarget:self action:@selector(changeSelected) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_buttonForSelect];
    
    // Do any additional setup after loading the view from its nib.
}

- (void) changePreviousButtonEnable{
    self.buttonForDisable.enabled = !self.buttonForDisable.enabled;
}

- (void) changeSelected{
    self.buttonForSelect.selected = !self.buttonForSelect.selected;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
