//
//  TapsOfJoyModel.h
//  taps_of_joy
//
//  Created by Siri Tembunkiart on 9/16/14.
//  Copyright (c) 2014 Bo Assignment. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TapsOfJoyModel : NSObject < UITableViewDataSource >
@property (strong, nonatomic) NSArray *tapArray;
@property (assign, nonatomic) NSInteger shapeRandShow;


@end
