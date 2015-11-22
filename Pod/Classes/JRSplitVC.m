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



@end

@implementation JRSplitVC
-(instancetype) initWithStoryBoardID:(NSString*)storyBoard
{
    self = [super init];
    if (self) {
        self.storyboardFile = storyBoard;
    }
    return self;

}
-(instancetype) initWithStoryBoardID:(NSString*)storyBoard
            withPrimaryViewCollapsed:(NSString*)primaryViewControllerCollapsed
               withPrimaryViewExpand:(NSString*)primaryViewControllerExpand
{
    self = [super init];
    if (self) {
        self.storyboardFile = storyBoard;
        self.primaryViewControllerCollapsed = primaryViewControllerCollapsed;
        self.primaryViewControllerExpand = primaryViewControllerExpand;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setDelegate:self];
    [self setPresentsWithGesture:YES];
    [self setPreferredPrimaryColumnWidthFraction:0.5];
    [self setMaximumPrimaryColumnWidth:self.view.frame.size.width];
    [self setMinimumPrimaryColumnWidth:0];
    [self setPreferredDisplayMode:UISplitViewControllerDisplayModeAllVisible];
    
    UIViewController *vc = [[UIViewController alloc] init];
    UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:vc];
    [self.splitViewController showDetailViewController:nc
                                                sender:self];
    [self addObserver:self
           forKeyPath:@"longpres"
              options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
              context:nil];
    
    
//    [self setMaximumPrimaryColumnWidth:self.view.frame.size.width];

    _longpres = [[UILongPressGestureRecognizer alloc]initWithTarget:self
                                                       action:@selector(changePreferredPrimaryColumnWidth)];
//    [_longpres setMinimumNumberOfTouches:@0];
    if ([_longpres respondsToSelector:@selector(setMinimumNumberOfTouches:)]) {
        [_longpres setValue:0 forKey:@"numberOfTouchesRequired"];
    }
    [self.view addGestureRecognizer:_longpres];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)changePreferredPrimaryColumnWidth
{
    CGFloat f = [_longpres fractionTouch];
    [self setPreferredPrimaryColumnWidthFraction:f];
   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

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

-(void)observeValueForKeyPath:(NSString *)keyPath
                     ofObject:(id)object
                       change:(NSDictionary *)change
                      context:(void *)context
{
     NSLog(@"%@",keyPath);
    if ([keyPath isEqualToString:@"longpres"]) {
        UIGestureRecognizer * old  = [change valueForKey:@"old"];
        UIGestureRecognizer * new  = change[@"new"];
        [self.view removeGestureRecognizer:old];
        [self.view addGestureRecognizer:new];
    }
}

//Funciona y está bastante guapo a mi gusto
// ¿no seria mejor idea insertar este método como una categoria?
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
-(void)extractDisplayModeButtonAnimated:(BOOL)animated{
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
#pragma mark - UISplitViewControllerDelegate
//- (UISplitViewControllerDisplayMode)targetDisplayModeForActionInSplitViewController:(UISplitViewController *)svc
//{
//
//    return UISplitViewControllerDisplayModeAllVisible;
//}
    - (BOOL)splitViewController:(UISplitViewController *)splitViewController
collapseSecondaryViewController:(UIViewController *)secondaryViewController
      ontoPrimaryViewController:(UIViewController *)primaryViewController
{
    return YES;
}
-(UIViewController *)primaryViewControllerForCollapsingSplitViewController:(UISplitViewController *)splitViewController
{
    if (self.storyboardFile&& self.primaryViewControllerCollapsed) {
        UIStoryboard *story = [UIStoryboard storyboardWithName:self.storyboardFile
                                                        bundle:[NSBundle mainBundle]];
        if (story) {
            UIViewController *vc = [story instantiateViewControllerWithIdentifier:self.primaryViewControllerCollapsed];
            UINavigationController *nc = [UINavigationController new];
            [nc addChildViewController:vc];
            return nc;
        }

    }else{
        return  [UIViewController new];
    }
}
- (UIViewController *)primaryViewControllerForExpandingSplitViewController:(UISplitViewController *)splitViewController
{
    if (self.storyboardFile&& self.primaryViewControllerExpand) {
        
        UIStoryboard *story = [UIStoryboard storyboardWithName:self.storyboardFile
                                                        bundle:[NSBundle mainBundle]];
        if (story) {
            UIViewController *vc = [story instantiateViewControllerWithIdentifier:self.primaryViewControllerExpand];
            UINavigationController *nc = [UINavigationController new];
            [nc addChildViewController:vc];
            return nc;
        }

    }else{
        return [UIViewController new];
    }
}
@end
