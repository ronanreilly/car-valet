//
//  RR_HybridCar.h
//  CarValet
//
//  Created by Ronan Sean Reilly on 24/04/2014.
//  Copyright (c) 2014 Ronan Sean Reilly. All rights reserved.
//

#import "RR_Car.h"

@interface RR_HybridCar : RR_Car

@property (nonatomic) float milesPerGallon;

-(float)milesUntilEmpty;

-(id)initWithMake:(NSString *)make
            model:(NSString *)model
             year:(int)year
       fuelAmount:(float)fuelAmount
              MPG:(float)MPG;

@end
