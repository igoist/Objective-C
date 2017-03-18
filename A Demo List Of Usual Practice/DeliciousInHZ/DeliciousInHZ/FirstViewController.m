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
    
    // set delegate
    locationManager.delegate=self;
    // set precision
    locationManager.desiredAccuracy=kCLLocationAccuracyBest;
    // set frequency: every 10m
    CLLocationDistance distance=10;
    locationManager.distanceFilter=distance;
    // start
    [locationManager startUpdatingLocation];
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
    // [_locationManager stopUpdatingLocation];
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
