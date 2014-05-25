//
//  RR_ViewController.m
//  CarValet
//
//  Created by Ronan Sean Reilly on 12/04/2014.
//  Copyright (c) 2014 Ronan Sean Reilly. All rights reserved.
//

#import "RR_ViewController.h"
#import "RR_Car.h"
#import "RR_CarEditViewController.h"


@implementation RR_ViewController
{
    NSMutableArray *arrayOfCars;
    NSInteger displayedCarIndex;
}

#pragma mark - View Lifecycle

- (void)prepareForSegue:(UIStoryboardSegue *)segue
                 sender:(id)sender {
    if ([segue.identifier isEqualToString:@"EditSegue"]) {
        RR_CarEditViewController *nextController;
        nextController = segue.destinationViewController;
        nextController.delegate = self;
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // array to hold all cars
    arrayOfCars = [[NSMutableArray alloc] init];
    // create a sample car at app launch
    [self newCar:nil];
    // set car index to 0, 1st item
    displayedCarIndex = 0;

    // Display current car info
    [self displayCurrentCarInfo];
}


// Will be called each time teh view's controller is about to be displayed on teh
// screen.
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    RR_Car *myCar = [[RR_Car alloc] init];
    [myCar printCarInfo];
    
    myCar.make = @"Ford";
    myCar.model = @"Escape";
    myCar.year = 2014;
    myCar.fuelAmount = 10.0f;
    
    [myCar printCarInfo];
    
    RR_Car *otherCar = [[RR_Car alloc] initWithMake:@"Honda"
                                        model:@"Accord"
                                         year:2010
                                   fuelAmount:12.5f];
    [otherCar printCarInfo];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)displayCurrentCarInfo{
    // Load current car & store reference
    RR_Car *currentCar;
    currentCar = [arrayOfCars objectAtIndex:displayedCarIndex];
    // Get car desc
    self.carInfoLabel.text = currentCar.carInfo;
    
    [self updateLabel:self.CarNumberLabel
       withBaseString:@"Car Number: "
                count:displayedCarIndex + 1];
}

// Called by prev & next buttons
-(void)changeDisplayedCar:(NSInteger)newIndex{
    // Vaildate the new index
    if (newIndex < 0) {
        newIndex = 0;
    }else if (newIndex >= [arrayOfCars count]){
        newIndex = [arrayOfCars count] -1;
    }
    // Make sure index has changed
    if (displayedCarIndex != newIndex) {
        displayedCarIndex = newIndex;
        [self displayCurrentCarInfo];
    }
    
}

-(void)updateLabel:(UILabel*)theLabel
    withBaseString:(NSString*)baseString
             count:(NSInteger)theCount{
    
    NSString *newText;
    newText = [NSString stringWithFormat:@"%@ %ld", baseString, (long)theCount];
    
    theLabel.text = newText;
}

-(RR_Car*)carToEdit{
    return arrayOfCars[displayedCarIndex];
}

-(NSInteger)carNumber{
    return displayedCarIndex;
}

-(void)editedCarUpdated{
    [self displayCurrentCarInfo];
}

// Create a new car when user hits button
- (IBAction)newCar:(id)sender
{
    // new instance
    RR_Car *newCar = [[RR_Car alloc] init];
    // add to car container
    [arrayOfCars addObject:newCar];
    
    [self updateLabel:self.totalCarsLabel
       withBaseString:@"Total Cars"
                count:[arrayOfCars count]];
}

- (IBAction)previousCar:(id)sender {
    [self changeDisplayedCar:displayedCarIndex -1];
}

- (IBAction)nextCar:(id)sender {
    [self changeDisplayedCar:displayedCarIndex +1];
}

// Unwind segue action
- (IBAction)editingDone:(UIStoryboardSegue*)segue {
    [self displayCurrentCarInfo];
    NSLog(@"\neditedCarUpdated in called!\n");
}



@end
