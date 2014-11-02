//
//  Operation.h
//  Test
//
//  Created by sasha on 05.11.13.
//  Copyright (c) 2013 sasha. All rights reserved.
//

#import "Symbol.h"

@interface Operation : Symbol {
    double firstOerand;
    double secondOperand;
    int operation;
}

-(id)initWithOperationID:(int)operationID;
-(double)makeOperationWithFirstOperator:(double)aFirstOperator andSecondOperator:(double)aSecondOperator;
-(id)copyWithZone:(NSZone*)zone;

@end
