//
//  main.m
//  MyPuzzle
//
//  Created by Mike Smith on 3/12/13.
//  Copyright (c) 2013 Mike Smith. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "PuzzleAppDelegate.h"

int main(int argc, char *argv[])
{
    @autoreleasepool {
        
        srand(time(NULL));
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([PuzzleAppDelegate class]));
    }
}
