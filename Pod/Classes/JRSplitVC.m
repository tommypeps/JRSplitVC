//
//  ViewController.m
//  testGesture
//
//  Created by José Roldán Jiménez on 19/4/15.
//  Copyright (c) 2015 com.roldanjimenez. All rights reserved.
//

#import "JRSplitVC.h"
#import "UIGestureRecognizer+functions.h"


@interface JRSplitVC () <UISplitViewControllerDelegate>
@property (strong, nonatomic) UIGestureRecognizer *longpres;

@end

@implementation JRSplitVC
#pragma mark -
#pragma mark - lifecycle
#pragma mark -
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setDelegate:self];

    [self setPreferredPrimaryColumnWidthFraction:0.5];
    [self setMaximumPrimaryColumnWidth:self.view.frame.size.width];
    [self setMinimumPrimaryColumnWidth:0];
    [self setPreferredDisplayMode:UISplitViewControllerDisplayModeAllVisible];
    
//    UIViewController *vc = [[UIViewController alloc] init];
//    UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:vc];
//    [self.splitViewController showDetailViewController:nc
//                                                sender:self];

    /**
     * Capture gesture
     */
    _longpres = [[UILongPressGestureRecognizer alloc]initWithTarget:self
                                                       action:@selector(longPres)];

    if ([_longpres respondsToSelector:@selector(setMinimumNumberOfTouches:)]) {
        [_longpres setValue:0 forKey:@"numberOfTouchesRequired"];
    }
    [self.view addGestureRecognizer:_longpres];


    // Do any additional setup after loading the view, typically from a nib.
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)longPres
{
    CGFloat f = [_longpres fractionTouch];
    [self setPreferredPrimaryColumnWidthFraction:f];
   
}

#pragma mark -
#pragma mark - UIViewController
#pragma mark -
- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];

}
- (void)viewWillTransitionToSize:(CGSize)size
       withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
{
    [super viewWillTransitionToSize:size
          withTransitionCoordinator:coordinator];

    [self setMaximumPrimaryColumnWidth:size.width];
    [self setMinimumPrimaryColumnWidth:0];

}

#pragma mark -
#pragma mark - UISplitViewControllerDelegate
#pragma mark -
//- (UISplitViewControllerDisplayMode)targetDisplayModeForActionInSplitViewController:(UISplitViewController *)svc
//{
//
//    return UISplitViewControllerDisplayModeAllVisible;
//}
#pragma mark -
#pragma mark - UIBarButton Action
#pragma mark -
-(void)insertDisplayModeButtonAnimated:(BOOL)animated
{
    if ([self.viewControllers count]>1) {
        UINavigationController *nc = [self.viewControllers objectAtIndex:[@1 integerValue]];
        if (nc) {
            UIViewController *vc   = [nc topViewController];
            if (vc) {
                [vc.navigationItem setLeftItemsSupplementBackButton:YES];
                [vc.navigationItem setLeftBarButtonItem:[self displayModeButtonItem]
                                               animated:animated];
                
            }
            
        }

    }
}
-(void)extractDisplayModeButtonAnimated:(BOOL)animated
{
    if ([self.viewControllers count]>1) {
        UINavigationController *nc = [self.viewControllers objectAtIndex:[@1 integerValue]];
        if (nc) {
            UIViewController *vc   = [nc topViewController];
            if (vc) {
                [vc.navigationItem setLeftBarButtonItem:nil];
                [vc.navigationItem setLeftItemsSupplementBackButton:YES];
                
            }
            
        }
        
    }
    
}

@end
