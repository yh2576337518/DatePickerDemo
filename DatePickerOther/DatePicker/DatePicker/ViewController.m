//
//  ViewController.m
//  DatePicker
//
//  Created by iMac on 17/2/23.
//  Copyright © 2017年 zws. All rights reserved.
//

#import "ViewController.h"
#import "WSDatePickerView.h"
#define RGB(x,y,z) [UIColor colorWithRed:x/255.0 green:y/255.0 blue:z/255.0 alpha:1.0]

#define randomColor [UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:1]

@interface ViewController ()

@property(nonatomic,strong)UIButton *startBtn;
@property(nonatomic,strong)UIButton *endBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.startBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.startBtn.frame = CGRectMake(20, 40, self.view.frame.size.width-40, 40);
    self.startBtn.titleLabel.text = @"00:00";
    [self.startBtn setTitle:@"00:00" forState:UIControlStateNormal];
    self.startBtn.layer.cornerRadius = 5;
    self.startBtn.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:self.startBtn];
    [self.startBtn addTarget:self action:@selector(startTimeAction:) forControlEvents:UIControlEventTouchUpInside];
    
    self.endBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.endBtn.frame = CGRectMake(20, 40+50, self.view.frame.size.width-40, 40);
    self.endBtn.titleLabel.text = @"23:59";
    [self.endBtn setTitle:@"23:59" forState:UIControlStateNormal];
    self.endBtn.layer.cornerRadius = 5;
    self.endBtn.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:self.endBtn];
    [self.endBtn addTarget:self action:@selector(endTimeAction:) forControlEvents:UIControlEventTouchUpInside];
}


- (void)startTimeAction:(UIButton *)btn{
    //时-分
    WSDatePickerView *datepicker = [[WSDatePickerView alloc] initWithDateStyle:DateStyleShowHourMinute scrollToDate:[self dateFromString:btn.titleLabel.text] CompleteBlock:^(NSDate *selectDate) {
        NSString *dateString = [selectDate stringWithFormat:@"HH:mm"];
        NSLog(@"选择的日期：%@",dateString);
        btn.titleLabel.text = dateString;
        [btn setTitle:dateString forState:UIControlStateNormal];
    }];
    datepicker.minLimitDate = [self dateFromString:@"00:00"];
    datepicker.maxLimitDate = [[self dateFromString:self.endBtn.titleLabel.text] dateBySubtractingMinutes:1];
    datepicker.selectPickerColor = [UIColor orangeColor];
    datepicker.dateLabelColor = [UIColor orangeColor];//年-月-日-时-分 颜色
    [datepicker show];
}

- (void)endTimeAction:(UIButton *)btn{
    //时-分
    WSDatePickerView *datepicker = [[WSDatePickerView alloc] initWithDateStyle:DateStyleShowHourMinute scrollToDate:[self dateFromString:btn.titleLabel.text] CompleteBlock:^(NSDate *selectDate) {
        NSString *dateString = [selectDate stringWithFormat:@"HH:mm"];
        NSLog(@"选择的日期：%@",dateString);
        btn.titleLabel.text = dateString;
        [btn setTitle:dateString forState:UIControlStateNormal];
    }];
    datepicker.minLimitDate = [[self dateFromString:self.startBtn.titleLabel.text] dateByAddingMinutes:1];
    datepicker.maxLimitDate = [self dateFromString:@"23:59"];
    datepicker.selectPickerColor = [UIColor orangeColor];
    datepicker.dateLabelColor = [UIColor orangeColor];//年-月-日-时-分 颜色
    [datepicker show];
}

-(NSDate *)dateFromString:(NSString *)dateStr{
    NSDateFormatter * formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"HH:mm"];
    NSDate * date = [formatter dateFromString:dateStr];
    return date;
}
@end
