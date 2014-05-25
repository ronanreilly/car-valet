//
//  RR_CarEditControllerProtocol.h
//  CarValet
//
//  Created by Ronan Sean Reilly on 24/05/2014.
//  Copyright (c) 2014 Ronan Sean Reilly. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RR_Car;

@protocol RR_CarEditControllerProtocol <NSObject>

-(RR_Car*)carToEdit;
-(NSInteger)carNumber;
-(void)editedCarUpdated;

@end
