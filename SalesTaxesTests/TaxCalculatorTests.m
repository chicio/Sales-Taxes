//
//  TaxTests.m
//  SalesTaxes
//
//  Created by Fabrizio Duroni on 12/11/2016.
//  Copyright © 2016 Fabrizio Duroni. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "TaxCalculator.h"
#import "BasicTaxStrategy.h"
#import "ImportTaxStrategy.h"
#import "ProductType.h"
#import "ProductOrigin.h"

@interface TaxCalculatorTests : XCTestCase

@end

@implementation TaxCalculatorTests

- (void)setUp {
    
    [super setUp];
}

- (void)tearDown {

    [super tearDown];
}

/*!
 Test tax calculation and round decimal values accurancy.
 */
- (void)testCalculatorResultAccurancy {
    
    id mockProduct = OCMClassMock([Product class]);
    OCMStub([mockProduct productName]).andReturn(@"Test product 1");
    OCMStub([mockProduct productOrigin]).andReturn(Imported);
    OCMStub([mockProduct productType]).andReturn(Food);
    OCMStub([mockProduct productPrice]).andReturn(11.25f);
    
    TaxCalculator *taxCalculator = [[TaxCalculator alloc] init];
    
    XCTAssertEqual([taxCalculator getTaxes:mockProduct], 0.60f, @"Failed shopping cart total taxes.");
}

@end
