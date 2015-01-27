//
//  GameSpec.m
//  GameOfLife
//
//  Created by Cory Foy on 1/27/15.
//  Copyright (c) 2015 Cory Foy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Specta/Specta.h>
#define EXP_SHORTHAND
#import "Expecta.h"
#import "Game.h"
#import "Cell.h"

SpecBegin(Game)

describe(@"Game", ^{
    it(@"it kills lonely cells on tick", ^{
        Cell *cell = [[Cell alloc] init];
        [cell resurrect];
        
        Game *game = [[Game alloc] init];
        [game addCell:cell];
        [game tick];
        expect([cell isAlive]).to.equal(NO);
    });
    it(@"resurrects dead cells with exactly 3 alive neighbors", ^{
        Cell *target = [[Cell alloc] initAtLocation:CGPointMake(3,3)];
        Cell *n1 = [[Cell alloc] initAtLocation:CGPointMake(4,3)];
        Cell *n2 = [[Cell alloc] initAtLocation:CGPointMake(3,2)];
        Cell *n3 = [[Cell alloc] initAtLocation:CGPointMake(2,2)];
        [n1 resurrect];
        [n2 resurrect];
        [n3 resurrect];
        Game *game = [[Game alloc] init];
        [game addCell:target];
        [game addCell:n1];
        [game addCell:n2];
        [game addCell:n3];
        [game tick];
        expect([target isAlive]).to.equal(YES);
        
    });
    it(@"kills alive cells with more than 3 alive neighbors", ^{
        Cell *target = [[Cell alloc] initAtLocation:CGPointMake(3,3)];
        Cell *n1 = [[Cell alloc] initAtLocation:CGPointMake(4,3)];
        Cell *n2 = [[Cell alloc] initAtLocation:CGPointMake(3,2)];
        Cell *n3 = [[Cell alloc] initAtLocation:CGPointMake(2,2)];
        Cell *n4 = [[Cell alloc] initAtLocation:CGPointMake(4,4)];
        [target resurrect];
        [n1 resurrect];
        [n2 resurrect];
        [n3 resurrect];
        [n4 resurrect];
        Game *game = [[Game alloc] init];
        [game addCell:target];
        [game addCell:n1];
        [game addCell:n2];
        [game addCell:n3];
        [game addCell:n4];
        [game tick];
        expect([target isAlive]).to.equal(NO);
        
    });
});

SpecEnd
