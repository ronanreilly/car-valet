//
//  RR_Car.h
//  CarValet
//
//  Created by Ronan Sean Reilly on 12/04/2014.
//  Copyright (c) 2014 Ronan Sean Reilly. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RR_Car : NSObject

    @property int year;
    @property NSString *make;
    @property NSString *model;
    @property (nonatomic) float fuelAmount;
    @property (readonly) NSString *carInfo;
    @property (getter = isShowingLitres)BOOL showLitres;


-(id)initWithMake:(NSString *)make
            model:(NSString *)model
             year:(int)year
       fuelAmount:(float)fuelAmount;

-(void)printCarInfo;
-(float)fuelAmount;
-(void)setFuelAmount:(float)fuelAmount;
-(int)year;
-(NSString*)make;
-(NSString*)model;

@end
