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
    
    if(TunnelTop.center.x == 30){
        [self Score];
    }
    
    // wenn Vogel und Hinternis sich berühren
    if(CGRectIntersectsRect(Bird.frame, TunnelTop.frame)){
        [self GameOver];
    }
    if(CGRectIntersectsRect(Bird.frame, TunnelButtom.frame)){
        [self GameOver];
    }
    if(CGRectIntersectsRect(Bird.frame, Top.frame)){
        [self GameOver];
    }
    if(CGRectIntersectsRect(Bird.frame, Bottom.frame)){
        [self GameOver];
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

-(void)Score{
    ScoreNumber = ScoreNumber + 5;
    // wie wollen einen Ineger (%i) darstellen
    ScoreLabel.text = [NSString stringWithFormat:@"%i", ScoreNumber];
}

// immer, wenn "irgend wo" geklickt wird
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    BirdFlight = 30;
    
}

-(void)GameOver{
    
    if(ScoreNumber > HighScoreNumber){
        // speichere den Highscore in HighScoreSaved
        [[NSUserDefaults standardUserDefaults] setInteger:ScoreNumber forKey:@"HighScoreSaved"];
    }

    // stop Timer/ Gameloop
    [TunnelMovement invalidate];
    [BirdMovement invalidate];
    
    Exit.hidden = NO;
    TunnelTop.hidden = YES;
    TunnelButtom.hidden = YES;
    Bird.hidden = YES;
    
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
    Exit.hidden = YES;
    ScoreNumber = 0;
    
    // Highscore auslesen
    // wenn HighScoreSaved nicht gefunden ist es 0
    HighScoreNumber = [[NSUserDefaults standardUserDefaults] integerForKey:@"HighScoreSaved"];
    
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
