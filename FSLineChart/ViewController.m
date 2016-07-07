//
//  ViewController.m
//  FSLineChart
//
//  Created by Arthur GUIBERT on 30/09/2014.
//  Copyright (c) 2014 Arthur GUIBERT. All rights reserved.
//

#import "ViewController.h"
#import "FSLineChart.h"
#import "UIColor+FSPalette.h"
#import "PedometerViewController.h"
#import "HistoricViewController.h"

@interface ViewController ()

@property (nonatomic, strong) IBOutlet FSLineChart *chart;
@property (nonatomic, strong) IBOutlet FSLineChart *chartWithDates;
//@property (nonatomic, strong) IBOutlet

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //[self loadSimpleChart];
    [self loadChartWithDates];
}

#pragma mark - Setting up the charts

/*- (void)loadSimpleChart {
    NSMutableArray* chartData = [NSMutableArray arrayWithCapacity:10];
    
    for(int i=0;i<10;i++) {
        int r = (rand() + rand()) % 1000;
        chartData[i] = [NSNumber numberWithInt:r + 200];
    }
    
    // Setting up the line chart
    self.chart.verticalGridStep = 5;
    self.chart.horizontalGridStep = 9;
    
    self.chart.labelForIndex = ^(NSUInteger item) {
        return [NSString stringWithFormat:@"%lu",(unsigned long)item];
    };
    
    self.chart.labelForValue = ^(CGFloat value) {
        return [NSString stringWithFormat:@"%.f", value];
    };
    
    [self.chart setChartData:chartData];
}*/

- (void)loadChartWithDates {
    // Generating some dummy data
    
    NSMutableArray* chartData = [NSMutableArray arrayWithCapacity:13];
    for(int i=0;i<13;i++) {
        chartData[i] = [NSNumber numberWithFloat: (float)i / 30.0f + (float)(rand() % 10000) / 500.0f];
    }
    NSMutableArray* months = [NSMutableArray arrayWithCapacity:12];

    for(int i=0; i<=24; i+=2) {
        NSString *str = [NSString stringWithFormat:@"%d", i];
        [months addObject: str];
        NSLog(@"%@", months);
        }
    
    _chartWithDates.verticalGridStep = 6;
    _chartWithDates.horizontalGridStep = 12;
    _chartWithDates.fillColor = nil;
    _chartWithDates.displayDataPoint = YES;
    _chartWithDates.dataPointColor = [UIColor fsOrange];
    _chartWithDates.dataPointBackgroundColor = [UIColor fsOrange];
    _chartWithDates.dataPointRadius = 0;
    _chartWithDates.color = [_chartWithDates.dataPointColor colorWithAlphaComponent:0.3];
    _chartWithDates.valueLabelPosition = ValueLabelLeftMirrored;
    
    _chartWithDates.labelForIndex = ^(NSUInteger item) {
        return months[item];
    };
    
    _chartWithDates.labelForValue = ^(CGFloat value) {
        return [NSString stringWithFormat:@"%.0f 회", value];
    };
    
    [_chartWithDates setChartData:chartData];
}

@end
