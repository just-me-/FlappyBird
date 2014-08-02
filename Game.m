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
    
    //blende das Label aus
    StartGame.hidden = YES;
    //rufe alle 0.05s BirdMoving() auf
    BirdMovement = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self
                    selector:@selector(BirdMoving) userInfo:nil repeats: YES];
    
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
