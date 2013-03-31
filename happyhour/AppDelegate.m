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

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    NSLog(@"Going to the background");
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    NSLog(@"Am in the background, don't update me now please!");
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    NSLog(@"Oh I'm so going to be active again!");
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    NSLog(@"I guess I'm active again!");
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // noop
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
