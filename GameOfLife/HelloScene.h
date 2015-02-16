//
//  HelloScene.h
//  GameOfLife
//
//  Created by Cory Foy on 1/28/15.
//  Copyright (c) 2015 Cory Foy. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "Game.h"

@interface HelloScene : SKScene
@property (nonatomic) Game *game;
@property (nonatomic) NSInteger timeSinceLastMove;

@end
