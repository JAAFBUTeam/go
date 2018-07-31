//
//  CarouselTableViewCell.h
//  GO
//
//  Created by Joel Gutierrez on 7/19/18.


#import <UIKit/UIKit.h>
#import "Location.h"
#import "UIImageView+AFNetworking.h"
#import "iCarousel.h"

@protocol CarouselImageTapDelegate

-(void) ImageTapped:(NSUInteger)section;

@end

@interface CarouselTableViewCell : UITableViewCell <iCarouselDelegate, iCarouselDataSource>

@property (strong, nonatomic) Location *location;
@property (strong, nonatomic) NSMutableArray *locationImagesArray;
@property (nonatomic, assign) NSInteger sectionID;
@property (weak, nonatomic) IBOutlet iCarousel *carousel;
@property (nonatomic, weak) id<CarouselImageTapDelegate> imageDelegate;

-(void)setLocationProperty:(Location *)location;
-(void)setCarouselTypeProperties:(iCarouselType)carouselType;
-(void)setSectionIDProperty:(NSInteger)sectionID;
-(void)setDatasourceAndDelegate;
-(void)setupCarouselCell;

@end
