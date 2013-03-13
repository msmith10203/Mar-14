//
//  TileView.h
//  MyPuzzle
//
//  Created by Mike Smith on 3/12/13.
//  Copyright (c) 2013 Mike Smith. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>

@class View;

@interface TileView : UIImageView {
    View *view;
    NSUInteger row;
    NSUInteger col;
    SystemSoundID sid;
    
}

-(id) initWithView: (View *) v row: (NSUInteger) r col: (NSUInteger) c;

@end
