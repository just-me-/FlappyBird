//
//  Game.m
//  Flappy Bird
//
//  Created by Marcel Hess on 02.08.14.
//  Copyright (c) 2014 Marcel Hess. All rights reserved.
//

#import "Game.h"

@interface Game ()

@end

@implementation Game

-(IBAction)StartGame:(id)sender{
    
    TunnelTop.hidden = NO;
    TunnelButtom.hidden = NO;
    
    //blende das Label aus
    StartGame.hidden = YES;
    //rufe alle 0.05s BirdMoving() auf
    BirdMovement = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self
                    selector:@selector(BirdMoving) userInfo:nil repeats: YES];
    // Methodenaufruf
    [self PlaceTunnel];
    
    TunnelMovement = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self
                      selector:@selector(TunnelMoving) userInfo:nil repeats: YES];
    
}

-(void)PlaceTunnel{
    
    RandomTopTunnelPosition = arc4random() %350;
    RandomTopTunnelPosition = RandomTopTunnelPosition - 228;
    RandomButtonTunnelPosition = RandomTopTunnelPosition + 655;
    
    TunnelTop.center = CGPointMake(340, RandomTopTunnelPosition);
    TunnelButtom.center = CGPointMake(340, RandomButtonTunnelPosition);
    
    
}

-(void)TunnelMoving{
    // beweg dich nach links - Näherung dem Vogel
    TunnelTop.center = CGPointMake(TunnelTop.center.x -1, TunnelTop.center.y);
    TunnelButtom.center = CGPointMake(TunnelButtom.center.x -1, TunnelButtom.center.y);
    
    // wenn ganz links; aus dem Spiel
    if(TunnelTop.center.x < -28){
        [self PlaceTunnel];
    }
    
}

-(void)BirdMoving{
    
    // Vogel fällt...
    Bird.center = CGPointMake(Bird.center.x, Bird.center.y - BirdFlight);
    
    BirdFlight = BirdFlight - 5;
    
    // falle aber nicht zu schnell...
    if(BirdFlight < -15){
        BirdFlight = -15;
    }
    
    // wenn der Vogel steigt, zeige das andere Bild
    if(BirdFlight > 0){
        Bird.image = [UIImage imageNamed:@"Bird Up.png"];
    }
    // und sonst das fallende Bild
    if(BirdFlight < 0){
        Bird.image = [UIImage imageNamed:@"Bird Down.png"];
    }
    
}

// immer, wenn "irgend wo" geklickt wird
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    BirdFlight = 30;
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    TunnelTop.hidden = YES;
    TunnelButtom.hidden = YES;
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
