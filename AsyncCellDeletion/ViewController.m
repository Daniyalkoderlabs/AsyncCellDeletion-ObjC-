//
//  ViewController.m
//  AsyncCellDeletion
//
//  Created by Daniyal Yousuf on 10/15/18.
//  Copyright © 2018 Daniyal Yousuf. All rights reserved.
//

#import "ViewController.h"
#import "Activitycell.h"


@implementation ActivityData

-(instancetype)init {
    if (self == [super init]) {
        //data = [NSMutableDictionary new];
    }
    
    return self;
    
}


- (void)addData: (NSString *)activityId andWithData: (NSMutableDictionary *)data andWithProgress: (BOOL)progress{
    
        activitytId = activityId;
        cdata        = data;
        currentProgress = progress;
    
}
@end

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource, ActivityCellDelegate> {
    
    NSMutableArray <ActivityData *> *dataSource;
    
}

@property (weak, nonatomic) IBOutlet UITableView *basetableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self registerXibs];
    [self addDummyData];
    // Do any additional setup after loading the view, typically from a nib.
}


#pragma MARK - TABLEVIEW METHODS
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return dataSource.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    Activitycell *activitycell = [tableView dequeueReusableCellWithIdentifier:@"activitycell"];
    activitycell.delegate = self;
    [activitycell bindData: dataSource[indexPath.row]];
    return activitycell;

    
    
}


#pragma MARK - HELPER METHODS
- (void)registerXibs {
    
    dataSource = [NSMutableArray new];
    [_basetableView registerNib:[UINib nibWithNibName:@"Activitycell" bundle:nil] forCellReuseIdentifier:@"activitycell"];
    
}

- (void)addDummyData {
    
    
    ActivityData *data1 = [ActivityData new];
    [data1 addData:@"DANIYAL" andWithData:nil andWithProgress:NO];
    
    
    ActivityData *data2 = [ActivityData new];
    [data2 addData:@"NABEEL" andWithData:nil andWithProgress:NO];
    
    ActivityData *data3 = [ActivityData new];
    [data3 addData:@"NEHAAL" andWithData:nil andWithProgress:NO];
    
    
    ActivityData *data4 = [ActivityData new];
    [data4 addData:@"RAFAY" andWithData:nil andWithProgress:NO];
    
    
    ActivityData *data5 = [ActivityData new];
    [data5 addData:@"JAVEED" andWithData:nil andWithProgress:NO];
    
    
    ActivityData *data6 = [ActivityData new];
    [data6 addData:@"MUBEEN" andWithData:nil andWithProgress:NO];
    
    
    ActivityData *data7 = [ActivityData new];
    [data7 addData:@"UMAIR" andWithData:nil andWithProgress:NO];
    
    
    
    ActivityData *data8 = [ActivityData new];
    [data8 addData:@"ABID" andWithData:nil andWithProgress:NO];
    
    
    
    
    ActivityData *data9 = [ActivityData new];
    [data9 addData:@"KHAN" andWithData:nil andWithProgress:NO];
    
    
    
    
    ActivityData *data10 = [ActivityData new];
    [data10 addData:@"ABDUL" andWithData:nil andWithProgress:NO];
    
    
    
    ActivityData *data11 = [ActivityData new];
    [data11 addData:@"MAAZ" andWithData:nil andWithProgress:NO];
    
    
    
    ActivityData *data12 = [ActivityData new];
    [data12 addData:@"AHMED" andWithData:nil andWithProgress:NO];
    
    
    
    ActivityData *data13 = [ActivityData new];
    [data13 addData:@"SAAD" andWithData:nil andWithProgress:NO];
    
    
    
    ActivityData *data14 = [ActivityData new];
    [data14 addData:@"MONAL" andWithData:nil andWithProgress:NO];
    
    
    
    ActivityData *data15 = [ActivityData new];
    [data15 addData:@"JABBAR" andWithData:nil andWithProgress:NO];
    
    
    
    
    ActivityData *data16 = [ActivityData new];
    [data16 addData:@"AYAAZ" andWithData:nil andWithProgress:NO];
    
    
    
    
    ActivityData *data17 = [ActivityData new];
    [data17 addData:@"FARHAN" andWithData:nil andWithProgress:NO];
    
    
    
    ActivityData *data18 = [ActivityData new];
    [data18 addData:@"QASIM" andWithData:nil andWithProgress:NO];
    
    
    
    ActivityData *data19 = [ActivityData new];
    [data19 addData:@"SALMAN" andWithData:nil andWithProgress:NO];
    
    
    
    ActivityData *data20 = [ActivityData new];
    [data20 addData:@"HAMZA" andWithData:nil andWithProgress:NO];
    

    [dataSource addObject:data1];
    [dataSource addObject:data2];
    [dataSource addObject:data3];
    [dataSource addObject:data4];
    [dataSource addObject:data5];
    [dataSource addObject:data6];
    [dataSource addObject:data7];
    [dataSource addObject:data8];
    [dataSource addObject:data9];
    [dataSource addObject:data10];
    [dataSource addObject:data11];
    [dataSource addObject:data12];
    [dataSource addObject:data13];
    [dataSource addObject:data14];
    [dataSource addObject:data15];
    [dataSource addObject:data16];
    [dataSource addObject:data17];
    [dataSource addObject:data18];
    [dataSource addObject:data19];
    [dataSource addObject:data20];
}


#pragma MARK - ACTIVITY CELL DELEGTATE
//ls | xargs -P10 -I{} git -C {} pull
-(void)didTappedDelete:(ActivitycellType)type withCurrentData:(ActivityData *)data andWithCell:(UITableViewCell *)cell {
    
    if (type == NONOVERLAY) {
        Activitycell *castedCell = (Activitycell *)cell;
        [castedCell updateView:OVERLAY];
        NSIndexPath *currentIndex = [_basetableView indexPathForCell:cell];
        dataSource[currentIndex.row]->currentProgress = YES;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self removeCell:data];
        });
    } else {}
}

- (void)removeCell: (ActivityData *)data {
    

    int index;
    @try {
        index = [self getIndex:data];
    } @catch (NSException *exception) {
        NSLog(@"Fatal Error");
    } @finally {}
    
    
    
    
    NSLog(@"Data to be removed %@",dataSource[index] -> activitytId);
    [dataSource removeObjectAtIndex:index];
    
    NSIndexPath *currentPath = [NSIndexPath indexPathForItem:index inSection:0];
    [_basetableView deleteRowsAtIndexPaths:@[currentPath] withRowAnimation:UITableViewRowAnimationNone];
    
    
}

- (int)getIndex: (ActivityData *)data  {
    
    for (int  i = 0; i < dataSource.count; i++) {
        
        if ([data->activitytId isEqualToString:dataSource[i]->activitytId]) {
            return i;
        }
        
    }
    @throw([NSException new]);
}

@end
