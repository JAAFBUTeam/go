//
//  User.h
//  GO
//
//  Created by Amy Liu on 7/23/18.
//  Copyright © 2018 Amy Liu. All rights reserved.
//

#import "PFUser.h"
#import "Parse/Parse.h"
#import "Location.h"

@interface User : PFUser <PFSubclassing>

@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *password;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) CLLocationManager *currentLocation;

@property (nonatomic, strong) PFFile *image;

@property (nonatomic, strong) NSMutableArray<Location *> *favorites;
@property (nonatomic, strong) NSMutableArray *reviews;

@end
