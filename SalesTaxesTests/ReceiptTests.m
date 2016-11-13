//
//  ReceiptTests.m
//  SalesTaxes
//
//  Created by Fabrizio Duroni on 13/11/2016.
//  Copyright © 2016 Fabrizio Duroni. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "Receipt.h"
#import "ShoppingCart.h"
#import "ShoppingItem.h"
#import "Product.h"

@interface ReceiptTests : XCTestCase

@end

@implementation ReceiptTests

- (void)setUp {
    
    [super setUp];
}

- (void)tearDown {
    
    [super tearDown];
}

/*!
 Test receipt content generation.
 */
- (void)testReceiptOutput {
    
    id mockProductOne = OCMClassMock([Product class]);
    OCMStub([mockProductOne productName]).andReturn(@"bottle of perfume");
    OCMStub([mockProductOne productPrice]).andReturn(18.99f);
    OCMStub([mockProductOne productType]).andReturn(Other);
    OCMStub([mockProductOne productOrigin]).andReturn(Local);
    
    id mockProductTwo = OCMClassMock([Product class]);
    OCMStub([mockProductTwo productName]).andReturn(@"packet of headache pills");
    OCMStub([mockProductTwo productPrice]).andReturn(9.75f);
    OCMStub([mockProductTwo productType]).andReturn(Medical);
    OCMStub([mockProductTwo productOrigin]).andReturn(Local);
    
    id mockProductThree = OCMClassMock([Product class]);
    OCMStub([mockProductThree productName]).andReturn(@"box of imported chocolates");
    OCMStub([mockProductThree productPrice]).andReturn(11.25f);
    OCMStub([mockProductThree productType]).andReturn(Food);
    OCMStub([mockProductThree productOrigin]).andReturn(Imported);
    
    id mockShoppingItemOne = OCMClassMock([ShoppingItem class]);
    OCMStub([mockShoppingItemOne quantity]).andReturn(1);
    OCMStub([mockShoppingItemOne getCost]).andReturn(20.89f);
    OCMStub([mockShoppingItemOne product]).andReturn(mockProductOne);
    
    id mockShoppingItemTwo = OCMClassMock([ShoppingItem class]);
    OCMStub([mockShoppingItemTwo quantity]).andReturn(1);
    OCMStub([mockShoppingItemTwo getCost]).andReturn(9.75f);
    OCMStub([mockShoppingItemTwo product]).andReturn(mockProductTwo);
    
    id mockShoppingItemThree = OCMClassMock([ShoppingItem class]);
    OCMStub([mockShoppingItemThree quantity]).andReturn(1);
    OCMStub([mockShoppingItemThree getCost]).andReturn(11.85f);
    OCMStub([mockShoppingItemThree product]).andReturn(mockProductThree);
    
    NSDictionary *shoppingItemList = @{
        @"bottle of perfume": mockShoppingItemOne,
        @"packet of headache pills": mockShoppingItemTwo,
        @"box of imported chocolates":mockShoppingItemThree
    };
    
    NSArray *shoppingItemKeyList = @[
        @"bottle of perfume",
        @"packet of headache pills",
        @"box of imported chocolates"
    ];
    
    id mockShoppingCart = OCMClassMock([ShoppingCart class]);
    OCMStub([mockShoppingCart getTotal]).andReturn(42.49f);
    OCMStub([mockShoppingCart getTotalTaxes]).andReturn(2.5f);
    OCMStub([mockShoppingCart shoppingItemList]).andReturn(shoppingItemList);
    OCMStub([mockShoppingCart shoppingItemKeyOrder]).andReturn(shoppingItemKeyList);
    
    Receipt *receipt = [[Receipt alloc] initWithShoppingCart:mockShoppingCart];
    NSString *receiptContent = [receipt generateReceipt];
    
    BOOL areEqual = [receiptContent isEqualToString:@"\n1 bottle of perfume: 20.89 \n1 packet of headache pills: 9.75 "
                                                     "\n1 box of imported chocolates: 11.85 \n\nSales Taxes: 2.50 "
                                                     "\nTotal: 42.49 \n"];
    
    XCTAssertEqual(areEqual, YES, @"Failed receipt generation");
}

@end
