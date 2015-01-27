//
//  NeighborhoodSpec.m
//  GameOfLife
//
//  Created by Cory Foy on 1/27/15.
//  Copyright (c) 2015 Cory Foy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Specta/Specta.h>
#define EXP_SHORTHAND
#import "Expecta.h"
#import "Cell.h"
#import "Neighborhood.h"

SpecBegin(Neighborhood)

describe(@"Neighborhood", ^{
    it(@"knows there are zero alive neighbors from the origin when all cells are dead", ^{
        Cell *cell = [[Cell alloc] init];
        Neighborhood *neighborhood = [[Neighborhood alloc] initWithOriginCell:cell];
        
        expect([neighborhood aliveNeighborsCount]).to.equal(0);
    });
    it(@"knows the count of alive neighbors when there are alive neighbors", ^{
        Cell *cell = [[Cell alloc] init];
        Neighborhood *neighborhood = [[Neighborhood alloc] initWithOriginCell:cell];
        Cell *n1 = [[Cell alloc] init];
        Cell *n2 = [[Cell alloc] init];
        Cell *n3 = [[Cell alloc] init];
        Cell *n4 = [[Cell alloc] init];
        Cell *n5 = [[Cell alloc] init];
        Cell *n6 = [[Cell alloc] init];
        Cell *n7 = [[Cell alloc] init];
        Cell *n8 = [[Cell alloc] init];
        [n8 resurrect];
        NSArray *cells = [NSArray arrayWithObjects:n1, n2, n3, n4, n5, n6, n7, n8, nil];
        [neighborhood setNeighbors:cells];
        
        expect([neighborhood aliveNeighborsCount]).to.equal(1);
    });
    it(@"considers neighbors not present to be dead", ^{
        Cell *cell = [[Cell alloc] init];
        Neighborhood *neighborhood = [[Neighborhood alloc] initWithOriginCell:cell];
        Cell *n1 = [[Cell alloc] init];
        Cell *n2 = [[Cell alloc] init];
        Cell *n3 = [[Cell alloc] init];
        [n1 resurrect];
        [n2 resurrect];
        NSArray *cells = [NSArray arrayWithObjects:n1, n2, n3, nil];
        [neighborhood setNeighbors:cells];
        
        expect([neighborhood aliveNeighborsCount]).to.equal(2);
    });
    it(@"knows the count of alive neighbors from the world", ^{
        Cell *target = [[Cell alloc] initAtLocation:CGPointMake(3,3)];
        Cell *n1 = [[Cell alloc] initAtLocation:CGPointMake(4,3)];
        Cell *n2 = [[Cell alloc] initAtLocation:CGPointMake(4,3)];
        [n2 resurrect];
        NSArray *world = [NSArray arrayWithObjects:n1, n2, nil];
        Neighborhood *neighborhood = [[Neighborhood alloc] initWithOriginCell:target andWorld:world];
        expect([neighborhood aliveNeighborsCount]).to.equal(1);
    });
    it(@"ignores cells which aren't neighbors", ^{
        Cell *target = [[Cell alloc] initAtLocation:CGPointMake(3,3)];
        Cell *n1 = [[Cell alloc] initAtLocation:CGPointMake(10,9)];
        Cell *n2 = [[Cell alloc] initAtLocation:CGPointMake(4,3)];
        [n1 resurrect];
        [n2 resurrect];
        NSArray *world = [NSArray arrayWithObjects:n1, n2, nil];
        Neighborhood *neighborhood = [[Neighborhood alloc] initWithOriginCell:target andWorld:world];
        expect([neighborhood aliveNeighborsCount]).to.equal(1);
    });
});

SpecEnd
