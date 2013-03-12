//
//  LittleView1.m
//  MyFlip
//
//  Created by Mike Smith on 3/11/13.
//  Copyright (c) 2013 Mike Smith. All rights reserved.
//

#import "LittleView1.h"

@implementation LittleView1

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor blueColor];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    // Drawing code
	//Print the name of the class.  See the main function in main.m.
	NSString *string = NSStringFromClass([self class]);
	UIFont *font = [UIFont systemFontOfSize: 32];
	[string drawAtPoint: CGPointZero withFont: font];
}


@end
