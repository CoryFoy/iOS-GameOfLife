//
//  CellSpec.m
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

SpecBegin(Cell)

describe(@"Cell", ^{
    it(@"is dead on creation", ^{
        Cell *cell = [[Cell alloc] init];
        
        expect([cell isAlive]).to.equal(NO);
    });
    it(@"is alive when brought to life", ^{
        Cell *cell = [[Cell alloc] init];
        [cell resurrect];
        expect([cell isAlive]).to.equal(YES);
    });
    it(@"is dead when killed after being brought to life", ^{
        Cell *cell = [[Cell alloc] init];
        [cell resurrect];
        [cell kill];
        expect([cell isAlive]).to.equal(NO);
    });
});

SpecEnd
