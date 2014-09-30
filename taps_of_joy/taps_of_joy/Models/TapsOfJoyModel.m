//
//  TapsOfJoyModel.m
//  taps_of_joy
//
//  Created by Siri Tembunkiart on 9/16/14.
//  Copyright (c) 2014 Bo Assignment. All rights reserved.
//

#import "TapsOfJoyModel.h"
#import "GameViewController.h"

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
    UIImage *checkmarkimage = [UIImage imageNamed:@"checkmark.jpeg"];
    UIImageView *checkmarkview = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
    checkmarkview.image = checkmarkimage;
    UIImage *xmarkimage = [UIImage imageNamed:@"x-mark-md.png"];
    UIImageView *xmarkview = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
    xmarkview.image = xmarkimage;
    myCell.imageView.image = [UIImage imageNamed:imageName];
    NSLog(@"succesful?:%@",_tapArray[indexPath.row][@"successful"]);
    if ([_tapArray[indexPath.row][@"completed"] integerValue] == 1) {
        if ([_tapArray[indexPath.row][@"successful"] integerValue] == 1) {
            myCell.accessoryView = checkmarkview;
        }
        if ([_tapArray[indexPath.row][@"successful"] integerValue] == 0){
            myCell.accessoryView = xmarkview;
        }
        myCell.userInteractionEnabled = NO;
    }
    return myCell;
}


@end
