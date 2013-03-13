//
//  View.h
//  MyPuzzle
//
//  Created by Mike Smith on 3/12/13.
//  Copyright (c) 2013 Mike Smith. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TileView;

@interface View : UIView {
    NSUInteger n;
    NSUInteger emptyRow;
    NSUInteger emptyCol;
    CGFloat margin;
    NSArray *array;
    int moves;
    
}

-(void) place: (TileView *) tileView atRow: (NSUInteger) row col: (NSUInteger) col;

@property (nonatomic, assign) int moves;
@property (nonatomic, assign) NSUInteger emptyRow;
@property (nonatomic, assign) NSUInteger emptyCol;

@end
