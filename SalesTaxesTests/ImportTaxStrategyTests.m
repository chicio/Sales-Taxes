//
//  ImportTaxStrategyTests.m
//  SalesTaxes
//
//  Created by Fabrizio Duroni on 13/11/2016.
//  Copyright © 2016 Fabrizio Duroni. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "Product.h"
#import "ImportTaxStrategy.h"

@interface ImportTaxStrategyTests : XCTestCase

@end

@implementation ImportTaxStrategyTests

- (void)setUp {

    [super setUp];
}

- (void)tearDown {

    [super tearDown];
}

/*!
 Test import tax calculation for local product.
 */
- (void)testImportSalesTaxesGenericProducts {
    
    id mockProduct = OCMClassMock([Product class]);
    OCMStub([mockProduct productOrigin]).andReturn(Local);
    OCMStub([mockProduct productPrice]).andReturn(11.25f);
    
    ImportTaxStrategy *strategy = [[ImportTaxStrategy alloc] init];
    
    XCTAssertEqual([strategy calculateTax:mockProduct], 0.f, @"Failed imported taxes calculation - local products");
}

/*!
 Test import tax calculation for imported product.
 */
- (void)testImportSalesTaxesImportedProducts {
    
    id mockProduct = OCMClassMock([Product class]);
    OCMStub([mockProduct productOrigin]).andReturn(Imported);
    OCMStub([mockProduct productPrice]).andReturn(11.25f);
    
    ImportTaxStrategy *strategy = [[ImportTaxStrategy alloc] init];
    
    XCTAssertEqual([strategy calculateTax:mockProduct], 0.5625f, @"Failed imported taxes calculation - imported products");
}

@end
