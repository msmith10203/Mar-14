//
//  LittleView0.m
//  MyFlip
//
//  Created by Mike Smith on 3/11/13.
//  Copyright (c) 2013 Mike Smith. All rights reserved.
//

#import "LittleView0.h"

@implementation LittleView0

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor redColor];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    Class class = [self class];
	NSString *string = NSStringFromClass(class);
	CGPoint point = CGPointMake(0.0, 0.0);
	UIFont *font = [UIFont systemFontOfSize: 32];
	[string drawAtPoint: point withFont: font];}


@end
