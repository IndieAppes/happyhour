//
//  FirstViewController.h
//  happyhour
//
//  Created by John Kraal on 3/30/13.
//  Copyright (c) 2013 fancyappes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface FirstViewController : UIViewController <CLLocationManagerDelegate> {
    CLLocationManager *locationManager;
}

@end
