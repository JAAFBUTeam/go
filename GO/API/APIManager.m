//
//  APIManager.m
//  GO
//
//  Created by Ajaita Saini on 7/24/18.
//  Copyright © 2018 Amy Liu. All rights reserved.
//

#import "APIManager.h"
#import "InstagramKit.h"

static NSString * const baseRedirectURLString = @"https://api.instagram.com/oauth/authorize/?client_id=";
static NSString * const clientID = @"daa39e5d2da244f49fc0470bfd996154";
static NSString * const tailRedirectURLString = @"&redirect_uri=REDIRECT-URI&response_type=code";

@implementation APIManager

+(void)redirectToInstagram:(InstagramEngine *)engine {
    [[InstagramEngine sharedEngine] setAccessToken:@"8282989252.daa39e5.0cc169c362c84731b8f0c0ae397ad4b1"/*@"8282989252.1677ed0.7c78fb4fa96e45f2b7b8aa27d0aedfc5"*/];
}

+(void)fetchMediaFromInstagram:(void (^)(NSArray<InstagramMedia *> *media))completionHandler {
    InstagramEngine *engine = [InstagramEngine sharedEngine];
    [APIManager redirectToInstagram:engine];
    
    [engine getMediaForUser:@"8282989252" count:36 maxId:nil withSuccess:^(NSArray<InstagramMedia *> * _Nonnull media, InstagramPaginationInfo * _Nonnull paginationInfo) {
        completionHandler(media);
    } failure:^(NSError * _Nonnull error, NSInteger serverStatusCode, NSDictionary * _Nonnull response) {
        completionHandler(@[]);
    }];
    
}

+(void)fetchMediaFromInstagram:(Location *)currentLocation completionHandler:(void (^)(NSArray<InstagramMedia *> *media))completionHandler {
    InstagramEngine *engine = [InstagramEngine sharedEngine];
    [APIManager redirectToInstagram:engine];
    
    CLLocationCoordinate2D coordinates = CLLocationCoordinate2DMake(currentLocation.lat, currentLocation.lon);
    
    [engine getSelfRecentMediaWithCount:36 maxId:nil success:^(NSArray<InstagramMedia *> * _Nonnull media, InstagramPaginationInfo * _Nonnull paginationInfo) {
        NSMutableArray<InstagramMedia *> *filteredMedia = [NSMutableArray new];
        for (int i = 0; i < [media count]; i++){
            NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
            [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
            [formatter setMaximumFractionDigits:2];

            NSString *instagram_latitude = [formatter stringFromNumber:@([media objectAtIndex:i].location.latitude)];
            NSString *current_latitude = [formatter stringFromNumber:@(coordinates.latitude)];
            NSString *instagram_longitude = [formatter stringFromNumber:@([media objectAtIndex:i].location.longitude)];
            NSString *current_longitude = [formatter stringFromNumber:@(coordinates.longitude)];

            //use location values to compare
            if (instagram_latitude == current_latitude && instagram_longitude == current_longitude){
                [filteredMedia addObject:[media objectAtIndex:i]];
            }
        }
        completionHandler(filteredMedia);
    } failure:^(NSError * _Nonnull error, NSInteger serverStatusCode, NSDictionary * _Nonnull response) {
        completionHandler(@[]);
    }];
}

@end
