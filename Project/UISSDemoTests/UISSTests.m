//
//  UISSTests.m
//  UISSTests
//
//  Created by Robert Wijas on 10/7/11.
//  Copyright (c) 2011 57things. All rights reserved.
//

#import "UISSTests.h"
#import "UISS+Private.h"

@implementation UISSTests

- (void)setUp
{
  [super setUp];
  
  // Set-up code here.
}

- (void)tearDown
{
  // Tear-down code here.
  
  [super tearDown];
}

- (void)checkCanAcceptArguments:(NSArray *)arguments class:(Class)class selector:(SEL)selector expected:(BOOL)expected;
{
  NSMethodSignature *methodSignature = [class instanceMethodSignatureForSelector:selector];
  STAssertNotNil(methodSignature, nil);
  
  if (methodSignature) {
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:methodSignature];
    
    if (expected) {
      STAssertTrue([invocation canAcceptArguments:arguments], nil);
    } else {
      STAssertFalse([invocation canAcceptArguments:arguments], nil);
    }
  }
}

- (void)testCanInvocationAcceptArguments;
{
  [self checkCanAcceptArguments:[NSArray array] 
                          class:[UIToolbar class]
                       selector:@selector(setBackgroundImage:forToolbarPosition:barMetrics:) expected:YES];

  [self checkCanAcceptArguments:[NSArray arrayWithObjects:@"yellow", [NSNumber numberWithInteger:0], nil] 
                          class:[UIToolbar class]
                       selector:@selector(setTintColor:) expected:NO];
}

#pragma mark - Parameters

@end