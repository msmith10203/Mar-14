//
//  TileView.m
//  MyPuzzle
//
//  Created by Mike Smith on 3/12/13.
//  Copyright (c) 2013 Mike Smith. All rights reserved.
//

#import "TileView.h"
#import "View.h"

@implementation TileView

- (id) initWithView: (View *) v row: (NSUInteger) r col: (NSUInteger) c {
	NSString *filename = [NSString stringWithFormat: @"%u%u.png", r, c];
	UIImage *image = [UIImage imageNamed: filename];
	if (image == nil) {
		NSLog(@"could not find file %u%u.png", r, c);
		return nil;
	}
    
	self = [super initWithImage: image];
	if (self) {
		// Initialization code
		self.userInteractionEnabled = YES;	//UIImageView defaults to NO.
		view = v;
		row = r;
		col = c;
		[view place: self atRow: row col: col];
        
        
        // Override point for customization after application launch.
        NSBundle *bundle = [NSBundle mainBundle];
        NSLog(@"bundle.bundlePath == \"%@\"", bundle.bundlePath);
        
        NSString *filename = [bundle pathForResource: @"chinese" ofType: @"mp3"];
        NSLog(@"filename == \"%@\"", filename);
        
        NSURL *url = [NSURL fileURLWithPath: filename isDirectory: NO];
        NSLog(@"url == \"%@\"", url);
        
        OSStatus error = AudioServicesCreateSystemSoundID((__bridge CFURLRef)url, &sid);
        if (error != kAudioServicesNoError) {
            NSLog(@"AudioServicesCreateSystemSoundID error == %ld", error);
        }
        
        view.moves=0;
        
	}
	return self;
}

- (void) touchesBegan: (NSSet *) touches withEvent: (UIEvent *) event {
	
	//Can this tile move into the empty position?
	//Or is this tile landlocked?
	NSUInteger dRow = abs(row - view.emptyRow);
	NSUInteger dCol = abs(col - view.emptyCol);
    
	if (dRow + dCol == 1) {
        
		//Swap row and view.emptyRow.
		NSUInteger temp = row;
		row = view.emptyRow;
		view.emptyRow = temp;
        
		//Swap col and view.emptyCol.
		temp = col;
		col = view.emptyCol;
		view.emptyCol = temp;
        
		[UIView animateWithDuration: 0.2
                              delay: 0
                            options: UIViewAnimationOptionCurveEaseInOut
                         animations: ^{[view place: self atRow: row col: col];}
                         completion: NULL
         ];
        ++view.moves;
        NSLog(@"number of moves is: %d ", view.moves);
	}
    else{
                //AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
        AudioServicesPlaySystemSound(sid);
    }
}

@end
