//
//  ViewController.h
//  testGesture
//
//  Created by José Roldán Jiménez on 19/4/15.
//  Copyright (c) 2015 com.roldanjimenez. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface JRSplitVC : UISplitViewController
@property (strong, nonatomic) UIGestureRecognizer *longpres;
@property NSString *storyboardFile;
@property NSString *primaryViewControllerCollapsed;
@property NSString *primaryViewControllerExpand;
/**
 *  Contructor
 *
 *  @param storyBoard String with Storybard
 *
 *  @return new object
 */
-(instancetype) initWithStoryBoardID:(NSString*)storyBoard;

-(instancetype) initWithStoryBoardID:(NSString*)storyBoard
            withPrimaryViewCollapsed:(NSString*)primaryViewControllerCollapsed
               withPrimaryViewExpand:(NSString*)primaryViewControllerExpand;

- (void)changePreferredPrimaryColumnWidth;
/**
 *  Insert a Button for change mode of detailview
 *
 */
-(void)insertDisplayModeButtonAnimated:(BOOL)animated;
/**
 *  Extract a Button dans SplitviewController
 *
 */
-(void)extractDisplayModeButtonAnimated:(BOOL)animated;

@end

