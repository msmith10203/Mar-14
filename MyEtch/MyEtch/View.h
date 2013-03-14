//
//  View.h
//  MyEtch
//
//  Created by Mike Smith on 3/13/13.
//  Copyright (c) 2013 Mike Smith. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface View : UIView {
    CGMutablePathRef path;
}

- (void) clearPath;

@end
