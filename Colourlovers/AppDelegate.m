//
//  AppDelegate.m
//  Colourlovers
//
//  Created by Andrew Griffiths on 3/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"
#import "ColoursTableVc.h"
#import "DCIntrospect.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize navController = _tabBarController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    // setup a sample list of colours controller
    ColoursTableVc* vc = [[ColoursTableVc alloc] initWithStyle:UITableViewStylePlain];
    self.navController = [[UINavigationController alloc] initWithRootViewController:vc];

    // always bet on black
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleBlackOpaque;
    self.navController.navigationBar.tintColor = [UIColor blackColor];

    self.window.rootViewController = self.navController;
    [self.window makeKeyAndVisible];

    [[DCIntrospect sharedIntrospector] start];
    
    return YES;
}

@end
