//
//  TaxCalculatorContextTests.m
//  SalesTaxes
//
//  Created by Fabrizio Duroni on 13/11/2016.
//  Copyright © 2016 Fabrizio Duroni. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "TaxCalculatorContext.h"
#import "BasicTaxStrategy.h"
#import "ImportTaxStrategy.h"

@interface TaxCalculatorContextTests : XCTestCase

@end

@implementation TaxCalculatorContextTests

- (void)setUp {

    [super setUp];
}

- (void)tearDown {

    [super tearDown];
}

- (void)testContextSwitching {

    id mockProduct = OCMClassMock([Product class]);
    
    id mockBasic = OCMClassMock([BasicTaxStrategy class]);
    OCMStub([mockBasic calculateTax:mockProduct]).andReturn(10.f);

    id mockImported = OCMClassMock([BasicTaxStrategy class]);
    OCMStub([mockImported calculateTax:mockProduct]).andReturn(20.f);
    
    TaxCalculatorContext *taxCalculatorContex = [[TaxCalculatorContext alloc] init];
    taxCalculatorContex.taxCalculatorStrategy = mockBasic;
    float taxes = [taxCalculatorContex calculateTax:mockProduct];
    
    XCTAssertEqual(taxes, 10.f, @"Failed shopping cart total.");

    taxCalculatorContex.taxCalculatorStrategy = mockImported;
    taxes = [taxCalculatorContex calculateTax:mockProduct];
    
    XCTAssertEqual(taxes, 20.f, @"Failed shopping cart total.");
}

@end
