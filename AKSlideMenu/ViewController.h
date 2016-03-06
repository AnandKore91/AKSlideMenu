//
//  ViewController.h
//  AKSlideMenu
//
//  Created by Anand A. Kore on 06/03/16.
//  Copyright © 2016 Anand Ashok Kore. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AKSlideBar.h"
#import "AppDelegate.h"

//---- Instance ----//
#define theAppDelegate ((AppDelegate*)[[UIApplication sharedApplication] delegate ])

@interface ViewController : UIViewController<AKSlideMenuDelegate>


@end

