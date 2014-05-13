//
//  RR_CarEditViewController.h
//  CarValet
//
//  Created by Ronan Sean Reilly on 11/05/2014.
//  Copyright (c) 2014 Ronan Sean Reilly. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RR_Car;

@interface RR_CarEditViewController : UIViewController

@property (nonatomic) NSInteger carNumber;
@property (strong, nonatomic) RR_Car *currentCar;


@property (weak, nonatomic) IBOutlet UILabel *carNumberLabel;
@property (weak, nonatomic) IBOutlet UITextField *makeField;
@property (weak, nonatomic) IBOutlet UITextField *modelField;
@property (weak, nonatomic) IBOutlet UITextField *yearField;
@property (weak, nonatomic) IBOutlet UITextField *fuelField;


@end
