//
//  Neighborhood.m
//  GameOfLife
//
//  Created by Cory Foy on 1/27/15.
//  Copyright (c) 2015 Cory Foy. All rights reserved.
//

#import "Neighborhood.h"

@implementation Neighborhood

- (id)initWithOriginCell:(Cell *)origin {
    if ( self = [super init] ) {
        _origin = origin;
        return self;
    } else {
        return nil;
    }
}

- (id)initWithOriginCell:(Cell *)origin andWorld:(NSArray *)world {
    if ( self = [super init] ) {
        _origin = origin;
        self.neighbors = [self findNeighborsFromWorld:world];
        return self;
    } else {
        return nil;
    }
}

-(NSInteger)aliveNeighborsCount
{
    return [self.neighbors indexesOfObjectsPassingTest:^BOOL(id obj, NSUInteger idx, BOOL *stop) {
        return [obj isAlive];
    }].count;
}

-(NSArray *)findNeighborsFromWorld:(NSArray *)world
{
    return [world objectsAtIndexes:[world indexesOfObjectsPassingTest:^BOOL(id obj, NSUInteger idx, BOOL *stop) {
        CGFloat distance = hypotf([self.origin position].x - [obj position].x, [self.origin position].y - [obj position].y);
        return distance < 2.0;
    }]];
}

@end
