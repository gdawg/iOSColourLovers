//
//  AppDelegate.m
//  Colourlovers
//
//  Created by Andrew Griffiths on 3/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"
#import "ColoursTableVc.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize tabBarController = _tabBarController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    // setup a sample list of colours controller
    ColoursTableVc* vc = [[ColoursTableVc alloc] initWithStyle:UITableViewStylePlain];
    self.tabBarController = [[UINavigationController alloc] initWithRootViewController:vc];

    self.window.rootViewController = self.tabBarController;
    [self.window makeKeyAndVisible];
    return YES;
}

@end
