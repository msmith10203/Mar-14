//
//  View.m
//  MyPuzzle
//
//  Created by Mike Smith on 3/12/13.
//  Copyright (c) 2013 Mike Smith. All rights reserved.
//
#import "View.h"
#import "TileView.h"

@implementation View
@synthesize emptyRow;
@synthesize emptyCol;
@synthesize moves;

- (id) initWithFrame: (CGRect) frame
{
	self = [super initWithFrame: frame];
	if (self) {
		// Initialization code
		self.backgroundColor = [UIColor whiteColor];
        
		//Rows are numbered from top to bottom, starting at 0.
		//Columns are numbered from left to right, starting at 0.
		//The empty location is initially in the lower left corner.
		n = 3;
		emptyRow = n - 1;
		emptyCol = 0;
		margin = 1;
        
               
		array = [NSArray arrayWithObjects:
               [[TileView alloc] initWithView: self row: 0 col: 0],
               [[TileView alloc] initWithView: self row: 0 col: 1],
               [[TileView alloc] initWithView: self row: 0 col: 2],
               
               [[TileView alloc] initWithView: self row: 1 col: 0],
               [[TileView alloc] initWithView: self row: 1 col: 1],
               [[TileView alloc] initWithView: self row: 1 col: 2],
               
               //Lower left corner is empty.
               [[TileView alloc] initWithView: self row: 2 col: 1],
               [[TileView alloc] initWithView: self row: 2 col: 2],
               nil
               ];
        
		for (TileView *tileView in array) {
			[self addSubview: tileView];
		}
        
		//Place origin of View at center of upper left TileView.
		//Assume that each TileView is the same size.
        
		TileView *tileView = [array objectAtIndex: 0];
		CGSize tileSize = tileView.image.size;
		CGSize viewSize = self.bounds.size;
		CGFloat half = (n - 1) / 2;
        
		self.bounds = CGRectMake(
                                 half * (tileSize.width  + margin) - viewSize.width  / 2,
                                 half * (tileSize.height + margin) - viewSize.height / 2,
                                 viewSize.width,
                                 viewSize.height
                                 );
        for (int i = 0; i < 50; ++i) {
            NSUInteger r = rand() % array.count;
            TileView *touch = [array objectAtIndex: r];
            [touch touchesBegan: nil withEvent: nil];
        }
        
        moves = 0;
    
	}
	return self;
}

//Place the TileView at the given row and column.

- (void) place: (TileView *) tileView atRow: (NSUInteger) row col: (NSUInteger) col;
{
	CGSize size = tileView.bounds.size;
    
	tileView.center = CGPointMake(
                                  col * (size.width  + margin),
                                  row * (size.height + margin)
                                  );
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void) drawRect: (CGRect) rect
 {
 // Drawing code
 }
 */


@end
