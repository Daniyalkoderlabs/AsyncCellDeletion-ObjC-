//
//  Activitycell.m
//  AsyncCellDeletion
//
//  Created by Daniyal Yousuf on 10/15/18.
//  Copyright © 2018 Daniyal Yousuf. All rights reserved.
//

#import "Activitycell.h"
#import "ViewController.h"
#import "DGActivityIndicatorView.h"
@implementation Activitycell {
    
    __weak IBOutlet UIButton *btnDelete;
    __weak IBOutlet UIView *viewOverlay;
    __weak IBOutlet DGActivityIndicatorView *indicatorView;
    __weak IBOutlet UILabel *lblTitle;
    ActivitycellType currentType;
    ActivityData *currentData;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    btnDelete.layer.cornerRadius = btnDelete.frame.size.height / 2.0;
    btnDelete.layer.masksToBounds = YES;
    indicatorView.type = DGActivityIndicatorAnimationTypeBallClipRotateMultiple;
    currentType = NONOVERLAY;
    // Initialization code
}

-(void)prepareForReuse {
    [super prepareForReuse];
    btnDelete.backgroundColor = [UIColor redColor];
}

- (void)bindData: (ActivityData *)data {
    currentData = data;
    lblTitle.text = [NSString stringWithFormat:@"Account id is %@",data->activitytId];
    if (data->currentProgress) {
        [self showOverlay];
    } else {
        [self hideOverlay];
    }
    
}

- (void)updateView: (ActivitycellType)type {
    
    if (type == OVERLAY) {
        [self showOverlay];
    } else {
        [self hideOverlay];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)didTappedDelete:(UIButton *)sender {
    sender.backgroundColor = [UIColor lightGrayColor];
    if (self.delegate && [self.delegate respondsToSelector:@selector(didTappedDelete:withCurrentData:andWithCell:)]) {
        
        [self.delegate didTappedDelete:NONOVERLAY withCurrentData:currentData andWithCell:self];
        
    }
}

- (void)showOverlay {
    [indicatorView startAnimating];
    [viewOverlay setHidden:NO];
}

- (void)hideOverlay {
    [indicatorView stopAnimating];
    [viewOverlay setHidden:YES];
}


@end
