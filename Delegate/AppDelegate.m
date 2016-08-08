//
//  AppDelegate.m
//  Delegate
//
//  Created by EnzoF on 28.07.16.
//  Copyright © 2016 EnzoF. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "Doctor.h"
#import "Patient.h"
#import "FriendDoctor.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor blueColor];
    [self.window makeKeyAndVisible];
    ViewController *viewController = [[ViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:viewController];
    self.window.rootViewController = nav;
    
    
    
    Doctor *doctor = [[Doctor alloc] init];
    FriendDoctor *friendDoctor1 = [[FriendDoctor alloc] init];
    FriendDoctor *friendDoctor2 = [[FriendDoctor alloc] init];
    
    
    Patient *patient1 = [[Patient alloc] init];
    patient1.name = @"Николай";
    patient1.temperature = 40.5f;
    patient1.shivering = arc4random() % 2;
    patient1.headAche = YES;
    patient1.stomachAche = NO;
    patient1.footAche = NO;
    
    Patient *patient2 = [[Patient alloc] init];
    patient2.name = @"Александр";
    patient2.temperature = 36.7f;
    patient2.shivering = arc4random() % 2;
    patient2.headAche = NO;
    patient2.stomachAche = YES;
    patient2.footAche = NO;
    
    Patient *patient3 = [[Patient alloc] init];
    patient3.name = @"Василий";
    patient3.temperature = 38.5f;
    patient3.shivering = arc4random() % 2;
    patient3.headAche = NO;
    patient3.stomachAche = NO;
    patient3.footAche = YES;
    
    Patient *patient4 = [[Patient alloc] init];
    patient4.name = @"Федор";
    patient4.temperature = 39.5f;
    patient4.shivering = arc4random() % 2;
    patient4.headAche = YES;
    patient4.stomachAche = NO;
    patient4.footAche = NO;
    
    Patient *patient5 = [[Patient alloc] init];
    patient5.name = @"Екатерина";
    patient5.temperature = 36.6f;
    patient5.shivering = arc4random() % 2;
    patient5.headAche = YES;
    patient5.stomachAche = NO;
    patient5.footAche = NO;
    
    
    Patient *patient6 = [[Patient alloc] init];
    patient6.name = @"Дарья";
    patient6.temperature = 37.5f;
    patient6.shivering = arc4random() % 2;
    patient6.headAche = NO;
    patient6.stomachAche = NO;
    patient6.footAche = YES;
    
    Patient *patient7 = [[Patient alloc] init];
    patient7.name = @"Олег";
    patient7.temperature = 40.1f;
    patient7.shivering = arc4random() % 2;
    patient7.headAche = NO;
    patient7.stomachAche = YES;
    patient7.footAche = NO;
    
    Patient *patient8 = [[Patient alloc] init];
    patient8.name = @"Арсен";
    patient8.temperature = 38.6f;
    patient8.shivering = arc4random() % 2;
    patient8.headAche = NO;
    patient8.stomachAche = NO;
    patient8.footAche = YES;
    
    Patient *patient9 = [[Patient alloc] init];
    patient9.name = @"Иван";
    patient9.temperature = 39.9f;
    patient9.shivering = arc4random() % 2;
    patient9.headAche = YES;
    patient9.stomachAche = NO;
    patient9.footAche = NO;
    
    Patient *patient10 = [[Patient alloc] init];
    patient10.name = @"Джонатан";
    patient10.temperature = 39.7f;
    patient10.shivering = arc4random() % 2;
    patient10.headAche = NO;
    patient10.stomachAche = NO;
    patient10.footAche = YES ;
    
    
    patient1.delegate = doctor;
    patient2.delegate = doctor;
    patient3.delegate = doctor;
    patient4.delegate = doctor;
    patient5.delegate = doctor;
    patient6.delegate = doctor;
    patient7.delegate = friendDoctor1;
    patient8.delegate = friendDoctor2;
    patient9.delegate = friendDoctor1;
    patient10.delegate = friendDoctor2;
    NSArray *array = [[NSArray alloc] initWithObjects:patient1,patient2,patient3,patient4,patient5,patient6,patient7,patient8,patient9,patient10, nil];
    
    for (Patient *patient in array) {
        [self patientAsk:patient isFellsBed:[patient fellsBetter]];
    }
    
    NSString *firstKey = @"priority";
    NSString *key = @"obj";
    NSMutableArray *arrayAllDict;
    for (Patient *obj in array) {
        NSDictionary *mDictPatient;
        if(obj.headAche)
        {
            mDictPatient = [[NSDictionary alloc] initWithObjectsAndKeys:obj,key,@"1",firstKey, nil];
        }
        if(obj.stomachAche)
        {
            mDictPatient = [[NSDictionary alloc] initWithObjectsAndKeys:obj,key,@"2",firstKey, nil];
        }
        if(obj.footAche)
        {
            mDictPatient = [[NSDictionary alloc] initWithObjectsAndKeys:obj,key,@"3",firstKey, nil];
        }
        
        if(!arrayAllDict)
        {
            arrayAllDict = [[NSMutableArray alloc] init];
        }
        
        [arrayAllDict addObject:mDictPatient];
    }
    
    
    
    NSSortDescriptor *firstDescriptor =
    [[NSSortDescriptor alloc] initWithKey:firstKey
                                ascending:YES
                                 selector:@selector(localizedCaseInsensitiveCompare:)];
    
    NSArray *descriptors = [NSArray arrayWithObjects:
                            firstDescriptor, nil];
    
    NSArray * sortedArray;
    sortedArray = [arrayAllDict sortedArrayUsingDescriptors:descriptors];
    
    NSLog(@"Пациенты доктора:");
    Doctor *newDoctor = [[Doctor alloc] init];
    newDoctor.name = @"Новый доктор";
    [self report:sortedArray isDoctor:true newDoctor:newDoctor];
    
    NSLog(@"Пациенты друга доктора:");
    [self report:sortedArray isDoctor:false newDoctor:newDoctor];
    
    for (NSDictionary *patientDict in sortedArray)
    {
        Patient *patient = [patientDict objectForKey:@"obj"];
        
        if(!patient.goodGradeDoctor)
        {
            id currentDoctor = patient.delegate;
            if([currentDoctor isKindOfClass:[FriendDoctor class]])
            {
                NSLog(@"Пациенту %@ не поменяли доктора", patient.name);
            }
            else
            {
                Doctor *doctor = (Doctor*)currentDoctor;
                if(!doctor.name)
                {
                    NSLog(@"Пациенту %@ не поменяли доктора", patient.name);
                }
                else
                {
                    NSLog(@"Пациенту %@ назначили нового доктора", patient.name);
                }
                
            }
        }
        else
        {
            NSLog(@"Пациент %@ довольна работой доктора", patient.name);
        }
    }

    
    // Override point for customization after application launch.
    return YES;
}

