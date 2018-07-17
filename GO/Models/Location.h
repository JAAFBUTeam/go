//
//  Location.h
//  GO
//
//  Created by Amy Liu on 7/16/18.
//  Copyright © 2018 Amy Liu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIImage+AFNetworking.h"

@interface Location : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *synopsis;
@property (nonatomic, strong) NSString *address;

@property (nonatomic) float lat;
@property (nonatomic) float lon;
@property (nonatomic) double rating;

+ (Location *)createLocation;

// @property(nonatomic, strong) NSArray<UIImage *> *images;
//+ (NSArray <Location *>) *createLocations;

@end