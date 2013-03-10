//
//  TapAppDelegate.h
//  MyTap
//
//  Created by Mike Smith on 3/10/13.
//  Copyright (c) 2013 Mike Smith. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TapUILabel;
@interface TapAppDelegate : UIResponder <UIApplicationDelegate>{
    TapUILabel *label;
    UIWindow *_window;
}

@property (strong, nonatomic) UIWindow *window;

@end