#pragma mark -Metods-

- (void)patientAsk:(Patient*)patient isFellsBed:(BOOL)isFellsBed{
    if(isFellsBed){
        NSLog(@"у пациента %@ плохое самочувствие",patient.name);
    }
    else
    {
        NSLog(@"у пациента %@  хорошее самочувствие",patient.name);
    }

}


-(void)report:(NSArray*)arraySortPatient isDoctor:(BOOL) isDoctor newDoctor:(id)newDoctor{
    for (NSDictionary *dict in arraySortPatient)
    {
        Patient *patient = [dict objectForKey:@"obj"];
        id currentObj = patient.delegate;
        if(isDoctor)
        {
            if(![currentObj isKindOfClass:[Doctor class]])
            {
                continue;
            }
            if (!patient.goodGradeDoctor)
            {
                patient.delegate = (Doctor*)newDoctor;
            }
        }
        else
        {
            if(![currentObj isKindOfClass:[FriendDoctor class]])
            {
                continue;
            }
            
            if (!patient.goodGradeDoctor)
            {
                patient.delegate = (Doctor*)newDoctor;
            }
        }
        
        if(patient.headAche)
        {
            NSLog(@"У пациента %@ болела голова", patient.name);
        }
        
        if(patient.stomachAche)
        {
            NSLog(@"У пациента %@ болел живот", patient.name);
        }
        
        if(patient.footAche)
        {
            NSLog(@"У пациента %@ болела нога", patient.name);
        }
    }
}




@end
