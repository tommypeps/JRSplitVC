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
    self.list = @[@"Full Screen Option",@"Edit with Gesture"];
    self.title =@"JRSSplitVC";
}
#pragma mark - UITableViewDelegate

#pragma mark - UITableViewDataSource



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.list count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier
                                                            forIndexPath:indexPath];
    
    
    [cell.textLabel setText:[self.list objectAtIndex:indexPath.row]];
    return cell;
}
-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%d",indexPath.row);
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main"
                                                    bundle:[NSBundle mainBundle ]];
    
    UIDetailVC *detailVC = [story instantiateViewControllerWithIdentifier:@"UIDetailVC"];
    UINavigationController *nc = [UINavigationController new];
    [nc addChildViewController:detailVC];

    switch (indexPath.row) {
        case 0:
        {
            NSLog(@"%@",@"0");
            //TODO: get view of StoryBoard
            
            [self showDetailViewController:nc
                                    sender:self];
        }
            break;
        case 1:
        {
            NSLog(@"%@",@"1");
            //TODO: get view of StoryBoard
//            UINavigationController *nc = [UINavigationController new];
//            UIViewController *vc = [UIViewController new];
//            [nc addChildViewController:vc];
//            [self showDetailViewController:nc
//                                    sender:self];
            [self showDetailViewController:nc
                                    sender:self];


        }
            break;

        default:
            break;
    }
}
@end