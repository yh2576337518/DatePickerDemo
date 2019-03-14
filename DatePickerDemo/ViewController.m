//
//  ViewController.m
//  DatePickerDemo
//
//  Created by 惠上科技 on 2019/3/14.
//  Copyright © 2019 惠上科技. All rights reserved.
//

#import "ViewController.h"
#import "BRDatePickerView.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *startBtn;
@property (weak, nonatomic) IBOutlet UIButton *endBtn;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *pickerBottomLayout;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.datePicker.hidden = YES;
}

#pragma mark --------开始时间按钮
- (IBAction)startBtnClick:(UIButton *)sender {
    NSArray *endArr = [self.endBtn.titleLabel.text componentsSeparatedByString:@":"];
    NSDate *minDate = [NSDate br_setHour:0 minute:0];
    NSDate *maxDate = [NSDate br_setHour:[endArr[0] integerValue] minute:[endArr[1] integerValue] - 1];
    [BRDatePickerView showDatePickerWithTitle:@"开机时间" dateType:BRDatePickerModeHM defaultSelValue:sender.titleLabel.text minDate:minDate maxDate:maxDate isAutoSelect:YES themeColor:[UIColor orangeColor] resultBlock:^(NSString *selectValue) {
        [self.startBtn setTitle:selectValue forState:UIControlStateNormal];
    }];
}


#pragma mark ---------结束时间按钮
- (IBAction)endBtnClick:(UIButton *)sender {
    NSArray *startArr = [self.startBtn.titleLabel.text componentsSeparatedByString:@":"];
    NSDate *minDate = [NSDate br_setHour:[startArr[0] integerValue] minute:[startArr[1] integerValue]+1];
    NSDate *maxDate = [NSDate br_setHour:23 minute:59];
    [BRDatePickerView showDatePickerWithTitle:@"关机时间" dateType:BRDatePickerModeHM defaultSelValue:sender.titleLabel.text minDate:minDate maxDate:maxDate isAutoSelect:YES themeColor:[UIColor orangeColor] resultBlock:^(NSString *selectValue) {
        [self.endBtn setTitle:selectValue forState:UIControlStateNormal];
    }];
}
@end
