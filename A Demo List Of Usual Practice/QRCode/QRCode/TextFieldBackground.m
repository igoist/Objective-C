//
//  TextFieldBackground.m
//  QRCode
//
//  Created by 許天柱 on 3/1/17.
//  Copyright © 2017 Egoist. All rights reserved.
//

#import "TextFieldBackground.h"

@implementation TextFieldBackground

- (void)drawRect:(CGRect)rect {
    CGContextRef context=UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context,0.2);
    CGContextBeginPath(context);
    CGContextMoveToPoint(context, 5, 50);
    CGContextAddLineToPoint(context,self.frame.size.width-5, 50);
    CGContextClosePath(context);
    [[UIColor grayColor] setStroke];
    CGContextStrokePath(context);
}

@end
