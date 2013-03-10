//
//  TapUILabel.h
//  MyTap
//
//  Created by Mike Smith on 3/10/13.
//  Copyright (c) 2013 Mike Smith. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TapUILabel : UILabel {
    NSUInteger tapCount;
    NSTimeInterval delay;
}

@end
