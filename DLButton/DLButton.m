//
//  DLButton.m
//  DLButtonDemo
//
//  Created by 柴达龙 on 15/6/16.
//  Copyright (c) 2015年 柴达龙. All rights reserved.
//

#import "DLButton.h"

@interface DLButton ()
@property (assign, nonatomic) BOOL isObserverAdd;
@property (strong, nonatomic) NSMutableDictionary *stateBgDic;
@end

@implementation DLButton

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self addObservers];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addObservers];
    }
    return self;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addObservers];
    }
    return self;
}

- (void) addObservers{
    if (!_isObserverAdd) {
        _isObserverAdd = true;
        [self addObserver:self forKeyPath:@"highlighted" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
        [self addObserver:self forKeyPath:@"enabled" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
        [self addObserver:self forKeyPath:@"selected" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
    }
    if (_stateBgDic == nil) {
        self.stateBgDic = [NSMutableDictionary dictionary];
        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        if (self.backgroundColor) {
            [self.stateBgDic setObject:self.backgroundColor forKey:[NSString stringWithFormat:@"%lu",(unsigned long)UIControlStateNormal]];
            [self.stateBgDic setObject:[self.backgroundColor colorWithAlphaComponent:0.8f] forKey:[NSString stringWithFormat:@"%lu",(unsigned long)UIControlStateHighlighted]];
        }else{
            self.backgroundColor = BUTTON_NORMAL_DEFAULT_COLOR;
            [self.stateBgDic setObject:BUTTON_NORMAL_DEFAULT_COLOR forKey:[NSString stringWithFormat:@"%lu",(unsigned long)UIControlStateNormal]];
            [self.stateBgDic setObject:[BUTTON_NORMAL_DEFAULT_COLOR colorWithAlphaComponent:0.8f] forKey:[NSString stringWithFormat:@"%lu",(unsigned long)UIControlStateHighlighted]];
        }
    }
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    UIColor * color = nil;
    if ([keyPath isEqualToString:@"highlighted"]) {
        if (self.highlighted) {
            color = [self.stateBgDic objectForKey:[NSString stringWithFormat:@"%lu",(unsigned long)UIControlStateHighlighted]];
        }else if (!self.selected && self.enabled){
            color = [self.stateBgDic objectForKey:[NSString stringWithFormat:@"%lu",(unsigned long)UIControlStateNormal]];
        }
    }
    if ([keyPath isEqualToString:@"selected"]) {
        if (self.selected) {
            color = [self.stateBgDic objectForKey:[NSString stringWithFormat:@"%lu",(unsigned long)UIControlStateSelected]];
        }else if (!self.highlighted && self.enabled){
            color = [self.stateBgDic objectForKey:[NSString stringWithFormat:@"%lu",(unsigned long)UIControlStateNormal]];
        }
    }
    if ([keyPath isEqualToString:@"enabled"]) {
        if (!self.enabled) {
            color = [self.stateBgDic objectForKey:[NSString stringWithFormat:@"%lu",(unsigned long)UIControlStateDisabled]];
        }else if (!self.highlighted && !self.selected){
            color = [self.stateBgDic objectForKey:[NSString stringWithFormat:@"%lu",(unsigned long)UIControlStateNormal]];
        }
    }
    if (color!=nil) {
        self.backgroundColor = color;
    }
}

- (void) setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state{
    
    [self addObservers];
    
    switch (state) {
        case UIControlStateNormal:
            if (!self.selected && !self.highlighted && self.enabled) {
                self.backgroundColor = backgroundColor;
            }
            break;
        case UIControlStateHighlighted:
            if (self.highlighted) {
                self.backgroundColor = backgroundColor;
            }
            break;
        case UIControlStateDisabled:
            if (!self.enabled) {
                self.backgroundColor = backgroundColor;
            }
            break;
        case UIControlStateSelected:
            if (self.selected) {
                self.backgroundColor = backgroundColor;
            }
            break;
        default:
            break;
    }
    
    [self.stateBgDic setObject:backgroundColor forKey:[NSString stringWithFormat:@"%lu",(unsigned long)state]];
}

- (void) setNormalBackgroundColorWithAutoHighlightSet:(UIColor *)backgroundColor{
    [self setBackgroundColor:backgroundColor forState:UIControlStateNormal];
    [self setBackgroundColor:[backgroundColor colorWithAlphaComponent:0.8f] forState:UIControlStateHighlighted];
}

- (void)dealloc{
    [self removeObserver:self forKeyPath:@"highlighted"];
    [self removeObserver:self forKeyPath:@"enabled"];
    [self removeObserver:self forKeyPath:@"selected"];
}

@end
