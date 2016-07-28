//
//  Doctor.m
//  Delegate
//
//  Created by EnzoF on 28.07.16.
//  Copyright © 2016 EnzoF. All rights reserved.
//

#import "Doctor.h"

@implementation Doctor


#pragma mark -PatientDelegate-


- (void) patientFeelsBad: (Patient*)patient{
    
    if(patient.shivering ||(patient.temperature >= 37.0 && patient.temperature <=39.5)){
        if(patient.shivering)
        {
            NSLog(@"У пациента %@ озноб",patient.name);
        }
        if(patient.temperature >= 37.0 && patient.temperature <=39.5){
            NSLog(@"У пациента %@ повышенная температура",patient.name);
        }
        
        [patient takePill];
    }
    else if(patient.temperature > 39.5)
    {
        NSLog(@"У пациента %@ высокая температура",patient.name);
            [patient makeShot];
    }
    else
    {
        
        NSLog(@"%@ переутомление. Отдыхать",patient.name);
    }
    
}

@end
