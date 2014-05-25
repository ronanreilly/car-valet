//
//  RR_CarEditViewController.m
//  CarValet
//
//  Created by Ronan Sean Reilly on 11/05/2014.
//  Copyright (c) 2014 Ronan Sean Reilly. All rights reserved.
//

#import "RR_CarEditViewController.h"
#import "RR_Car.h"

@interface RR_CarEditViewController ()

@end

@implementation RR_CarEditViewController

// This method is used to prepare information for the segue that brings us to the view where we can edit a car
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    // check if edit segue & set up edit screen
    if ([segue.identifier isEqualToString:@"EditDoneSegue"]) {
        self.currentCar.make = self.makeField.text;
        self.currentCar.model = self.modelField.text;
        self.currentCar.year = [self.yearField.text integerValue];
        self.currentCar.fuelAmount = [self.fuelField.text floatValue];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    NSString *carNumberText;
    carNumberText = [NSString stringWithFormat:@"Car Number: %d",
                     [self.delegate carNumber]];
    self.carNumberLabel.text = carNumberText;
    
    self.currentCar = [self.delegate carToEdit];
    self.makeField.text = self.currentCar.make;
    self.modelField.text = self.currentCar.model;
    self.yearField.text = [NSString stringWithFormat:@"%d", self.currentCar.year];
    self.fuelField.text = [NSString stringWithFormat:@"%0.2f", self.currentCar.fuelAmount];
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    self.currentCar.make = self.makeField.text;
    self.currentCar.model = self.modelField.text;
    self.currentCar.year = [self.yearField.text integerValue];
    self.currentCar.fuelAmount = [self.fuelField.text floatValue];
    
    [self. delegate editedCarUpdated];
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
