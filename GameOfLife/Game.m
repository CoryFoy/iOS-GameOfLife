//
//  Game.m
//  GameOfLife
//
//  Created by Cory Foy on 1/27/15.
//  Copyright (c) 2015 Cory Foy. All rights reserved.
//

#import "Game.h"
#import "Neighborhood.h"

@implementation Game

- (id)init {
    self = [super init];
    
    if (self) {
        _cells = [[NSMutableArray alloc] init];
    }
    
    return self;
}


- (void)addCell:(Cell *)cell {
    [self.cells addObject:cell];
}

- (void)tick {
    NSArray *originalCells = [[NSArray alloc] initWithArray:self.cells copyItems:YES];
    for(Cell *cell in originalCells) {
        
        Cell *cellToUpdate = [self.cells objectAtIndex:[self.cells indexOfObjectPassingTest:^BOOL(id obj, NSUInteger idx, BOOL *stop) {
            return CGPointEqualToPoint([cell position], [obj position]);
        }]];
        
        Neighborhood *n = [[Neighborhood alloc] initWithOriginCell:cell andWorld:originalCells];
        
        if(n.aliveNeighborsCount < 2 && cell.isAlive == YES) {
            [cellToUpdate kill];
        }else if(n.aliveNeighborsCount == 3 && cell.isAlive == NO) {
            [cellToUpdate resurrect];
        }else if(n.aliveNeighborsCount > 3 && cell.isAlive == YES) {
            [cellToUpdate kill];
        }
    }
}

@end
