//
//  FirstViewController.m
//  DeliciousInHZ
//
//  Created by 許天柱 on 3/18/17.
//  Copyright © 2017 Egoist. All rights reserved.
//

#import "FirstViewController.h"


@interface FirstViewController ()<CLLocationManagerDelegate>

@property(weak, nonatomic) IBOutlet MKMapView *mapView;

@property (nonatomic, strong)CLLocationManager *locationManager;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.mapView setDelegate: self];
    [self.mapView setShowsUserLocation: YES];
    
    // initial of CLLocationManger Object
    CLLocationManager *locationManager = [[CLLocationManager alloc]init];
    self.locationManager = locationManager;
    
    if (![CLLocationManager locationServicesEnabled]) {
        NSLog(@"Your device needs to open location service：)");
    }
    
    // if iOS > 8
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0) {
        // lasting Authorization
        [locationManager requestAlwaysAuthorization];
        // authorize when in use
        [locationManager requestWhenInUseAuthorization];
    }
    
    // another way, it's not necessary
    //if([locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]){
    //   [locationManager requestWhenInUseAuthorization];
    //}
    
    self.mapView.delegate = self;
    self.mapView.userTrackingMode = MKUserTrackingModeFollow;
    [self.mapView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapMapView:)]];
    
    // the test annotation
    ETAnnotation *anno0 = [[ETAnnotation alloc] init];
    anno0.coordinate = CLLocationCoordinate2DMake(30.259133, 119.720738);
    anno0.title = @"全聚德";
    anno0.content = @"全北京最好的烤鸭店";
    anno0.icon = @"ic_place_black_24dp@2x";
    [self.mapView addAnnotation: anno0];
    
    
    // set delegate
    locationManager.delegate = self;
    // set precision
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    // set frequency: every 10m
    CLLocationDistance distance = 10;
    locationManager.distanceFilter = distance;
    // start
    [locationManager startUpdatingLocation];
}

-(void)tapMapView: (UITapGestureRecognizer *)tap {
    // get tap point
    CGPoint point=[tap locationInView:tap.view];
    // point -> coordinate
    CLLocationCoordinate2D coordi = [self.mapView convertPoint:point toCoordinateFromView: self.mapView];
    ETAnnotation *anno = [[ETAnnotation alloc] init];
    anno.coordinate = coordi;
    anno.title = @"全聚德";
    anno.content = @"来一只鸭子，老板！";
    anno.icon = @"ic_place_black_24dp@2x";
    [self.mapView addAnnotation: anno];
}

-(MKAnnotationView *)mapView: (MKMapView *)mapView viewForAnnotation: (id<MKAnnotation>)annotation {
    if (![annotation isKindOfClass:[ETAnnotation class]]) return nil;
    
    static NSString *ID = @"annoView";
    MKAnnotationView *annoView = (MKAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier: ID];
    
    if (annoView == nil) {
        annoView = [[MKAnnotationView alloc]initWithAnnotation: annotation reuseIdentifier:ID];
        // set click to show the info, because customized Anno won't show it default.
        annoView.canShowCallout = YES;
        // set color
        annoView.tintColor = [UIColor colorWithRed: 215/255.0 green: 233.0/255.0 blue: 215/255.0 alpha: 0.98];
        // set fall for the first time (for MKPinAnnotationView)
        // annoView.animatesDrop = YES;
        annoView.image = [UIImage imageNamed: @"ic_place_black_24dp@2x"];
    }
    
    // silly
    annoView.annotation = annotation;
    ETAnnotation *anno = annotation;
    // anno.icon = @"ic_place_black_24dp@2x";
    annoView.image = [UIImage imageNamed: anno.icon];
    
    return annoView;
}

// when location changed, you know
- (void)locationManager: (CLLocationManager *)manager didUpdateLocations: (NSArray<CLLocation *> *)locations{
    // get first child
    CLLocation *location = [locations firstObject];
    NSLog(@"%@",location.timestamp);
    
    // get coordinate
    CLLocationCoordinate2D coordinate = location.coordinate;
    // couse means "航向"
    NSLog(@"longitude：%f, latitude：%f, altitude：%f, course：%f, speed：%f",coordinate.longitude, coordinate.latitude, location.altitude, location.course, location.speed);
    
    // stop it if you need
    [_locationManager stopUpdatingLocation];
}

-(void)mapView: (MKMapView *)mapView didUpdateUserLocation: (MKUserLocation *)userLocation{
    
    CLLocationCoordinate2D loc = [userLocation coordinate];
    // Zoom to you place
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(loc, 500, 500);
    [self.mapView setRegion:region animated:YES];
    
} 

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
