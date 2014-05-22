//
//  RR_Car.m
//  CarValet
//
//  Created by Ronan Sean Reilly on 12/04/2014.
//  Copyright (c) 2014 Ronan Sean Reilly. All rights reserved.
//

#import "RR_Car.h"

@implementation RR_Car

-(id)initWithMake:(NSString *)make model:(NSString *)model year:(int)year fuelAmount:(float)fuelAmount
{
    self = [super init];
    if (self) {
        _make = [make copy];
        _model = [model copy];
        _year = year;
        _fuelAmount = fuelAmount;
    }
    
    return self;
}

// Return a string of car info, unknown if not specified
-(NSString *)carInfo{
    return  [NSString stringWithFormat:@"Current Car Info: \n\n Make: %@\n Model: %@\n Year: %d",
             self.make ? self.make : @"Unknown Make",
             self.model ? self.model : @"Unknown Model",
             self.year];
}

-(void)printCarInfo
{
    // Challenege 1
    if (self.make) {
        NSLog(@"Car: Well done make specified!");
    }else{
         NSLog(@"Car undefined: no make specified!");
    }
    if (self.model) {
        NSLog(@"Well done model specified!");
    }else{
        NSLog(@"Car undefined: no model specified!");
    }
    if (!self.make && !self.model) {
        NSLog(@"Car undefined: no make or model specified!");
        NSLog(@"Car Year: %d", self.year);
        NSLog(@"No of Gallons in Tank is: %0.2f", self.fuelAmount);
    }
}

-(float)fuelAmount{
    if (self.isShowingLitres) {
        return (_fuelAmount * 3.7845);
    }
    return _fuelAmount;
}

@end
