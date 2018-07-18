//
//  LocationsTableViewCell.m
//  GO
//
//  Created by Joel Gutierrez on 7/16/18.
//  Copyright © 2018 Amy Liu. All rights reserved.
//

#import "LocationsTableViewCell.h"

@implementation LocationsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setDummyImageArray];
    [self setCarouselProperties];
    [self setDatasourceAndDelegate];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

-(void) setLocationObject:(Location *)location {
    self.location = location;
}

-(void)setCarouselProperties {
    self.carousel.type = iCarouselTypeLinear;
    self.carousel.pagingEnabled = YES;
}

-(void)setDummyImageArray {
    
    self.locationImagesArray = [[NSMutableArray alloc] init];
    
    NSString *one = @"cat.jpg";
    NSString *two = @"dog.jpg";
    
    [self.locationImagesArray addObject:one];
    [self.locationImagesArray addObject:two];
}

#pragma mark - carousel protocol methods
-(void) setDatasourceAndDelegate {
    self.carousel.delegate = self;
    self.carousel.dataSource = self;
}

- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel {
    return self.locationImagesArray.count;
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(nullable UIView *)view {
    view = [[UIImageView alloc] initWithFrame:self.carousel.bounds];
    //view = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200.0f, 200.0f)];
    view.contentMode = UIViewContentModeCenter;
    ((UIImageView *)view).image = [UIImage imageNamed:self.locationImagesArray[index]];
    
    return view;
}



@end
