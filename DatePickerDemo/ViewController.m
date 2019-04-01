//
//  ViewController.m
//  DatePickerDemo
//
//  Created by 惠上科技 on 2019/3/14.
//  Copyright © 2019 惠上科技. All rights reserved.
//

#import "ViewController.h"
#import "BRDatePickerView.h"
#import "NSDate+BRPickerView.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *start1Btn;
@property (weak, nonatomic) IBOutlet UIButton *end1Btn;

@property (weak, nonatomic) IBOutlet UIButton *start2Btn;
@property (weak, nonatomic) IBOutlet UIButton *end2Btn;

@property (weak, nonatomic) IBOutlet UIButton *start3Btn;
@property (weak, nonatomic) IBOutlet UIButton *end3Btn;

@property (nonatomic, strong)NSMutableDictionary *dateDic;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(NSMutableDictionary *)dateDic{
    if (!_dateDic) {
        _dateDic = [NSMutableDictionary dictionaryWithCapacity:0];
    }
    return _dateDic;
}


-(void)selectStartBtn:(UIButton *)startBtn endBtn:(UIButton *)endBtn selectBtn:(UIButton *)selectBtn selectTimeStr:(NSString *)selectTimeStr dicTimeKey:(NSString *)dicTimeKey{
    NSMutableDictionary *timeDic = [NSMutableDictionary dictionaryWithDictionary:self.dateDic];
    [timeDic removeObjectForKey:dicTimeKey];
    if ([self validateWithTimeCompareTime:selectTimeStr allTimeDateDic:timeDic]) {
        NSLog(@"---------------\n111111111111111111\n你选择的时间与其他的时间段有冲突，请选择其他时间");
    }else{
        NSString *startTimeStr = (startBtn == selectBtn)?selectTimeStr : startBtn.titleLabel.text;
        NSString *endTimeStr = (endBtn == selectBtn) ?selectTimeStr : endBtn.titleLabel.text;
        if ([self validateWithCompareStartTime:startTimeStr withCompareExpireTime:endTimeStr allTimeDateDic:timeDic]) {
            NSLog(@"-----------------\n22222222222222\n你选择的时间段与已有的时间段有冲突，请重新选择");
            return;
        }else{
            [selectBtn setTitle:selectTimeStr forState:UIControlStateNormal];
            NSDate *timeStartDate = [self dateFromString:startTimeStr];
            NSDate *timeEndDate = [self dateFromString:endTimeStr];
            [self.dateDic setObject:@[timeStartDate,timeEndDate] forKey:dicTimeKey];
        }
    }
}

#pragma mark --------开始时间按钮1
- (IBAction)startBtn1Click:(UIButton *)sender {
    NSArray *endArr = [self.end1Btn.titleLabel.text componentsSeparatedByString:@":"];
    NSDate *minDate = [NSDate br_setHour:0 minute:0];
    NSDate *maxDate = [NSDate br_setHour:[endArr[0] integerValue] minute:[endArr[1] integerValue] - 1];
//    [self stringFormDate:[NSDate date]]
    [BRDatePickerView showDatePickerWithTitle:@"开机时间" dateType:BRDatePickerModeHM defaultSelValue:sender.titleLabel.text minDate:minDate maxDate:maxDate isAutoSelect:YES themeColor:[UIColor orangeColor] resultBlock:^(NSString *selectValue) {
        [self selectStartBtn:self.start1Btn endBtn:self.end1Btn selectBtn:self.start1Btn selectTimeStr:selectValue dicTimeKey:@"time1"];
    }];
}


#pragma mark ---------结束时间按钮1
- (IBAction)endBtn1Click:(UIButton *)sender {
    NSArray *startArr = [self.start1Btn.titleLabel.text componentsSeparatedByString:@":"];
    NSDate *minDate = [NSDate br_setHour:[startArr[0] integerValue] minute:[startArr[1] integerValue]+1];
    NSDate *maxDate = [NSDate br_setHour:23 minute:59];
    [BRDatePickerView showDatePickerWithTitle:@"关机时间" dateType:BRDatePickerModeHM defaultSelValue:sender.titleLabel.text minDate:minDate maxDate:maxDate isAutoSelect:YES themeColor:[UIColor orangeColor] resultBlock:^(NSString *selectValue) {
        [self.end1Btn setTitle:selectValue forState:UIControlStateNormal];
        [self selectStartBtn:self.start1Btn endBtn:self.end1Btn selectBtn:self.end1Btn selectTimeStr:selectValue dicTimeKey:@"time1"];
    }];
}



#pragma mark --------开始时间按钮2
- (IBAction)startBtn2Click:(UIButton *)sender {
    NSArray *endArr = [self.end2Btn.titleLabel.text componentsSeparatedByString:@":"];
    NSDate *minDate = [NSDate br_setHour:0 minute:0];
    NSDate *maxDate = [NSDate br_setHour:[endArr[0] integerValue] minute:[endArr[1] integerValue] - 1];
    [BRDatePickerView showDatePickerWithTitle:@"开机时间" dateType:BRDatePickerModeHM defaultSelValue:sender.titleLabel.text minDate:minDate maxDate:maxDate isAutoSelect:YES themeColor:[UIColor orangeColor] resultBlock:^(NSString *selectValue) {
        [self selectStartBtn:self.start2Btn endBtn:self.end2Btn selectBtn:self.start2Btn selectTimeStr:selectValue dicTimeKey:@"time2"];
    }];
}


