//
//  ReviewsTableViewCell.h
//  GO
//
//  Created by Amy Liu on 7/18/18.
//  Copyright © 2018 Amy Liu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Review.h"
#import "Parse/Parse.h"
#import "ParseUI/ParseUI.h"
#import "HCSStarRatingView.h"

@protocol ReviewsTableViewCellDelegate

- (void) didTapMore:(User *) sender;

@end

@interface ReviewsTableViewCell : UITableViewCell

@property (nonatomic, weak) id<ReviewsTableViewCellDelegate> delegate;

@property (nonatomic, strong) HCSStarRatingView *stars;
@property (nonatomic, strong) Review *review;
@property (weak, nonatomic) IBOutlet UIImageView *moreButton;
@property (weak, nonatomic) IBOutlet PFImageView *userImage;
@property (weak, nonatomic) IBOutlet UIImageView *locationImage;
@property (weak, nonatomic) IBOutlet UILabel *username;
@property (weak, nonatomic) IBOutlet UILabel *rating;
@property (weak, nonatomic) IBOutlet UILabel *reviewText;

-(void)setupReviewsTableViewCell:(Review *) review;
-(void)setupReviewsTableViewCell:(User *) user withReview: (Review *) review;

@end
