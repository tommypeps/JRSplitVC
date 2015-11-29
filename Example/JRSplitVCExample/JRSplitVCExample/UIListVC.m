//
//  UIListVC.m
//  JRSplitVCExample
//
//  Created by José Roldán Jiménez on 6/9/15.
//  Copyright (c) 2015 com.roldanjimenez. All rights reserved.
//

#import "UIListVC.h"
#import "UIDetailVC.h"
#import "JRSplitVC.h"
@interface UIListVC ()
@property NSArray *list;
@end
@implementation UIListVC

-(void)viewDidLoad
{
    self.list = @[@"Full Screen",@"Full Screen disappear", @"UIPanGestureRecognizer",@"UILongPressGestureRecognizer"];
    self.title =@"JRSSplitVC";
    JRSplitVC *vc =(JRSplitVC*) self.splitViewController;
    [vc setStoryboardFile:@"Main"];
    [vc setPrimaryViewControllerExpand:@"MyMasterViewStorybard"];
    [vc setPrimaryViewControllerCollapsed:@"MyCustonViewCollapse"];
}
#pragma mark - UITableViewDelegate

#pragma mark - UITableViewDataSource



- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return [self.list count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier
                                                            forIndexPath:indexPath];
    
    
    [cell.textLabel setText:[self.list objectAtIndex:indexPath.row]];
    return cell;
}
-(void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main"
                                                    bundle:[NSBundle mainBundle ]];
    
    UIDetailVC *detailVC = [story instantiateViewControllerWithIdentifier:@"UIDetailVC"];
    UINavigationController *nc = [UINavigationController new];
    [nc addChildViewController:detailVC];
    
    switch (indexPath.row) {
        case 0:
        {
            
            //TODO: get view of StoryBoard
            
            [self showDetailViewController:nc
                                    sender:self];
            JRSplitVC *vc = self.splitViewController;
            [vc insertDisplayModeButtonAnimated:YES];
        }
            break;
        case 1:
        {
            
            //TODO: get view of StoryBoard
            JRSplitVC *vc = self.splitViewController;
            [vc extractDisplayModeButtonAnimated:YES];
            
            [self showDetailViewController:nc
                                    sender:self];
            
            
        }
            break;
            
        case 2:
        {
            
            UIPanGestureRecognizer *pan =[[UIPanGestureRecognizer alloc]initWithTarget:self.splitViewController
                                                                                action:@selector(changePreferredPrimaryColumnWidth)];
            [self.splitViewController setValue:pan
                                        forKey:@"longpres"];
        }
            break;
        case 3:
        {
            UILongPressGestureRecognizer *longpress = [[UILongPressGestureRecognizer alloc] initWithTarget:self.splitViewController
                                                                                                    action:@selector(changePreferredPrimaryColumnWidth)];
            [self.splitViewController setValue:longpress
                                        forKey:@"longpres"];
            
        }
            break;
        default:
            break;
    }
}
@end