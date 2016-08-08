//
//  Patient.m
//  Delegate
//
//  Created by EnzoF on 28.07.16.
//  Copyright © 2016 EnzoF. All rights reserved.
//

#import "Patient.h"

@implementation Patient



- (BOOL) fellsBetter{
    BOOL isfellsBetter = arc4random() % 2;
    if(isfellsBetter)
    {
        [self.delegate patientFeelsBad:self];
    
    }
    return isfellsBetter;
}
- (void) takePill{
    NSLog(@"Пациенту %@ дали таблетку",self.name);
    
}
- (void) makeShot{
    
    NSLog(@"Пациенту %@ сделали укол",self.name);
}

- (void) takePillForHead{
    NSLog(@"Пациент %@ принял таблетку от головной боли",self.name);
}


- (void) massage{
    NSLog(@"Пациенту %@   сделали массаж",self.name);
}
- (void) takePillForStomach{
    
    NSLog(@"Пациенту %@ дали таблетку от живота",self.name);
}

@end
