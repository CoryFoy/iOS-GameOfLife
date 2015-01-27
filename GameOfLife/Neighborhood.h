//
//  Neighborhood.h
//  GameOfLife
//
//  Created by Cory Foy on 1/27/15.
//  Copyright (c) 2015 Cory Foy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Neighborhood : NSObject

@property (nonatomic) Cell *origin;
@property (nonatomic) NSArray *neighbors;

- (id)initWithOriginCell:(Cell *)origin;
- (id)initWithOriginCell:(Cell *)origin andWorld:(NSArray *)world;
- (NSInteger)aliveNeighborsCount;

@end
