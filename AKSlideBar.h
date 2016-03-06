//
//  AKMenuBar.h
//  MyPocket
//
//  Created by Anand Kore on 1/6/16.
//  Copyright © 2016 Anand Kore. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "DetailsViewController.h"

//---- Screen Size Define ----//
#define SCREEN_SIZE [UIScreen mainScreen].bounds
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

#pragma mark- Protocol Declaration
@protocol AKSlideMenuDelegate <NSObject>
-(void)akMenuBarDidSelectedMenu:(NSDictionary*)info;
@end

#pragma mark- TypeDef Declaration
typedef enum : NSUInteger {
    AKMenuBarStyleBottom,
    AKMenuBarStyleTop,
    AKMenuBarStyleLeft,
    AKMenuBarStyleRight,
} AKMenuBarStyle;


@interface AKSlideBar : UIView<UITableViewDataSource,UITableViewDelegate>

#pragma mark- Public method declaration
+(void)addMenusWithTitle:(NSString*)title menus:(NSArray*)menus menuBarStyle:(AKMenuBarStyle)style delegate:(id)delegate;

#pragma mark- Public Property Declaration
@property(nonatomic,strong)UIColor *themeColor;
@property(nonatomic,strong)UIFont *themeFont;

@property(nonatomic,strong)NSArray *arrMenus;

@property(strong,nonatomic)UIViewController<AKSlideMenuDelegate>* delegate;
@property(nonatomic)AKMenuBarStyle selectedStyle;

@end
