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
    _goalObject = _gameTapsOfJoyModel.tapArray[_indexSelection][@"selection"];
    NSLog(@"Index Selection ==:%i",(int)_indexSelection);
    NSLog(@"goal object ==:%@",_goalObject);
    NSLog(@"goal number ==:%@",_gameTapsOfJoyModel.tapArray[_indexSelection][_goalObject]);
    NSArray *localArray = @[@"stars",@"circles",@"squares",@"triangles"];
    for (__weak NSString *weakKey in localArray) {
        NSString *localString = [[NSString alloc]initWithFormat:@"%@.jpg", weakKey];
        NSInteger objectCount =  [_gameTapsOfJoyModel.tapArray[_indexSelection][weakKey] integerValue];
        for (NSInteger i=0; i<objectCount; i++) {
            UIImage *shape = [UIImage imageNamed:localString];
            UIImageView *shapeView;
            CGRect imageFrame;
            do {
                imageFrame = CGRectMake(arc4random_uniform(self.view.bounds.size.width-75), arc4random_uniform(self.view.bounds.size.height-75), 75, 75);
                } while ( [self doesIntersectWithFrame:imageFrame]);
            shapeView = [[UIImageView alloc]initWithFrame:imageFrame];
            shapeView.tag = [localArray indexOfObject:weakKey];
            shapeView.image = shape;
            shapeView.userInteractionEnabled = YES;
            UITapGestureRecognizer *imageTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(poofImage:)];
            [shapeView addGestureRecognizer:imageTap];
            [self.view addSubview:shapeView];
        }
    }
}

-(BOOL)doesIntersectWithFrame:(CGRect)myFrame // = hgfhgfframe
{
    for (__weak UIView *weakView in self.view.subviews) {
        if(CGRectIntersectsRect(myFrame, weakView.frame))
        {
            return TRUE;
        }
    }
    
    
    return FALSE;
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[UIApplication sharedApplication] setStatusBarHidden:YES
                                            withAnimation:UIStatusBarAnimationFade];
//    [[self navigationController] setNavigationBarHidden:YES animated:YES];
}
- (BOOL)prefersStatusBarHidden {
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)poofImage:(UITapGestureRecognizer *)sender
{
    
    if (sender.state == UIGestureRecognizerStateEnded)
    {
        NSString *shapeClicked;
        switch (sender.view.tag) {
            case 0:
                shapeClicked = @"stars";
                break;
            case 1:
                shapeClicked = @"circles";
                break;
            default:
                shapeClicked = @"stars";
                break;
            case 2:
                shapeClicked = @"squares";
                break;
            case 3:
                shapeClicked = @"triangles";
        }
        NSLog(@"we poof'd a:%@",shapeClicked);
        if (shapeClicked == _goalObject) {
            _correctClicks = _correctClicks+1;
            NSLog (@"correct clicks:%i",_correctClicks);
            if (_correctClicks == [_gameTapsOfJoyModel.tapArray[_indexSelection][_goalObject] integerValue]) {
                NSLog(@"Job's done!");
                _successfulBool = 1;
                _gameTapsOfJoyModel.tapArray = [self updateTapArray:1];
                NSLog(@"first sBool ==:%@",_gameTapsOfJoyModel.tapArray[_indexSelection][@"successful"]);

//                myTableViewController *tableViewCon=[self.storyboard instantiateViewControllerWithIdentifier:@"myTableViewController"];
//                [self.navigationController pushViewController:tableViewCon animated:YES];
                [self.navigationController popToRootViewControllerAnimated:YES];
            }
        }
        else{
            NSLog(@"arrrrggghhh ya messed up!");
            _successfulBool = 0;
            _gameTapsOfJoyModel.tapArray = [self updateTapArray:0];
            NSLog(@"first sBool ==:%@",_gameTapsOfJoyModel.tapArray[_indexSelection][@"successful"]);
//            myTableViewController *tableViewCon=[self.storyboard instantiateViewControllerWithIdentifier:@"myTableViewController"];
//            [self.navigationController pushViewController:tableViewCon animated:YES];
            [self.navigationController popToRootViewControllerAnimated:YES];
        }
        [sender.view removeFromSuperview];
    }
}

-(NSArray *)updateTapArray:(BOOL)successfulBool;
{
    NSMutableArray *mutableArray = [_gameTapsOfJoyModel.tapArray mutableCopy];
    NSMutableDictionary *mutableDictionary = [mutableArray[_indexSelection] mutableCopy];
    mutableDictionary[@"successful"] = [[NSNumber alloc]initWithBool:successfulBool];
    mutableDictionary[@"completed"] = @1;
    mutableArray[_indexSelection] = mutableDictionary;
    
    return [[NSArray alloc]initWithArray:mutableArray];
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
