//
//  Game.h
//  Flappy Bird
//
//  Created by Marcel Hess on 02.08.14.
//  Copyright (c) 2014 Marcel Hess. All rights reserved.
//

#import <UIKit/UIKit.h>

int BirdFlight;

@interface Game : UIViewController
{
    IBOutlet UIImageView *Bird;
    IBOutlet UIButton *StartGame;
    
    NSTimer *BirdMovement;
}
-(IBAction)StartGame:(id)sender;
-(void)BirdMoving;

@end