#pragma mark ---------结束时间按钮2
- (IBAction)endBtn2Click:(UIButton *)sender {
    NSArray *startArr = [self.start2Btn.titleLabel.text componentsSeparatedByString:@":"];
    NSDate *minDate = [NSDate br_setHour:[startArr[0] integerValue] minute:[startArr[1] integerValue]+1];
    NSDate *maxDate = [NSDate br_setHour:23 minute:59];
    [BRDatePickerView showDatePickerWithTitle:@"关机时间" dateType:BRDatePickerModeHM defaultSelValue:sender.titleLabel.text minDate:minDate maxDate:maxDate isAutoSelect:YES themeColor:[UIColor orangeColor] resultBlock:^(NSString *selectValue) {
        [self selectStartBtn:self.start2Btn endBtn:self.end2Btn selectBtn:self.end2Btn selectTimeStr:selectValue dicTimeKey:@"time2"];
    }];
}


#pragma mark --------开始时间按钮3
- (IBAction)startBtn3Click:(UIButton *)sender {
    NSArray *endArr = [self.end3Btn.titleLabel.text componentsSeparatedByString:@":"];
    NSDate *minDate = [NSDate br_setHour:0 minute:0];
    NSDate *maxDate = [NSDate br_setHour:[endArr[0] integerValue] minute:[endArr[1] integerValue] - 1];
    [BRDatePickerView showDatePickerWithTitle:@"开机时间" dateType:BRDatePickerModeHM defaultSelValue:sender.titleLabel.text minDate:minDate maxDate:maxDate isAutoSelect:YES themeColor:[UIColor orangeColor] resultBlock:^(NSString *selectValue) {
        [self selectStartBtn:self.start3Btn endBtn:self.end3Btn selectBtn:self.start3Btn selectTimeStr:selectValue dicTimeKey:@"time3"];
    }];
}


#pragma mark ---------结束时间按钮3
- (IBAction)endBtn3Click:(UIButton *)sender {
    NSArray *startArr = [self.start3Btn.titleLabel.text componentsSeparatedByString:@":"];
    NSDate *minDate = [NSDate br_setHour:[startArr[0] integerValue] minute:[startArr[1] integerValue]+1];
    NSDate *maxDate = [NSDate br_setHour:23 minute:59];
    [BRDatePickerView showDatePickerWithTitle:@"关机时间" dateType:BRDatePickerModeHM defaultSelValue:sender.titleLabel.text minDate:minDate maxDate:maxDate isAutoSelect:YES themeColor:[UIColor orangeColor] resultBlock:^(NSString *selectValue) {
        [self selectStartBtn:self.start3Btn endBtn:self.end3Btn selectBtn:self.end3Btn selectTimeStr:selectValue dicTimeKey:@"time3"];
    }];
}


-(NSString *)stringFormDate:(NSDate *)date{
    NSDateFormatter * formatter = [[NSDateFormatter alloc]init];
    // 下面的格式设置成你想要转化的样子, 2017-07-24 17:47:10
    [formatter setDateFormat:@"HH:mm"];
    NSString *dateStr = [formatter stringFromDate:date];
    return dateStr;
}


-(NSDate *)dateFromString:(NSString *)dateStr{
    NSDateFormatter * formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"HH:mm"];
    NSDate * date = [formatter dateFromString:dateStr];
    return date;
}





/**
 判断当前时间是否处于某个时间段内
 @param compareTime 被判断是时间
 */
- (BOOL)validateWithTimeCompareTime:(NSString *)compareTime allTimeDateDic:(NSMutableDictionary *)timeDateDic{
    NSDate *compareDate = [self dateFromString:compareTime];
    for (NSString *key in timeDateDic) {
        NSArray *timeDateArr = [timeDateDic objectForKey:key];
        NSDate *startTime = timeDateArr[0];
        NSDate *expireTime = timeDateArr[1];
        if ([compareDate compare:startTime] == NSOrderedDescending && [compareDate compare:expireTime] == NSOrderedAscending) {
            return YES;
        }
    }
    return NO;
}

/**
 比较两个时间段是否有交集
 @param compareStartTime 起始时间
 @param compareExpireTime 结束时间
 @return 比较结果
 */
-(BOOL)validateWithCompareStartTime:(NSString *)compareStartTime withCompareExpireTime:(NSString *)compareExpireTime allTimeDateDic:(NSMutableDictionary *)timeDateDic{
    NSDate *compareStartDate = [self dateFromString:compareStartTime];
    NSDate *compareExpireDate = [self dateFromString:compareExpireTime];
    for (NSString *key in timeDateDic) {
        NSArray *timeDateArr = [timeDateDic objectForKey:key];
        NSDate *startDate = timeDateArr[0];
        NSDate *expireDate = timeDateArr[0];
        if (compareExpireDate>=startDate && compareStartDate<=expireDate) {
            return YES;
        }
    }
    return NO;
}
@end
