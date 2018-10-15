//
//  Activitycell.h
//  AsyncCellDeletion
//
//  Created by Daniyal Yousuf on 10/15/18.
//  Copyright © 2018 Daniyal Yousuf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppEnum.h"
#import "ViewController.h"
NS_ASSUME_NONNULL_BEGIN

@protocol ActivityCellDelegate <NSObject>

- (void)didTappedDelete: (ActivitycellType)type withCurrentData: (ActivityData *)data andWithCell: (UITableViewCell *)cell;

@end

@interface Activitycell : UITableViewCell

- (void)bindData: (ActivityData *)data;
- (void)updateView: (ActivitycellType)type;


@property(nonatomic, weak) id<ActivityCellDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
