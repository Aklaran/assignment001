//
//  TapsOfJoyModel.m
//  taps_of_joy
//
//  Created by Siri Tembunkiart on 9/16/14.
//  Copyright (c) 2014 Bo Assignment. All rights reserved.
//

#import "TapsOfJoyModel.h"

@implementation TapsOfJoyModel

-(id)init
{
    if (self == [super init]) {
        _tapArray = [[NSArray alloc] init];
        NSMutableArray *mutableTapArray = [[NSMutableArray alloc] init];
        for (NSInteger i=0; i<25; i++)
        {
            NSString *shape;
            NSInteger shapeRand = arc4random_uniform(4);
            switch (shapeRand) {
                case 0:
                    shape = @"stars";
                    break;
                case 1:
                    shape = @"circles";
                    break;
                default:
                    shape = @"stars";
                    break;
                case 2:
                    shape = @"squares";
                    break;
                case 3:
                    shape = @"triangles";
            }
            [mutableTapArray addObject:@{ @"stars": [[NSNumber alloc] initWithInteger:arc4random_uniform(5)+1],
                                          @"circles":[[NSNumber alloc] initWithInteger:arc4random_uniform(5)+1],
                                          @"squares":[[NSNumber alloc] initWithInteger:arc4random_uniform(5)+1],
                                          @"triangles":[[NSNumber alloc] initWithInteger:arc4random_uniform(5)+1],
                                          @"completed":@0,
                                          @"successful":@0,
                                          @"selection": shape}];
        }
            _tapArray = mutableTapArray;
        
    }
    return self;
    // arc4random_uniform(10)+4 <-- look for this for randomness
    
}

#pragma mark UITableViewDataSource
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _tapArray.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *myCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"My Cell"];
    NSString *imageNumberChoice = [[NSString alloc] initWithFormat:@"%@",_tapArray[indexPath.row][@"selection"]];
    NSString *numberValue = [[NSString alloc] initWithFormat:@"%@",_tapArray[indexPath.row][imageNumberChoice]];
    myCell.textLabel.text = numberValue;
    NSString *imageName = [[NSString alloc]initWithFormat:@"%@.jpg", _tapArray[indexPath.row][@"selection"]];
    myCell.imageView.image = [UIImage imageNamed:imageName];
    return myCell;
}


@end
