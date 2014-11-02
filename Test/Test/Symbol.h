//
//  Symbol.h
//  Test
//
//  Created by sasha on 06.11.13.
//  Copyright (c) 2013 sasha. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Symbol : NSObject {
    NSString * string;
    double _digit;
}

-(double)makeOperationWithFirstOperator:(double)aFirstOperator andSecondOperator:(double)aSecondOperator;
-(void)removeLastDigit;
-(double)getDigit;

@property(nonatomic,retain) NSString * string;
@property(nonatomic,readwrite) double  digit;

@end
