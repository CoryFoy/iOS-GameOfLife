//
//  Cell.m
//  GameOfLife
//
//  Created by Cory Foy on 1/27/15.
//  Copyright (c) 2015 Cory Foy. All rights reserved.
//

#import "Cell.h"


@implementation Cell

- (id)init {
    self = [super init];
    
    if (self) {
        _aliveState = NO;
    }
    
    return self;
}

- (id)initAtLocation:(CGPoint) position {
    self = [super init];
    
    if (self) {
        _aliveState = NO;
        _position = position;
    }
    
    return self;
}

- (id)copyWithZone:(NSZone *)zone
{
    id copy = [[[self class] alloc] init];
    
    if (copy) {
        [copy setAliveState:self.aliveState];
        [copy setPosition:self.position];
    }
    
    return copy;
}

- (BOOL)isAlive
{
    return [self aliveState];
}
-(void)resurrect
{
    [self setAliveState:YES];
}
-(void)kill
{
    [self setAliveState:NO];
}
@end
