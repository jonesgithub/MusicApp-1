//
//  EnKeyboard_iphone.m
//  IPad_MongolianKeyboard
//
//  Created by Gadget Store on 2014-03-19.
//  Copyright (c) 2014 bachgaa. All rights reserved.
//

#import "EnKeyboard_iphone.h"

@interface EnKeyboard_iphone (){
}
@end

@implementation EnKeyboard_iphone
@synthesize keys;
@synthesize buttonArray;



+ (instancetype)sharedEnKeyboardView {
    static EnKeyboard_iphone *_sharedKeyboard = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedKeyboard = [[EnKeyboard_iphone alloc] initWithFrame:CGRectMake(0, 264, 320, 216)];
        UIColor *backColor = [UIColor colorWithRed:(206.0 / 255.0) green:(209.0 / 255.0) blue:(213.0 / 255.0) alpha: 1];
        _sharedKeyboard.backgroundColor = backColor;
    });
    
    return _sharedKeyboard;
}

- (void)buildKeys {
    NSLog(@"bosoo");
    int characterIndex = 0;
    buttonArray = [[NSMutableArray alloc] init];
#pragma mark Line 1
    int boundX = 3;
    int boundY = 8;
    for (int i = 0; i<10; i++) {
        UIButton *button = nil;
        button = [self getButton:CGRectMake(boundX, boundY, 26, 45) bgImage:[UIImage imageNamed:@"button_useg_50x50"] tag:MY_KEY_OTHER title:[self.keys[characterIndex++] uppercaseString]];
        [buttonArray addObject:button];
        boundX += button.bounds.size.width + 6;
        [button setUserInteractionEnabled:NO];
        [self addSubview:button];
        
    }
    
#pragma mark Line 2
    
    boundX = 19;
    boundY = 61;
    
    for (int i = 0; i<9; i++) {
        UIButton *button = nil;
        button = [self getButton:CGRectMake(boundX, boundY, 26, 45) bgImage:[UIImage imageNamed:@"button_useg_50x50"] tag:MY_KEY_OTHER title:[self.keys[characterIndex++] uppercaseString]];
        
        boundX += button.bounds.size.width + 6;
        [buttonArray addObject:button];
        [button setUserInteractionEnabled:NO];
        [self addSubview:button];
    }
#pragma mark Line 3
    boundX = 3;
    boundY = 114;
    
    for (int i = 0; i<9; i++) {
        
        UIButton *button = nil;
        
        if (i>=1 && i<8) {
            button = [self getButton:CGRectMake(boundX, boundY, 26, 45) bgImage:[UIImage imageNamed:@"button_useg_50x50"] tag:MY_KEY_OTHER title:[self.keys[characterIndex++] uppercaseString]];
            
            boundX += button.bounds.size.width + 6;
            [buttonArray addObject:button];
            [button setUserInteractionEnabled:NO];
        } else if (i == 0) {
            button = [self getButton:CGRectMake(boundX, boundY, 34, 45) bgImage:[UIImage imageNamed:@"shift_30x41.png"] tag:MY_KEY_SHIFT_EN1 title:nil];
            boundX += button.bounds.size.width + 14;
        } else if (i == 8) {
            boundX += button.bounds.size.width + 8;
            button = [self getButton:CGRectMake(boundX, boundY, 34, 45) bgImage:[UIImage imageNamed:@"backspace_30x41.png"] tag:MY_KEY_BACKSPACE title:nil];
            button.userInteractionEnabled = YES;
        }
        [self addSubview:button];
    }
    
#pragma mark Line 4
    boundX = 3;
    boundY = 167;
    for (int i=0; i<4; i++) {
        
        UIButton *button = nil;
        if (i == 0) {
            button = [self getButton:CGRectMake(boundX, boundY, 34, 45) bgImage:[UIImage imageNamed:@"button_dund_32x41.png"] tag:MY_KEY_MN title:@"Mn"];
            boundX += button.bounds.size.width + 6;
        } else if (i == 1) {
            button = [self getButton:CGRectMake(boundX, boundY, 34, 45) bgImage:[UIImage imageNamed:@"button_dund_32x41"] tag:MY_KEY_NUMBER title:@"123"];
            boundX += button.bounds.size.width + 6;
        } else if (i == 2) {
            button = [self getButton:CGRectMake(boundX, boundY, 155, 45) bgImage:[UIImage imageNamed:@"space_149x41"] tag:MY_KEY_SPACE title:@"space"];
            boundX += button.bounds.size.width + 6;
        } else if (i == 3) {
            button = [self getButton:CGRectMake(boundX, boundY, 73, 45) bgImage:[UIImage imageNamed:@"button_dund_71x41.png"] tag:MY_KEY_ENTER title:@"return"];
            boundX += button.bounds.size.width + 6;
        }
        
        [self addSubview:button];
    }
}

