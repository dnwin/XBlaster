//
//  GameScene.m
//  XBlaster
//
//  Created by Dennis Nguyen on 6/13/15.
//  Copyright (c) 2015 dnwin. All rights reserved.
//

#import "GameScene.h"

static const NSUInteger g_max_inflight_buffers = 3;
float number = 1234;

@interface GameScene()

@property (strong, nonatomic) SKNode *playerLayerNode;
@property (strong, nonatomic) SKNode *hudLayerNode;

@property (nonatomic) CGRect playableRect;
@property CGFloat hudHeight;





@end

@implementation GameScene

-(instancetype)initWithSize:(CGSize)size {
    self = [super initWithSize:size];
    if (self) {
        _playerLayerNode = [[SKNode alloc] init];
        _hudLayerNode = [[SKNode alloc] init];
        _hudHeight = 90;
        
        // PlaybleRect
        CGFloat maxAspectRatio = 16.0/9.0;
        CGFloat maxAspecRatioWidth = self.size.height / maxAspectRatio;
        CGFloat playableMargin = (self.size.width - maxAspecRatioWidth) / 2.0;
        _playableRect = CGRectMake(playableMargin, 0, maxAspecRatioWidth, size.height - self.hudHeight);
        
        
        [self setupSceneLayers];
        [self setupUI];
    }
    
    return self;
}



-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

-(void)setupSceneLayers {
    self.playerLayerNode.zPosition = 50;
    // On top
    self.hudLayerNode.zPosition = 100;
    
    [self addChild:self.playerLayerNode];
    [self addChild:self.hudLayerNode];
}

-(void)setupUI {
    
    // Make a black HUD node on top of screen
    CGSize backgroundSize = CGSizeMake(self.size.width, self.hudHeight);
    SKColor *backgroundColor = [SKColor blackColor];
    
    SKSpriteNode *hudBarBackground = [[SKSpriteNode alloc] initWithColor:backgroundColor size:backgroundSize];

    // Set position of HUD to top of screen minus desired hudheight/size
    hudBarBackground.position = CGPointMake(0, self.size.height - self.hudHeight);
    hudBarBackground.anchorPoint = CGPointZero;
    [self.hudLayerNode addChild:hudBarBackground];
    
    // Score Label inside hud
    SKLabelNode *scoreLabel = [[SKLabelNode alloc] initWithFontNamed:@"Edit Undo Line BRK"];
    scoreLabel.fontSize = 50;
    scoreLabel.text = @"Score: 0";
    scoreLabel.name = @"scoreLabel";
    scoreLabel.verticalAlignmentMode = SKLabelVerticalAlignmentModeCenter;
    
    // Configure position in terms of superview
    scoreLabel.position = CGPointMake(self.size.width / 2, self.size.height - scoreLabel.frame.size.height + 3);
    [self.hudLayerNode addChild:scoreLabel];
    
    
    
    
}

@end
