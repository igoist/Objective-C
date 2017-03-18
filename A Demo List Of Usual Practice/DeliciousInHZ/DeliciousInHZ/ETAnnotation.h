//
//  ETAnnotation.h
//  DeliciousInHZ
//
//  Created by 許天柱 on 3/18/17.
//  Copyright © 2017 Egoist. All rights reserved.
//

#ifndef ETAnnotation_h
#define ETAnnotation_h

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h> 

@interface ETAnnotation: NSObject <MKAnnotation>

// the necessary property for MKAnnotation delegate
@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
// title ：)
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *content;
// custom icon link
@property(nonatomic, strong) NSString *icon;

-(id)initWithCoordinate:(CLLocationCoordinate2D)c andTitle:(NSString*)t;


@end

#endif /* ETAnnotation_h */
