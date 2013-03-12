//
//  FlipAppDelegate.h
//  MyFlip
//
//  Created by Mike Smith on 3/11/13.
//  Copyright (c) 2013 Mike Smith. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BigView;
@interface FlipAppDelegate : UIResponder <UIApplicationDelegate> {
    BigView *bigView;
	UIWindow *_window;}

@property (strong, nonatomic) UIWindow *window;

@end
