//
//  Operation.m
//  Test
//
//  Created by sasha on 05.11.13.
//  Copyright (c) 2013 sasha. All rights reserved.
//

#import "Operation.h"

@implementation Operation

-(id)initWithOperationID:(int)operationID {
    if (self = [super init]) {
        operation = operationID;
        [self setOperatorSymbol];
    }
    
    return self;
}

-(void)setOperatorSymbol {
    switch (operation) {
        case 1:
            string = @"+";
            break;
        case 2:
            string = @"-";
            break;
        case 3:
            string = @"*";
            break;
        case 4:
            string = @"/";
            break;
            
        default:
            break;
    }
    
}

-(double)makeOperationWithFirstOperator:(double)aFirstOperator andSecondOperator:(double)aSecondOperator {
    
    double result = 0.0;
    
    switch (operation) {
        case 1:
            result = aFirstOperator + aSecondOperator;
            break;
        case 2:
            result = aFirstOperator - aSecondOperator;
            break;
        case 3:
            result = aFirstOperator * aSecondOperator;
            break;
        case 4:
            result = aFirstOperator / aSecondOperator;
            break;
            
        default:
            break;
    }
    
    return result;
    
}

-(id)copyWithZone:(NSZone*)zone {
    Operation *operationCopy = [[Operation alloc]initWithOperationID:operation];
    return operationCopy;
}

@end
