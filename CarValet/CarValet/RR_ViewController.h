//
//  RR_ViewController.h
//  CarValet
//
//  Created by Ronan Sean Reilly on 12/04/2014.
//  Copyright (c) 2014 Ronan Sean Reilly. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RR_CarEditControllerProtocol.h"

@interface RR_ViewController : UIViewController <RR_CarEditControllerProtocol>

@property (weak, nonatomic) IBOutlet UILabel *totalCarsLabel;
@property (weak, nonatomic) IBOutlet UILabel *CarNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *carInfoLabel;


- (IBAction)newCar:(id)sender;
- (IBAction)previousCar:(id)sender;
- (IBAction)nextCar:(id)sender;

@end
