//
//  UIDetailVC.m
//  JRSplitVCExample
//
//  Created by José Roldán Jiménez on 6/9/15.
//  Copyright (c) 2015 com.roldanjimenez. All rights reserved.
//

#import "UIDetailVC.h"
#import "JRSplitVC.h"
@implementation UIDetailVC
- (IBAction)fullView:(id)sender {
    JRSplitVC *JRSplit =(JRSplitVC*) self.splitViewController;
    if (!self.navigationItem.leftBarButtonItem) {
        [JRSplit insertDisplayModeButtonAnimated:YES];
    }else{
        [JRSplit extractDisplayModeButtonAnimated:YES];
    }
    
    
    
}

@end
