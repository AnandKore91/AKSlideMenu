//
//  AppDelegate.h
//  AKSlideMenu
//
//  Created by Anand A. Kore on 06/03/16.
//  Copyright © 2016 Anand Ashok Kore. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AKSlideBar.h"


@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property(strong,nonatomic)NSArray *arrMenus;

-(void)triggerAKSlideMenuWithDelegate:(UIViewController*)delegate;
@end

