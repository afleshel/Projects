//
//  Expression.h
//  Test
//
//  Created by Администратор on 11/10/13.
//  Copyright (c) 2013 sasha. All rights reserved.
//

#import "Symbol.h"

@interface Expression : Symbol {
    NSMutableArray *_expression;
}

-(id)copyWithZone:(NSZone*)zone;
-(double)calculateExpression;
-(double)getDigit;

@property(nonatomic, retain)NSMutableArray *expression;

@end
