//
//  DatePickerViewController.h
//  FSLineChart
//
//  Created by MyMac on 2016. 7. 7..
//  Copyright © 2016년 Arthur GUIBERT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DatePickerViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (strong, nonatomic) NSString *dateType;
@property (strong, nonatomic) NSDate *date;

@end
