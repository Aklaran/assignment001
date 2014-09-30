//
//  myTableViewController.m
//  taps_of_joy
//
//  Created by Siri Tembunkiart on 9/16/14.
//  Copyright (c) 2014 Bo Assignment. All rights reserved.
//

#import "myTableViewController.h"
#import "GameViewController.h"

@interface myTableViewController ()

@end

@implementation myTableViewController

- (id)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        // Custom initialization
        _myTapsOfJoyModel = [[TapsOfJoyModel alloc] init];
        
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tableView.dataSource = _myTapsOfJoyModel;
    [self.tableView reloadData];
    UIImage *resetImage = [UIImage imageNamed:@"reset.png"];
    UIImageView *resetImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
    resetImageView.image = resetImage;
    UIBarButtonItem *resetButton = [[UIBarButtonItem alloc]initWithCustomView:resetImageView];
    [self.navigationController.navigationBar.topItem setRightBarButtonItem:resetButton];
    UITapGestureRecognizer *resetTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(resetTable:)];
    [resetImageView addGestureRecognizer:resetTap];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    GameViewController *gameViewCon=[self.storyboard instantiateViewControllerWithIdentifier:@"GameViewController"];
    gameViewCon.indexSelection = indexPath.row;
    gameViewCon.gameTapsOfJoyModel = _myTapsOfJoyModel;
    [self.navigationController pushViewController:gameViewCon animated:YES];
    
}

- (void)resetTable:(UITapGestureRecognizer *)sender
{
    if (sender.state == UIGestureRecognizerStateEnded)
    {
        _myTapsOfJoyModel = [[TapsOfJoyModel alloc] init];
        self.tableView.dataSource = _myTapsOfJoyModel;
        [self.tableView reloadData];
    }
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

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
