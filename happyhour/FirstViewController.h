//
//  FirstViewController.h
//  happyhour
//
//  Created by John Kraal on 3/30/13.
//  Copyright (c) 2013 indieappes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UpdateManager.h"

@interface FirstViewController : UIViewController

- (id)initWithNibName:(NSString *)nibNameOrNil
               bundle:(NSBundle *)nibBundleOrNil
        updateManager:(UpdateManager*)updateManager;

@property (strong, atomic) UpdateManager *updateManager;

@end
