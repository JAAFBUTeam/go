//
//  ListViewController.h
//  GO
//
//  Created by Joel Gutierrez on 7/13/18.
//  Copyright © 2018 Joel Gutierrez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailsViewController.h"
#import "Location.h"
#import "InfoTableViewCell.h"
#import "CarouselTableViewCell.h"
#import "AppDelegate.h"
#import "GlobalFilters.h"
#import "FiltersViewController.h"
#import "MBProgressHUD.h"

@interface ListViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UISearchResultsUpdating, CarouselImageTapDelegate, ApplyFilterDelegate, LabelTapDelegate>

@property (nonatomic, strong) CLLocationManager *currentLocation;

@end
