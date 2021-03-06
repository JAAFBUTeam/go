//
//  ReviewViewController.m
//  GO
//
//  Created by Amy Liu on 7/20/18.
//  Copyright © 2018 Amy Liu. All rights reserved.
//

#import "ReviewViewController.h"
#import "ReviewsTableViewCell.h"
#import "Review.h"
#import "Location.h"
#import "WriteViewController.h"

@interface ReviewViewController () <ReviewsTableViewCellDelegate, UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *reviews;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ReviewViewController

#pragma mark - View Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setDelegate];
    [self registerNibs];
    [self fetchReviews];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [self fetchReviews];
}

#pragma mark - Networking

- (void) fetchReviews {
    PFQuery *query = [PFQuery queryWithClassName:@"Review"];
    if (self.location != nil) {
        [query whereKey:@"location" equalTo:self.location];
    } else {
        [query whereKey:@"user" equalTo:User.currentUser];
    }
    // fetch data asynchronously
    [query findObjectsInBackgroundWithBlock:^(NSArray *reviews, NSError *error) {
        if (reviews != nil) {
            self.reviews = [[NSMutableArray alloc] init];
            // do something with the array of object returned by the call
            for (int i = reviews.count - 1; i >= 0; i--){
                [self.reviews addObject:reviews[i]];
            }
            [self.tableView reloadData];
        } else {
            NSLog(@"%@", error.localizedDescription);
        }
    }];
}

#pragma mark - Actions

- (IBAction)didTapAdd:(id)sender {
    [self performSegueWithIdentifier:@"writeSegue" sender:nil];
    
}

- (IBAction)didTapDone:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Table View Delegate

- (void) setDelegate {
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.reviews.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ReviewsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ReviewTableViewCell"];
    cell.review = self.reviews[indexPath.row];
    [cell setupReviewsTableViewCell:cell.review];
    return cell;
    
}

#pragma mark - register nibs

-(void) registerNibs {
    UINib *reviewTableViewCell = [UINib nibWithNibName:@"ReviewTableViewCell" bundle:nil];
    [_tableView registerNib:reviewTableViewCell forCellReuseIdentifier:@"ReviewTableViewCell"];
}

#pragma mark - Review Delegate

- (void) didTapMore:(User *) sender {
    
    if (sender != nil && sender == User.currentUser) {
        
        UIAlertController * view=   [UIAlertController
                                     alertControllerWithTitle:nil
                                     message:nil
                                     preferredStyle:UIAlertControllerStyleActionSheet];
        
        UIAlertAction* edit = [UIAlertAction
                               actionWithTitle:@"Edit Review"
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction * action)
                               {
                                   //Do some thing here
                                   [view dismissViewControllerAnimated:YES completion:nil];
                                   
                               }];
        UIAlertAction* cancel = [UIAlertAction
                                 actionWithTitle:@"Cancel"
                                 style:UIAlertActionStyleDefault
                                 handler:^(UIAlertAction * action)
                                 {
                                     [view dismissViewControllerAnimated:YES completion:nil];
                                     
                                 }];
        
        [view addAction:edit];
        [view addAction:cancel];
        [self presentViewController:view animated:YES completion:nil];
    } else {
        UIAlertController * view=   [UIAlertController
                                     alertControllerWithTitle:nil
                                     message:nil
                                     preferredStyle:UIAlertControllerStyleActionSheet];
        
        UIAlertAction* flag = [UIAlertAction
                               actionWithTitle:@"Flag Review"
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction * action)
                               {
                                   //Do some thing here
                                   [view dismissViewControllerAnimated:YES completion:nil];
                                   
                               }];
        UIAlertAction* cancel = [UIAlertAction
                                 actionWithTitle:@"Cancel"
                                 style:UIAlertActionStyleDefault
                                 handler:^(UIAlertAction * action)
                                 {
                                     [view dismissViewControllerAnimated:YES completion:nil];
                                     
                                 }];
        
        [view addAction:flag];
        [view addAction:cancel];
        [self presentViewController:view animated:YES completion:nil];
    }
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:@"writeSegue"]){
        WriteViewController *writeController = [segue destinationViewController];
        writeController.location = self.location;
    }
}

@end
