//
//  Digit.m
//  Test
//
//  Created by sasha on 06.11.13.
//  Copyright (c) 2013 sasha. All rights reserved.
//

#import "Digit.h"

@implementation Digit
@synthesize number=_number;

-(id)initWithNumber:(double)aNumber {
    
    if (self = [super init]) {
        _digit = aNumber;
        string = [NSString stringWithFormat:@"%1.0f",_digit];
    }
    return self;
    
}

-(void)deleteSymbol {
    string = [string substringFromIndex:[string length]-1];
}

-(void)removeLastDigit {
    string = [string substringFromIndex:[string length]-1];
    _digit = [string doubleValue];
}

-(double)getDigit {
    return _digit;
}

-(id)copyWithZone:(NSZone*)zone {
    Digit *digit = [[Digit alloc]initWithNumber:_digit];
    return digit;
}

@end
