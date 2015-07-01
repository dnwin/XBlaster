//
//  GameViewController.m
//  XBlaster
//
//  Created by Dennis Nguyen on 6/13/15.
//  Copyright (c) 2015 dnwin. All rights reserved.
//

#import "GameViewController.h"
#import "GameScene.h"

@implementation GameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    GameScene *scene = [[GameScene alloc] initWithSize:CGSizeMake(768, 1024)];
    SKView *skView = (SKView *)self.view;
    skView.showsFPS = YES;
    skView.showsNodeCount = YES;
    skView.ignoresSiblingOrder = YES;
    
    scene.scaleMode = SKSceneScaleModeAspectFill;
    [skView presentScene:scene];
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

@end
