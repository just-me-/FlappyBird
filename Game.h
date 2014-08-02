//
//  Game.h
//  Flappy Bird
//
//  Created by Marcel Hess on 02.08.14.
//  Copyright (c) 2014 Marcel Hess. All rights reserved.
//

#import <UIKit/UIKit.h>

int BirdFlight;
int RandomTopTunnelPosition;
int RandomButtonTunnelPosition;

@interface Game : UIViewController
{
    IBOutlet UIImageView *Bird;
    IBOutlet UIButton *StartGame;
    IBOutlet UIImageView *TunnelTop;
    IBOutlet UIImageView *TunnelButtom;
    IBOutlet UIImageView *Top;
    IBOutlet UIImageView *Bottom;
    
    NSTimer *BirdMovement;
    NSTimer *TunnelMovement;
}
-(IBAction)StartGame:(id)sender;
-(void)BirdMoving;
-(void)TunnelMoving;
-(void)PlaceTunnel;

@end
