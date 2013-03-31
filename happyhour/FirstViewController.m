//
//  FirstViewController.m
//  happyhour
//
//  Created by John Kraal on 3/30/13.
//  Copyright (c) 2013 indieappes. All rights reserved.
//

#import "FirstViewController.h"
#import "UpdateManager.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (id)initWithNibName:(NSString *)nibNameOrNil
               bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"First", @"First");
        self.tabBarItem.image = [UIImage imageNamed:@"first"];
    }
    
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    locationManager.distanceFilter = (double)[[[[NSBundle mainBundle]
                                                infoDictionary]
                                               objectForKey:@"UpdateDistanceFilter"]
                                              intValue];
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [locationManager startUpdatingLocation];

    UpdateManager *updateManager = [[UpdateManager alloc] init];
    
    return self;
}

- (void)locationManager:(CLLocationManager *)manager
     didUpdateLocations:(NSArray *)locations {
    CLLocation *newLocation = [locations lastObject];
    NSLog(@"new location %f %f",
          newLocation.coordinate.latitude,
          newLocation.coordinate.longitude);
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
