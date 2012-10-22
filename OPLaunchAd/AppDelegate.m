//
//  AppDelegate.m
//  OPLaunchAd
//
//  Created by SeanWang on 12-10-22.
//  Copyright (c) 2012年 opomelo. All rights reserved.
//

#import "AppDelegate.h"
#import <QuartzCore/QuartzCore.h>

#import "ViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.viewController = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    
    NSString *adURL = @"http://wallsdl.com/wallpapers/2012/01/space-shuttle-discovery-launch-960x640.jpg";
    
    //add the advertisement image to the front
    UIImageView *adImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height)];
    [adImage setImage:[[UIImage alloc] initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[adURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]]]];
    [self.window addSubview:adImage];
    [self.window bringSubviewToFront:adImage];
    
    //reset the advertisement image view frame
    adImage.frame = CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height);
    
    //display advertisement
    [UIView animateWithDuration:6.0
                          delay:0.1
                        options:(UIViewAnimationCurveEaseOut)
                     animations:^{
                         adImage.alpha = 1.0;
                         adImage.alpha = 0.0;
                     } completion:^(BOOL finished){
                         [adImage removeFromSuperview]; // remove that imageview from the view
                     }];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
