//
//  AppDelegate.m
//  MiniGolf
//
//  Created by Daniel Bladh on 2/21/15.
//  Copyright (c) 2015 Daniel Bladh. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"
#import "CreateGameViewController.h"
#import "AddCourseViewController.h"
#import "StatsViewController.h"
#import <FacebookSDK/FacebookSDK.h>
#import <Analytics.h>
#import <Fabric/Fabric.h>
#import <Crashlytics/Crashlytics.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    // [Optional] Power your app with Local Datastore. For more info, go to
    // https://parse.com/docs/ios_guide#localdatastore/iOS
    [Parse enableLocalDatastore];
    
    // Initialize Parse.
    [Parse setApplicationId:@"9Wf4HDo5rf858TjqKPYOz2Wid8iTjEDS1jhZt9p1"
                  clientKey:@"f4Jza3gUSskxEucdthyRM1dFpcRZ9oZwxI31TLOw"];
    
    // [Optional] Track statistics around application opens.
    [PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
 
//Analytics Code Here:
    
    [SEGAnalytics setupWithConfiguration:[SEGAnalyticsConfiguration configurationWithWriteKey:@"XNHZJbddMI7qtCRT3mvp5baAFWfc3XAO"]];
//
//    [[SEGAnalytics sharedAnalytics] identify:@"Something!"
//                                      traits:@{ @"name": @"Michael Bolton",
//                                                @"email": @"mbolton@initech.com" }];
//    [[SEGAnalytics sharedAnalytics] track:@"Launched App"
//                               properties:@{ @"plan": @"Enterprise" }];
    
    MainViewController * mainViewController = [MainViewController new];
    UINavigationController * mainNavController = [[UINavigationController alloc] initWithRootViewController:mainViewController];
    self.window.rootViewController = mainNavController;
    mainViewController.tabBarItem.title = @"Main";
    mainViewController.tabBarItem.image = [UIImage imageNamed: @"tabicon"];
    
    CreateGameViewController * createGameViewController = [CreateGameViewController new];
    UINavigationController * createGameNavController = [[UINavigationController alloc]initWithRootViewController:createGameViewController];
    createGameViewController.tabBarItem.title = @"Create Game";
    createGameViewController.tabBarItem.image = [UIImage imageNamed: @"tabicon"];
    
    StatsViewController * statsViewController = [StatsViewController new];
    UINavigationController * statsNavController = [[UINavigationController alloc]initWithRootViewController:statsViewController];
    statsViewController.tabBarItem.title = @"Stats";
    statsViewController.tabBarItem.image = [UIImage imageNamed: @"tabicon"];

    UITabBarController *tabBarController = [UITabBarController new];
    tabBarController.viewControllers = @[mainNavController, createGameNavController, statsNavController];
    
    self.window.rootViewController = tabBarController;
    
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    
    // Logs 'install' and 'app activate' App Events.
    [FBAppEvents activateApp];
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    }

- (BOOL)application:(UIApplication *)application

            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation {
    // attempt to extract a token from the url
    return [FBAppCall handleOpenURL:url sourceApplication:sourceApplication];
    
    [Fabric with:@[CrashlyticsKit]];

}


@end
