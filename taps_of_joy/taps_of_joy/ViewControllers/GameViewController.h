//
//  GameViewController.h
//  taps_of_joy
//
//  Created by Siri Tembunkiart on 9/18/14.
//  Copyright (c) 2014 Bo Assignment. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TapsOfJoyModel.h"

@interface GameViewController : UIViewController
@property (assign, nonatomic) NSInteger indexSelection;
@property (weak, nonatomic) TapsOfJoyModel *gameTapsOfJoyModel;
//@property (weak, nonatomic) NSDictionary *weakDictionary;

@end
