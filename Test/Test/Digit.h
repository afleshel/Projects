//
//  Digit.h
//  Test
//
//  Created by sasha on 06.11.13.
//  Copyright (c) 2013 sasha. All rights reserved.
//

#import "Symbol.h"

@interface Digit : Symbol {
    float _number;
}

@property(nonatomic,readwrite)float number;

-(id)initWithNumber:(double)aNumber;
-(void)removeLastDigit;
-(id)copyWithZone:(NSZone*)zone;
-(double)getDigit;
@end
