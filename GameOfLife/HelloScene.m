//
//  HelloScene.m
//  GameOfLife
//
//  Created by Cory Foy on 1/28/15.
//  Copyright (c) 2015 Cory Foy. All rights reserved.
//

#import "HelloScene.h"
#import "Game.h"
#import "Cell.h"
#include <stdlib.h>

@interface HelloScene ()
@property BOOL contentCreated;
@end

@implementation HelloScene

- (void)didMoveToView: (SKView *) view
{
    if (!self.contentCreated)
    {
        _timeSinceLastMove = 0;
        [self createSceneContents];
        _game = [[Game alloc] init];
        for(NSInteger i = 0; i < 40; i++)
        {
            int x = arc4random_uniform(self.size.width/100);
            int y = arc4random_uniform(self.size.height/100);
            NSLog(@"RAND! %d, %d", x, y);
            Cell *cell = [[Cell alloc] initAtLocation:CGPointMake(x,y)];
            [cell resurrect];
            [_game addCell:cell];
        }

        self.contentCreated = YES;
        [self showBoard];
    }
}

- (void)createSceneContents
{
    self.backgroundColor = [SKColor blueColor];
    self.scaleMode = SKSceneScaleModeAspectFit;
    for (int y = 0; y < self.size.height; y+=100) {
        for (int x = 0; x < self.size.width; x+=100) {
            SKSpriteNode *squareNode = [[SKSpriteNode alloc] initWithColor:[SKColor blueColor] size:CGSizeMake(100,100)];
            CGPoint squareCoordinate = CGPointMake(x, y);
            squareNode.position = squareCoordinate;
            [self addChild:squareNode];
        }
    }
}

-(void)showBoard
{
    for (int y = 0; y < self.size.height; y+=100) {
        for (int x = 0; x < self.size.width; x+=100) {
            NSMutableArray *cls = [self.game cells];
            NSInteger index = [cls indexOfObjectPassingTest:^BOOL(id obj, NSUInteger idx, BOOL *stop) {
                CGPoint comparison = CGPointMake(x/100, y/100);
                return CGPointEqualToPoint([obj position], comparison);
            }];
            Cell *cell = [[Cell alloc] init];
            if(index >=0 && index < self.size.width/100 ) {
                cell = [cls objectAtIndex:index];
            }
            SKColor *color = [cell isAlive] ? [SKColor redColor] : [SKColor blueColor];
            SKSpriteNode *squareNode = [[SKSpriteNode alloc] initWithColor:color size:CGSizeMake(100,100)];
            CGPoint squareCoordinate = CGPointMake(x, y);
            squareNode.position = squareCoordinate;
            [self addChild:squareNode];
        }
    }
}

-(void)update:(NSTimeInterval)currentTime {
    if(_timeSinceLastMove < 5) {
        _timeSinceLastMove += 1;
    } else {
        [_game tick];
        _timeSinceLastMove = 0;
        [self showBoard];
    }
}

- (SKLabelNode *)newHelloNode
{
    SKLabelNode *helloNode = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
    helloNode.text = @"Hello, World!";
    helloNode.fontSize = 42;
    helloNode.position = CGPointMake(CGRectGetMidX(self.frame),CGRectGetMidY(self.frame));
    return helloNode;
}

@end