- (void)rotate_buildKeys {
    int characterIndex = 0;
    buttonArray = [[NSMutableArray alloc] init];
    
#pragma mark Line 1
    int boundX = myBoundX;
    int boundY = 8;
    for (int i = 0; i<10; i++) {
        UIButton *button = nil;
        button = [self getButton:CGRectMake(boundX, boundY, 40, 31) bgImage:[UIImage imageNamed:@"button_useg_40x31"] tag:MY_KEY_OTHER title:[self.keys[characterIndex++] uppercaseString]];
        
        [buttonArray addObject:button];
        boundX += button.bounds.size.width + 7;
        [button setUserInteractionEnabled:NO];
        [self addSubview:button];
        
    }
    
#pragma mark Line 2
    
    boundX = myBoundX + 24;
    boundY = 47;
    
    for (int i = 0; i<9; i++) {
        UIButton *button = nil;
        button = [self getButton:CGRectMake(boundX, boundY, 40, 31) bgImage:[UIImage imageNamed:@"button_useg_40x31"] tag:MY_KEY_OTHER title:[self.keys[characterIndex++] uppercaseString]];
        
        boundX += button.bounds.size.width + 7;
        [buttonArray addObject:button];
        [button setUserInteractionEnabled:NO];
        [self addSubview:button];
    }
    
#pragma mark Line 3
    boundX = myBoundX;
    boundY = 86;
    
    for (int i = 0; i<9; i++) {
        
        UIButton *button = nil;
        
        if (i>=1 && i<8) {
            button = [self getButton:CGRectMake(boundX, boundY, 40, 31) bgImage:[UIImage imageNamed:@"button_useg_40x31"] tag:MY_KEY_OTHER title:[self.keys[characterIndex++] uppercaseString]];
            
            boundX += button.bounds.size.width + 7;
            [buttonArray addObject:button];
            [button setUserInteractionEnabled:NO];
        } else if (i == 0) {
            button = [self getButton:CGRectMake(boundX, boundY, 60, 31) bgImage:[UIImage imageNamed:@"shift_60x31.png"] tag:MY_KEY_SHIFT_EN2 title:nil];
            boundX += button.bounds.size.width + 11;
        } else if (i == 8) {
            boundX += button.bounds.size.width + 4;
            button = [self getButton:CGRectMake(boundX, boundY, 60, 31) bgImage:[UIImage imageNamed:@"backspace_60x31"] tag:MY_KEY_BACKSPACE title:nil];
            button.userInteractionEnabled = YES;
        }
        [self addSubview:button];
    }
    
#pragma mark Line 4
    boundX = myBoundX;
    boundY = 125;
    for (int i=0; i<4; i++) {
        
        UIButton *button = nil;
        if (i == 0) {
            button = [self getButton:CGRectMake(boundX, boundY, 52, 31) bgImage:[UIImage imageNamed:@"button_dund_52x31.png"] tag:MY_KEY_MN title:@"Mn"];
            boundX += button.bounds.size.width + 7;
        } else if (i == 1) {
            button = [self getButton:CGRectMake(boundX, boundY, 52, 31) bgImage:[UIImage imageNamed:@"button_dund_52x31"] tag:MY_KEY_NUMBER title:@"123"];
            boundX += button.bounds.size.width + 7;
        } else if (i == 2) {
            button = [self getButton:CGRectMake(boundX, boundY, 250, 31) bgImage:[UIImage imageNamed:@"space_250x31"] tag:MY_KEY_SPACE title:@"space"];
            boundX += button.bounds.size.width + 7;
        } else if (i == 3) {
            button = [self getButton:CGRectMake(boundX, boundY, 89, 31) bgImage:[UIImage imageNamed:@"button_dund_89x31.png"] tag:MY_KEY_ENTER title:@"return"];
            boundX += button.bounds.size.width + 7;
        }
        
        [self addSubview:button];
    }
}

- (void)refreshFrame {
    [super refreshFrame];
    
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    {
        if (UIInterfaceOrientationIsPortrait([[NSUserDefaults standardUserDefaults] integerForKey:MY_CURRENT_INTERFACE_ORIENTATION])){
            [self buildKeys];
        } else if(UIInterfaceOrientationIsLandscape([[NSUserDefaults standardUserDefaults] integerForKey:MY_CURRENT_INTERFACE_ORIENTATION])) {
            [self rotate_buildKeys];
        } else {
            NSLog(@"ORIENATION ERROR");
            exit(1);
        }
        [self syncBuildKeys];
    }
}


- (void)buttonClicked:(UIButton *)button {
    [[UIDevice currentDevice] playInputClick];
    if (button.tag == MY_KEY_OTHER) {
        NSString *character = button.titleLabel.text;
        if (!shifted)
            character = [character lowercaseString];
        [self.textField insertText:character];
        if (shifted) {
            shifted = NO;
            [self syncBuildKeys];
        }
    }
    else if (button.tag == MY_KEY_BACKSPACE) {
        [self backspace];
    }
    else if (button.tag == MY_KEY_ENTER) {
        [[UIDevice currentDevice] playInputClick];
        if ([self.textField isKindOfClass:[UITextView class]])
            [self.textField insertText:@"\n"];
        else {
            [self.textField resignFirstResponder];
        }
    }
    else if (button.tag == MY_KEY_SHIFT_EN1 || button.tag == MY_KEY_SHIFT_EN2) {
        shifted = !shifted;
        [self syncBuildKeys];
    }
    else if (button.tag == MY_KEY_SPACE) {
        [self.textField insertText:@" "];
    }
    else if (button.tag == MY_KEY_HIDE_KEYBOARD) {
        [self.textField resignFirstResponder];
    }
    else if (button.tag == MY_KEY_NUMBER) {
        MY_IPHONE_NUM_KEYBOARD.textField = self.textField;
    }
    else if (button.tag == MY_KEY_ENG) {
        MY_IPHONE_EN_KEYBOARD.textField = self.textField;
    }
    else if (button.tag == MY_KEY_MN) {
        MY_IPHONE_MN_KEYBOARD.textField = self.textField;
    }
}


#pragma mark -
#pragma mark Getters
- (NSArray *)keys {
    if (keys == nil)
    {
        keys = @[@"q", @"w", @"e", @"r", @"t", @"y", @"u", @"i", @"o", @"p", @"a", @"s", @"d", @"f", @"g", @"h", @"j", @"k", @"l", @"z", @"x", @"c", @"v", @"b", @"n", @"m", @"!", @"?",@"", @"", @"", @"", @"", @"", @"",@"", @"", @"", @"", @"", @""];
    }
    return keys;
}

- (BOOL)enableInputClicksWhenVisible {
    return YES;
}

@end

