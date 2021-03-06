//
//  GameViewController.h
//  taps_of_joy
//
//  Created by Siri Tembunkiart on 9/18/14.
//  Copyright (c) 2014 Bo Assignment. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TapsOfJoyModel.h"
#import "myTableViewController.h"

@interface GameViewController : UIViewController <UIGestureRecognizerDelegate>
@property (assign, nonatomic) NSInteger indexSelection;
@property (weak, nonatomic) TapsOfJoyModel *gameTapsOfJoyModel;
@property (assign, nonatomic) NSInteger correctClicks;
@property (weak, nonatomic) NSString *goalObject;
@property (assign, nonatomic) BOOL successfulBool;
@property (weak, nonatomic) UITableView *weakTV;

-(BOOL)doesIntersectWithFrame:(CGRect)myFrame;

- (void)poofImage:(UITapGestureRecognizer *)sender;

-(NSArray *)updateTapArray:(BOOL)successfulBool;

@end
