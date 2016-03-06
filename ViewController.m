//
//  ViewController.m
//  AKSlideMenu
//
//  Created by Anand A. Kore on 06/03/16.
//  Copyright © 2016 Anand Ashok Kore. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic,strong)NSArray *arrMenus;

@end

@implementation ViewController

#pragma mark- Initial Methods
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _arrMenus=[[NSArray alloc]initWithObjects:@"Top",@"Left",@"Right",@"Bottom",@"Global",nil];
    self.title = @"AKSlideMenu";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark- Button Actions
- (IBAction)btnMenuPressed:(id)sender
{
#warning Pass menu array as Array of dictionary with two parameter 1.icon & 2.title
    [AKSlideBar addMenusWithTitle:@"My Title" menus:@[@{@"icon":@"imgIcon",@"title":@"Menu 1"},@{@"icon":@"imgIcon",@"title":@"Menu 2"},@{@"icon":@"imgIcon",@"title":@"Menu 3"}] menuBarStyle:AKMenuBarStyleTop delegate:self];
}

#pragma mark- AKSlideBarDelegate
-(void)akMenuBarDidSelectedMenu:(NSDictionary *)info
{
    NSLog(@"akMenuBarDidSelectedMenu :%@",info);
}



#pragma mark- TableView Delegate & DataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.arrMenus.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString*cellID=@"CELLID";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell)
    {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    UILabel *lblCellTitle=[[UILabel alloc]initWithFrame:CGRectMake(25,0,cell.frame.size.width-25,cell.frame.size.height)];
    lblCellTitle.text=self.arrMenus[indexPath.row];
    [cell.contentView addSubview:lblCellTitle];
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    #warning Pass menu array as Array of dictionary with two parameter 1.icon & 2.title
    if([_arrMenus[indexPath.row] isEqualToString:@"Top"])
    {
        [AKSlideBar addMenusWithTitle:@"My Title" menus:theAppDelegate.arrMenus menuBarStyle:AKMenuBarStyleTop delegate:self];
    }
    else if ([_arrMenus[indexPath.row] isEqualToString:@"Left"])
    {
        [AKSlideBar addMenusWithTitle:@"My Title" menus:theAppDelegate.arrMenus menuBarStyle:AKMenuBarStyleLeft delegate:self];
    }
    else if ([_arrMenus[indexPath.row] isEqualToString:@"Right"])
    {
        [AKSlideBar addMenusWithTitle:@"My Title" menus:@[@{@"icon":@"imgIcon",@"title":@"Custom Menu 1"},@{@"icon":@"imgIcon",@"title":@"Custom Menu 2"},@{@"icon":@"imgIcon",@"title":@"Custom Menu 3"}] menuBarStyle:AKMenuBarStyleRight delegate:self];
    }
    else if ([_arrMenus[indexPath.row] isEqualToString:@"Bottom"])
    {
        //[AKSlideBar addMenusWithTitle:@"My Title" menus:theAppDelegate.arrMenus menuBarStyle:AKMenuBarStyleLeft delegate:self];
        [AKSlideBar addMenusWithTitle:@"My Title" menus:theAppDelegate.arrMenus menuBarStyle:AKMenuBarStyleBottom delegate:self];
    }
    else if ([_arrMenus[indexPath.row] isEqualToString:@"Global"])
    {
        [theAppDelegate triggerAKSlideMenuWithDelegate:self];
    }
}


@end
