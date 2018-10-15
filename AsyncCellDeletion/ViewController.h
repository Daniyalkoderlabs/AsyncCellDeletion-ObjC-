//
//  ViewController.h
//  AsyncCellDeletion
//
//  Created by Daniyal Yousuf on 10/15/18.
//  Copyright © 2018 Daniyal Yousuf. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ActivityData : NSObject {
    @public
    NSString *activitytId;
    NSMutableDictionary *cdata;
    bool currentProgress;
}
- (void)addData: (NSString *)activityId andWithData: (NSMutableDictionary *)data andWithProgress: (BOOL)progress;
@end


@interface ViewController : UIViewController


@end

