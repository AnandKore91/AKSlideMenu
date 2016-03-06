//
//  AKMenuBar.m
//  MyPocket
//
//  Created by Anand Kore on 1/6/16.
//  Copyright © 2016 Anand Kore. All rights reserved.
//

#import "AKSlideBar.h"

#define SELFTAG 741258
#define TITLE_HEIGHT 70

#pragma mark-
@interface AKSlideBar()
@property(strong,nonatomic)UIControl *control;
@end

#pragma mark-
@implementation AKSlideBar

#pragma mark- AKSlideBar Methods
+(void)addMenusWithTitle:(NSString*)title menus:(NSArray*)menus menuBarStyle:(AKMenuBarStyle)style delegate:(id)delegate
{
    if (!delegate )    {        return;    }//-- Validated invalid paras
    //[[delegate.view viewWithTag:SELFTAG]removeFromSuperview];
    AKSlideBar *selfInstance=[[AKSlideBar alloc]initWithArray:menus];
    [selfInstance initWithTitle:title menus:menus menuBarStyle:style delegate:delegate];
}
-(id)initWithArray:(NSArray*)menus
{
    self=[super init];
    if (self)
    {
        self.backgroundColor=[UIColor whiteColor];
        self.tag=SELFTAG;
        self.arrMenus=[[NSArray alloc]initWithArray:menus];
    }
    return self;
}

