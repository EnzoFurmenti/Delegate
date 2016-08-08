//
//  FriendDoctor.m
//  Delegate
//
//  Created by EnzoF on 28.07.16.
//  Copyright © 2016 EnzoF. All rights reserved.
//

#import "FriendDoctor.h"

@implementation FriendDoctor


- (void) relaxation:(Patient*)patient{
    NSLog(@"Пациенту %@  прописан отдых",patient.name);
}
- (void) makeVitamine:(Patient*)patient{
    NSLog(@"Пациенту %@ дали витаминки!)",patient.name);

}


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
        
        [self relaxation:patient];
    }
    else if(patient.temperature > 39.5)
    {
        NSLog(@"У пациента %@ высокая температура",patient.name);
        [self relaxation:patient];
        [self makeVitamine:patient];
    }
    else
    {
        
        NSLog(@"У пациента %@ переутомление.",patient.name);
        [self relaxation:patient];
    }
    
    if(patient.headAche || patient.stomachAche || patient.footAche)
    {
        NSLog(@"Пациенту %@ надо пройтись погулять",patient.name);
    }
    
    patient.goodGradeDoctor = arc4random() % 2;
}

@end
