//
//  AppDelegate.m
//  Colourlovers
//
//  Created by Andrew Griffiths on 3/11/11.
//  Copyright (c) 2011 Mad Dog Software. All rights reserved.
//

#import "AppDelegate.h"
#import "ColoursTableVc.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize navController = _navController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    // setup a sample list of palettes controller
    ColoursTableVc* vc = [[ColoursTableVc alloc] initWithStyle:UITableViewStylePlain];
    self.navController = [[UINavigationController alloc] initWithRootViewController:vc];

    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleBlackOpaque;
    self.navController.navigationBar.tintColor = [UIColor grayColor];

    self.window.rootViewController = self.navController;
    [self.window makeKeyAndVisible];

    return YES;
}

@end
