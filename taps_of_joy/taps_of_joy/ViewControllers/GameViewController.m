//
//  GameViewController.m
//  taps_of_joy
//
//  Created by Siri Tembunkiart on 9/18/14.
//  Copyright (c) 2014 Bo Assignment. All rights reserved.
//

#import "GameViewController.h"
#import "myTableViewController.h"


@interface GameViewController ()

@end

@implementation GameViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    __weak NSString *weakString = _gameTapsOfJoyModel.tapArray[_indexSelection][@"selection"];
    NSLog(@"Index Selection ==:%i",(int)_indexSelection);
    NSLog(@"%@",weakString);
    NSLog(@"%@",_gameTapsOfJoyModel.tapArray[_indexSelection][weakString]);
    CGRect frame = CGRectMake(40, 200, 280, 192);
    UIImage *stars = [UIImage imageNamed:@"stars.jpg"];
    UIImageView *starsView = [[UIImageView alloc]initWithFrame:frame];
    starsView.image = stars;
    [self.view addSubview:starsView];
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
