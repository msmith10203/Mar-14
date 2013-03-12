//
//  BigView.m
//  MyFlip
//
//  Created by Mike Smith on 3/11/13.
//  Copyright (c) 2013 Mike Smith. All rights reserved.
//

#import "BigView.h"
#import "LittleView0.h"
#import "LittleView1.h"
#import "LittleView2.h"

@implementation BigView

- (id) initWithFrame: (CGRect) frame
{
	self = [super initWithFrame: frame];
	if (self) {
		// Initialization code
        
		//Don't bother with a background color--
		//this BigView is entirely occupied by a LittleView.
		
		views = [NSArray arrayWithObjects:
                 [[LittleView0 alloc] initWithFrame: self.bounds],
                 [[LittleView1 alloc] initWithFrame: self.bounds],
                 [[LittleView2 alloc] initWithFrame: self.bounds],
                 nil
                 ];
        
		index = 0;	//LittleView0 is the one that's initially visible.
		[self addSubview: [views objectAtIndex: index]];
        
        UISwipeGestureRecognizer *recognizer = [[UISwipeGestureRecognizer alloc]
                                                initWithTarget: self action: @selector(swipe:)
                                                ];
		recognizer.direction = UISwipeGestureRecognizerDirectionRight;
		[self addGestureRecognizer: recognizer];
        
		recognizer = [[UISwipeGestureRecognizer alloc]
                      initWithTarget: self action: @selector(swipe:)
                      ];
		recognizer.direction = UISwipeGestureRecognizerDirectionLeft;
		[self addGestureRecognizer: recognizer];
        
		recognizer = [[UISwipeGestureRecognizer alloc]
                      initWithTarget: self action: @selector(swipe:)
                      ];
		recognizer.direction = UISwipeGestureRecognizerDirectionUp;
		[self addGestureRecognizer: recognizer];
        
		recognizer = [[UISwipeGestureRecognizer alloc]
                      initWithTarget: self action: @selector(swipe:)
                      ];
		recognizer.direction = UISwipeGestureRecognizerDirectionDown;
		[self addGestureRecognizer: recognizer];
        
        
	}
	return self;
}

- (void) swipe: (UISwipeGestureRecognizer *) recognizer {
	CGPoint p = [recognizer locationInView: self];
    
	NSString *direction = @"unknown";
	if (recognizer.direction == UISwipeGestureRecognizerDirectionRight) {
		[self myTouchesEnded:UIViewAnimationOptionTransitionFlipFromLeft];
	} else if (recognizer.direction == UISwipeGestureRecognizerDirectionLeft) {
		[self myTouchesEnded:UIViewAnimationOptionTransitionCurlUp];
	} else if (recognizer.direction == UISwipeGestureRecognizerDirectionUp) {
		[self myTouchesEnded:UIViewAnimationOptionTransitionCrossDissolve];
	} else if (recognizer.direction == UISwipeGestureRecognizerDirectionDown) {
		[self myTouchesEnded:UIViewAnimationOptionTransitionCurlDown];
	}
    
}
    
    
- (void) myTouchesEnded: (NSUInteger) option {
	
	/*
     Assume a swipe has just ended.  A more complicated program could
     distinguish between left vs. rights wipes, and perform a
     UIViewAnimationOptionTransitionFlipFromLeft or a
     UIViewAnimationOptionTransitionFlipFromRight.
     
     In UIViewAnimationOptionTransitionFlipFromLeft, the left edge moves
     to the right, and the right edge moves away from the user and to the
     left.
     */
    
		NSUInteger newIndex = (index + 1) % views.count;	//cycle the index	//toggle the index
    
    //Try UIViewAnimationOptionTransitionCurlUp or
    //UIViewAnimationOptionTransitionCrossDissolve in place of UIViewAnimationOptionTransitionFlipFromLeft.
    
	[UIView transitionFromView: [views objectAtIndex: index]
                        toView: [views objectAtIndex: newIndex]
                      duration: 2.25
                       options: option//UIViewAnimationOptionTransitionFlipFromLeft
                    completion: NULL
     ];
    
	index = newIndex;
    NSLog(@"self.subviews.count == %u", self.subviews.count);    
}


@end
