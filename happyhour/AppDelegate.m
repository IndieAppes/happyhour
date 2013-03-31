//
//  AppDelegate.m
//  happyhour
//
//  Created by John Kraal on 3/30/13.
//  Copyright (c) 2013 indieappes. All rights reserved.
//

#import "AppDelegate.h"

#import "FirstViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    UIViewController *viewController1;
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        viewController1 = [[FirstViewController alloc] initWithNibName:@"FirstViewController_iPhone" bundle:nil];
    } else {
        viewController1 = [[FirstViewController alloc] initWithNibName:@"FirstViewController_iPad" bundle:nil];
    }
    self.tabBarController = [[UITabBarController alloc] init];
    self.tabBarController.viewControllers = @[viewController1];
    self.window.rootViewController = self.tabBarController;
    [self.window makeKeyAndVisible];

    // We kind of need a timer startup here; for interval'd checking of
    // location and retrieving new soon-to-be happy hours

    // Immediately check for current location, too

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    NSLog(@"Going to the background, abort all running requests and don't start new ones please!");
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    NSLog(@"Am in the background, don't update me now please!");
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    NSLog(@"Oh I'm so going to be active again!");
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    NSLog(@"I guess I'm active again!");
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    NSLog(@"KILL ME NOW");
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
}
*/

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed
{
}
*/

@end
