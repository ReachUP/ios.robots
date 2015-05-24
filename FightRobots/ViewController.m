//
//  ViewController.m
//  FightRobots
//
//  Created by Mira on 5/16/15.
//  Copyright (c) 2015 Mira. All rights reserved.
//

#import "ViewController.h"
#import "Board.h"
#import "Spinner.h"
#import "BigFoot.h"
#import "position/Point.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)fillRobotDataForRobot:(Robot*)robot name:(NSString*)name faces:(Direction)direction position:(Point2D*)position life:(int)life maxStrength:(int)maxStrength dateCreated:(NSDate*)dateCreated {
    [robot setName:name];
    [robot setFaces:direction];
    [robot setPosition:position];
    [robot setLife:life];
    [robot setMaxStrength:maxStrength];
    [robot setDateCreated:dateCreated];
}

- (void)viewDidAppear:(BOOL)animated {
    NSDate *today = [NSDate date];
    Robot *r1 = [Spinner new], *r2 = [BigFoot new], *r3 = [BigFoot new], *r4 = [BigFoot new];
    
    [self fillRobotDataForRobot:r1 name:@"SpinMeArround-a-tron" faces:EAST position:[Point2D makePointWithX:5 andY:5] life:12 maxStrength:8 dateCreated:today];
    [self fillRobotDataForRobot:r2 name:@"GrandFoot" faces:NORTH position:[Point2D makePointWithX:0 andY:5] life:15 maxStrength:15 dateCreated:today];
    [self fillRobotDataForRobot:r3 name:@"BigFoot" faces:NORTH position:[Point2D makePointWithX:1 andY:2] life:12 maxStrength:18 dateCreated:today];
    [self fillRobotDataForRobot:r4 name:@"Terminator" faces:NORTH position:[Point2D makePointWithX:3 andY:3] life:30 maxStrength:8 dateCreated:today];
    
    [[Board sharedInstance] addRobot:r1];
    [[Board sharedInstance] addRobot:r2];
    [[Board sharedInstance] addRobot:r3];
    [[Board sharedInstance] addRobot:r4];
    
    [[Board sharedInstance] printState];
    
    [[Board sharedInstance] turnLeft];
    [[Board sharedInstance] move];
    [[Board sharedInstance] move];
    [[Board sharedInstance] printState];
    [[Board sharedInstance] move];
    [[Board sharedInstance] move];
    [[Board sharedInstance] printState];
    [[Board sharedInstance] move];
    [[Board sharedInstance] move];
    [[Board sharedInstance] turnLeft];
    [[Board sharedInstance] move];
    [[Board sharedInstance] move];
    [[Board sharedInstance] turnLeft];
    [[Board sharedInstance] move];
    [[Board sharedInstance] move];
    [[Board sharedInstance] turnLeft];
    [[Board sharedInstance] move];
    [[Board sharedInstance] move];
    [[Board sharedInstance] turnLeft];
    [[Board sharedInstance] move];
    [[Board sharedInstance] move];
    [[Board sharedInstance] printState];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
