//
//  AppDelegate.m
//  AKSlideMenu
//
//  Created by Anand A. Kore on 06/03/16.
//  Copyright © 2016 Anand Ashok Kore. All rights reserved.
//

#import "AppDelegate.h"
#import "DetailsViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
   
    #warning Pass menu array as Array of dictionary with two parameter 1.icon & 2.title
    _arrMenus=[[NSArray alloc]initWithObjects:@{@"icon":@"imgIcon",@"title":@"Menu 1"},@{@"icon":@"imgIcon",@"title":@"Menu 2"},@{@"icon":@"imgIcon",@"title":@"Menu 3"}, nil];
    
    return YES;
}

-(void)triggerAKSlideMenuWithDelegate:(UIViewController*)delegate
{
    [AKSlideBar addMenusWithTitle:@"My Title" menus:_arrMenus menuBarStyle:AKMenuBarStyleLeft delegate:delegate];
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
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


#pragma mark- ALSlideMenu delegate method
-(void)akMenuBarDidSelectedMenu:(NSDictionary *)info
{
//    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Menu Selected" message:[NSString stringWithFormat:@"Index :%@\nMenu :%@",[info valueForKey:@"Index"],[[info valueForKey:@"Menu"] valueForKey:@"title"]] preferredStyle:UIAlertControllerStyleAlert];
//    [alert addAction:[UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//        [alert dismissViewControllerAnimated:YES completion:nil];
//    }]];
//    UIViewController *rootVC = [[(AppDelegate *) [[UIApplication sharedApplication] delegate] window] rootViewController];
//    [rootVC presentViewController:alert animated:YES completion:nil];
    
//    DetailsViewController *vc= [[DetailsViewController alloc]init];
//    [rootVC.navigationController pushViewController:vc animated:YES];
}
@end
