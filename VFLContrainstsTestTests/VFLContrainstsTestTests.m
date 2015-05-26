//
//  VFLContrainstsTestTests.m
//  VFLContrainstsTestTests
//
//  Created by dev on 15/5/22.
//  Copyright (c) 2015年 dev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

@interface VFLContrainstsTestTests : XCTestCase

@end

@implementation VFLContrainstsTestTests

- (void)setUp {
    [super setUp]; NSLog(@"%s", __PRETTY_FUNCTION__);

    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
   }

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

-(void) testfu{
    NSLog(@"%s ----------------------", __PRETTY_FUNCTION__);
}
-(void) testfu1{
    NSLog(@"%s ----------------------", __PRETTY_FUNCTION__);
}
-(void) testfu2{
    NSLog(@"%s ----------------------", __PRETTY_FUNCTION__);
}
-(void) testfu3{
    NSLog(@"%s ----------------------", __PRETTY_FUNCTION__);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        [NSThread sleepForTimeInterval:0.1];
        NSLog(@"%s ----------------------", __PRETTY_FUNCTION__);
// Put the code you want to measure the time of here.
    }];
}

@end
