//
//  BasicStrategyTests.m
//  SalesTaxes
//
//  Created by Fabrizio Duroni on 13/11/2016.
//  Copyright © 2016 Fabrizio Duroni. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "Product.h"
#import "BasicTaxStrategy.h"

@interface BasicStrategyTests : XCTestCase

@end

@implementation BasicStrategyTests

- (void)setUp {
    
    [super setUp];
}

- (void)tearDown {

    [super tearDown];
}

/*!
 Test basic tax calculation for generic product.
 */
- (void)testBasicSalesTaxesGenericProducts {

    id mockProduct = OCMClassMock([Product class]);
    OCMStub([mockProduct productType]).andReturn(Other);
    OCMStub([mockProduct productPrice]).andReturn(11.25f);

    BasicTaxStrategy *strategy = [[BasicTaxStrategy alloc] init];
    
    XCTAssertEqual([strategy calculateTax:mockProduct], 1.125f, @"Failed basic taxes calculation - other products");
}

/*!
 Test basic tax calculation for exception product.
 */
- (void)testBasicSalesTaxesExceptionProducts {
    
    BasicTaxStrategy *strategy = [[BasicTaxStrategy alloc] init];

    id mockProduct = OCMClassMock([Product class]);
    OCMStub([mockProduct productType]).andReturn(Food);
    OCMStub([mockProduct productPrice]).andReturn(11.25f);
    
    XCTAssertEqual([strategy calculateTax:mockProduct], 0.f, @"Failed basic taxes calculation - food products");
    
    mockProduct = OCMClassMock([Product class]);
    OCMStub([mockProduct productType]).andReturn(Book);
    OCMStub([mockProduct productPrice]).andReturn(11.25f);
    
    XCTAssertEqual([strategy calculateTax:mockProduct], 0.f, @"Failed basic taxes calculation - book products");
    
    mockProduct = OCMClassMock([Product class]);
    OCMStub([mockProduct productType]).andReturn(Medical);
    OCMStub([mockProduct productPrice]).andReturn(11.25f);
    
    XCTAssertEqual([strategy calculateTax:mockProduct], 0.f, @"Failed basic taxes calculation - medical products");
}

@end
