//
//  DLButton.h
//  DLButtonDemo
//
//  Created by 柴达龙 on 15/6/16.
//  Copyright (c) 2015年 柴达龙. All rights reserved.
//

#import <UIKit/UIKit.h>

#define BUTTON_NORMAL_DEFAULT_COLOR [UIColor colorWithRed:73./255. green:160./255. blue:212./255. alpha:1]

@interface DLButton : UIButton

- (void) setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state;

/**
 *  set background color for normalState, meanwhile auto set highlightState's bg color with attribute alpha 0.8
 *
 *  @param backgroundColor
 */
- (void) setNormalBackgroundColorWithAutoHighlightSet:(UIColor *)backgroundColor;

@end
