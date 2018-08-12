//
//  CategoryHeaderCollectionViewCell.h
//  GO
//
//  Created by Ajaita Saini on 8/7/18.
//  Copyright © 2018 Amy Liu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ISHPullUp/ISHPullUpHandleView.h"
#import "ISHPullUp/ISHPullUpRoundedView.h"
#import "ISHPullUp/ISHPullUpViewController.h"

@interface CategoryHeaderCollectionViewCell : UICollectionViewCell <ISHPullUpSizingDelegate, ISHPullUpStateDelegate>

@property (weak, nonatomic) IBOutlet ISHPullUpHandleView *handleView;
@property (weak, nonatomic) IBOutlet ISHPullUpHandleView *topView;
@property (strong, nonatomic) ISHPullUpViewController *pullUpController;
@property bool firstAppearanceCompleted;

@end
