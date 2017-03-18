//
//  ETAnnotation.m
//  DeliciousInHZ
//
//  Created by 許天柱 on 3/18/17.
//  Copyright © 2017 Egoist. All rights reserved.
//

#import "ETAnnotation.h"

@implementation ETAnnotation

-(id)initWithCoordinate: (CLLocationCoordinate2D)c andTitle: (NSString *)t {

    self = [super init];
    if (self) {
        _coordinate = c;
        _title = t;
    }
    return self;
}

@end
