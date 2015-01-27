//
//  Game.h
//  GameOfLife
//
//  Created by Cory Foy on 1/27/15.
//  Copyright (c) 2015 Cory Foy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Game : NSObject

@property (nonatomic) NSMutableArray *cells;

- (void)addCell:(Cell *)cell;
- (void)tick;

@end
