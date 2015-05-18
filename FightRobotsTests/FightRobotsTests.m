//
//  FightRobotsTests.m
//  FightRobotsTests
//
//  Created by Mira on 5/16/15.
//  Copyright (c) 2015 Mira. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "Board.h"

@interface FightRobotsTests : XCTestCase

@property () Board *board;

@end

@implementation FightRobotsTests

// Put setup code here. This method is called before the invocation of each test method in the class.
- (void)setUp {
    [super setUp];

    Robot * robot = [[Robot alloc] init];
 
    self.board = [[Board alloc] init];
    [self.board addRobot: robot];
}

// Put teardown code here. This method is called after the invocation of each test method in the class.
- (void)tearDown {
    self.board = nil;
    
    [super tearDown];
}

// This is demonstration of the SEL usage..
- (void)executeCommands:(Board *) board :(NSMutableArray *) comands {
    if (!board) {
        @throw [NSException exceptionWithName: @"Invalid argument"
                                       reason: @"The board should not be nil"
                                     userInfo: nil];
    }
    for (NSString * comand in comands) {
        SEL selector = NSSelectorFromString(comand);
        IMP method = [board methodForSelector: selector];
        void (*func)(id, SEL) = (void *) method;
        func(board, selector);
    }
}


- (void)testExample {
//    NSMutableArray * comands = [NSMutableArray arrayWithObjects: @"move", @"move", @"turnLeft", @"move", nil];
//    [executeCommands:board :comands];
//     
//     XCTAssert(board.robots.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
