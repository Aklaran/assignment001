//
//  myTableViewController.h
//  taps_of_joy
//
//  Created by Siri Tembunkiart on 9/16/14.
//  Copyright (c) 2014 Bo Assignment. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TapsOfJoyModel.h"


@interface myTableViewController : UITableViewController < UITableViewDelegate >
{
    TapsOfJoyModel *_myTapsOfJoyModel;
}

- (void)resetTable:(UITapGestureRecognizer *)sender;
@end
