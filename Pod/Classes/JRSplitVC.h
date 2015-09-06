//
//  ViewController.h
//  testGesture
//
//  Created by José Roldán Jiménez on 19/4/15.
//  Copyright (c) 2015 com.roldanjimenez. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface JRSplitVC : UISplitViewController
/**
 *  Insert a Button for change mode of detailview
 *
 *  @param value YES o NO
 */
//-(void)insertDisplayModeButton:(BOOL)value;
-(void)insertDisplayModeButtonAnimated:(BOOL)animated;
@end

