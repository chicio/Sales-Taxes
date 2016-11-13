//
//  ProductTests.m
//  SalesTaxes
//
//  Created by Fabrizio Duroni on 13/11/2016.
//  Copyright © 2016 Fabrizio Duroni. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "Product.h"

@interface ProductTests : XCTestCase

@end

@implementation ProductTests

- (void)setUp {

    [super setUp];
}

- (void)tearDown {

    [super tearDown];
}

/*!
 Test product creation.
 */
- (void)testProductContruction {

    Product *product = [[Product alloc] initWithName:@"Test" andPrice:10.0f andType:Other andOrigin:Local];
    
    XCTAssertEqualObjects(product.productName, @"Test", @"Failed product constructor - name");
    XCTAssertEqual(product.productPrice, 10.0f, @"Failed product constructor - price");
    XCTAssertEqual(product.productType, Other, @"Failed product constructor - type");
    XCTAssertEqual(product.productOrigin, Local, @"Failed product constructor - origin");
}

@end