-(void)initWithTitle:(NSString *)title menus:(NSArray *)menus menuBarStyle:(AKMenuBarStyle)style delegate:(UIViewController*)delegate
{
    self.delegate=(id)delegate;
    self.selectedStyle=style;
    
    if (style==AKMenuBarStyleBottom)
    {
        self.frame = CGRectMake(0,SCREEN_HEIGHT, SCREEN_WIDTH,[self getProperHeightForTable]);
    }
    else if (style==AKMenuBarStyleLeft)
    {
        self.frame = CGRectMake(-(SCREEN_WIDTH-50),0,SCREEN_WIDTH-50,SCREEN_HEIGHT);
    }
    else if (style==AKMenuBarStyleRight)
    {
        self.frame = CGRectMake(SCREEN_WIDTH,0,SCREEN_WIDTH-50,SCREEN_HEIGHT);
    }
    else if (style==AKMenuBarStyleTop)
    {
        self.frame = CGRectMake(0,-SCREEN_HEIGHT,SCREEN_WIDTH,[self getProperHeightForTable]);
    }
    
    UIView *viewTitleHolder  = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width,TITLE_HEIGHT)];
    viewTitleHolder.backgroundColor=[UIColor colorWithRed:(43/255.0) green:(172/255.0) blue:(139/255.0) alpha:1];
    [self addSubview:viewTitleHolder];
    
    UILabel *lblTitleAc  = [[UILabel alloc]initWithFrame:CGRectMake(0,viewTitleHolder.frame.size.height/2-15, self.frame.size.width,40)];
    //lblTitleAc.backgroundColor=[UIColor colorWithRed:(43/255.0) green:(172/255.0) blue:(139/255.0) alpha:1];
    lblTitleAc.textAlignment=NSTextAlignmentCenter;
    lblTitleAc.text=title;
    lblTitleAc.textColor=[UIColor whiteColor];
    lblTitleAc.font=[UIFont fontWithName:@"DamascusBold" size:20];
    [viewTitleHolder addSubview:lblTitleAc];
    
    UIButton *btnClose=[[UIButton alloc]initWithFrame:CGRectMake(self.frame.size.width-40,(viewTitleHolder.frame.size.height-30)/2,30,30)];
    [btnClose setBackgroundImage:[UIImage imageNamed:@"imgClose.png"] forState:UIControlStateNormal];
    //btnClose.layer.cornerRadius=(btnClose.frame.size.height/2);
    //[btnClose setTitle:@"X" forState:UIControlStateNormal];
    [btnClose addTarget:self action:@selector(hideAKMenuBar) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btnClose];
    
    UITableView *tblMenus=[[UITableView alloc]initWithFrame:CGRectMake(0,CGRectGetMaxY(viewTitleHolder.frame), self.frame.size.width,self.frame.size.height-viewTitleHolder.frame.size.height)];
    tblMenus.dataSource=(id)self;
    tblMenus.delegate=(id)self;
    tblMenus.tableFooterView=[[UIView alloc]initWithFrame:CGRectZero];
    tblMenus.backgroundColor=[UIColor clearColor];
    tblMenus.separatorStyle=UITableViewCellSeparatorStyleNone;
    [self addSubview:tblMenus];
    
    _control=[[UIControl alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    [_control addTarget:self action:@selector(hideAKMenuBar) forControlEvents:UIControlEventTouchUpInside];
    _control.tag=SELFTAG;
    _control.backgroundColor=[UIColor colorWithRed:(0/255.0) green:(0/255.0) blue:(0/255.0) alpha:0.5];
    
    [[[UIApplication sharedApplication] keyWindow] addSubview:_control];
    [[[UIApplication sharedApplication] keyWindow] addSubview:self];
    
    [UIView animateWithDuration:0.4 animations:^{
        if (style==AKMenuBarStyleBottom)
        {
            self.frame = CGRectMake(0,SCREEN_HEIGHT-[self getProperHeightForTable], SCREEN_WIDTH, [self getProperHeightForTable]);
        }
        else if (style==AKMenuBarStyleLeft)
        {
            self.frame = CGRectMake(0,0,SCREEN_WIDTH-50,SCREEN_HEIGHT);
        }
        else if (style==AKMenuBarStyleRight)
        {
            self.frame = CGRectMake(50,0, SCREEN_WIDTH-50, SCREEN_HEIGHT);
        }
        else if (style==AKMenuBarStyleTop)
        {
            self.frame = CGRectMake(0,0,SCREEN_WIDTH,[self getProperHeightForTable]);
        }
    } completion:^(BOOL finished) {            }];
}

#pragma mark- Utility Methods
-(void)hideAKMenuBarWithInfoIndexPath:(NSIndexPath *)indexPath
{
    [UIView animateWithDuration:0.4 animations:^{
        if (self.selectedStyle==AKMenuBarStyleBottom)
        {
            self.frame = CGRectMake(0,SCREEN_HEIGHT, SCREEN_WIDTH,SCREEN_HEIGHT/3);
        }
        else if (self.selectedStyle==AKMenuBarStyleLeft)
        {
            self.frame = CGRectMake(-(SCREEN_WIDTH-50),0,SCREEN_WIDTH-50,SCREEN_HEIGHT);
        }
        else if (self.selectedStyle==AKMenuBarStyleRight)
        {
            self.frame = CGRectMake(SCREEN_WIDTH,0,SCREEN_WIDTH-50,SCREEN_HEIGHT);
        }
        else if (self.selectedStyle==AKMenuBarStyleTop)
        {
            self.frame = CGRectMake(0,-SCREEN_HEIGHT,SCREEN_WIDTH,(SCREEN_HEIGHT/3));
        }
    } completion:^(BOOL finished) {   [self removeFromSuperview]; [_control removeFromSuperview];
        [self performMenuSelectedActionWithIndexPath:indexPath];
    }];
}
-(void)hideAKMenuBar
{
    [UIView animateWithDuration:0.4 animations:^{
        if (self.selectedStyle==AKMenuBarStyleBottom)
        {
            self.frame = CGRectMake(0,SCREEN_HEIGHT, SCREEN_WIDTH,SCREEN_HEIGHT/3);
        }
        else if (self.selectedStyle==AKMenuBarStyleLeft)
        {
            self.frame = CGRectMake(-(SCREEN_WIDTH-50),0,SCREEN_WIDTH-50,SCREEN_HEIGHT);
        }
        else if (self.selectedStyle==AKMenuBarStyleRight)
        {
            self.frame = CGRectMake(SCREEN_WIDTH,0,SCREEN_WIDTH-50,SCREEN_HEIGHT);
        }
        else if (self.selectedStyle==AKMenuBarStyleTop)
        {
            self.frame = CGRectMake(0,-SCREEN_HEIGHT,SCREEN_WIDTH,(SCREEN_HEIGHT/3));
        }
    } completion:^(BOOL finished) {   [self removeFromSuperview]; [_control removeFromSuperview];    }];
}

-(CGFloat)getProperHeightForTable
{
    CGFloat height=(_arrMenus.count)*46;
    height=height+TITLE_HEIGHT;//-- Title Label height
    if(height>SCREEN_HEIGHT/3)
    {
        height=SCREEN_HEIGHT/3;
    }
    return height;
}

#pragma mark- TableView Delegate & DataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.arrMenus.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 46;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    cell.backgroundColor=[UIColor clearColor];
    UIImageView *cellBG=[[UIImageView alloc]initWithFrame:CGRectMake(2,2,tableView.frame.size.width-4,cell.frame.size.height-4)];
    cellBG.image=[UIImage imageNamed:@"cellBG"];
    [cell.contentView addSubview:cellBG];
    
    //@{@"icon":@"",@"title":@"Menu 1"}
    UIImageView *cellIcon=[[UIImageView alloc]initWithFrame:CGRectMake(15, 5, 30, 30)];
    cellIcon.image=[UIImage imageNamed:[self.arrMenus[indexPath.row]valueForKey:@"icon"]?[self.arrMenus[indexPath.row]valueForKey:@"icon"]:@""];
    [cell.contentView addSubview:cellIcon];
    
    UILabel *lblCellTitle=[[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(cellIcon.frame)+5,0,cell.frame.size.width-CGRectGetMaxY(cellIcon.frame)+5,cell.frame.size.height)];
    lblCellTitle.text=[self.arrMenus[indexPath.row]valueForKey:@"title"]?[self.arrMenus[indexPath.row]valueForKey:@"title"]:@"";
    [cell.contentView addSubview:lblCellTitle];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self hideAKMenuBarWithInfoIndexPath:indexPath];
    //--- Handle selected actions here or catch separatly with delegate.
    if ([self.delegate respondsToSelector:@selector(akMenuBarDidSelectedMenu:)])
    {
        [self.delegate akMenuBarDidSelectedMenu:@{@"Index":[NSString stringWithFormat:@"%li",indexPath.row],@"Menu":self.arrMenus[indexPath.row]}];
    }
}

-(void)performMenuSelectedActionWithIndexPath:(NSIndexPath*)indexPath
{
    //--- Identify Selected menu and navigate / add appropriate action
    //if ([[self.arrMenus[indexPath.row] valueForKey:@"title"] isEqualToString:@"Menu 1"])
    {
        DetailsViewController *vc= [[DetailsViewController alloc]initWithTitle:[self.arrMenus[indexPath.row]valueForKey:@"title"]?[self.arrMenus[indexPath.row]valueForKey:@"title"]:@""];
        [self.delegate.navigationController pushViewController:vc animated:YES];
    }
}

@end
