//
//  Cell.h
//  GameOfLife
//
//  Created by Cory Foy on 1/27/15.
//  Copyright (c) 2015 Cory Foy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

@interface Cell : NSObject <NSCopying>

@property (nonatomic) BOOL aliveState;
@property (nonatomic) CGPoint position;

- (id)initAtLocation:(CGPoint)point;
- (BOOL)isAlive;
- (void)resurrect;
- (void)kill;

@end
