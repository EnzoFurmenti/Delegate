//
//  Doctor.h
//  Delegate
//
//  Created by EnzoF on 28.07.16.
//  Copyright © 2016 EnzoF. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Patient.h"

@interface Doctor : NSObject<PatientDelegate>

@property(nonatomic, strong)NSString *name;


@end
