//
//  Patient.h
//  Delegate
//
//  Created by EnzoF on 28.07.16.
//  Copyright © 2016 EnzoF. All rights reserved.
//

#import <Foundation/Foundation.h>

/* Не определяется тип CGFloat */
#import <CoreGraphics/CGBase.h>

@protocol PatientDelegate;

@interface Patient : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) CGFloat temperature;
@property (nonatomic, assign) BOOL shivering;
@property (nonatomic, assign) BOOL headAche;
@property (nonatomic, assign) BOOL stomachAche;
@property (nonatomic, assign) BOOL footAche;
@property (nonatomic, assign) BOOL goodGradeDoctor;

@property (nonatomic, weak) id <PatientDelegate> delegate;


- (BOOL) fellsBetter;
- (void) takePill;
- (void) makeShot;
- (void) takePillForHead;
- (void) massage;
- (void) takePillForStomach;

@end


@protocol PatientDelegate

- (void) patientFeelsBad: (Patient*)patient;
@optional
- (void) patient:(Patient*) patient hasQuestion:(NSString*) question;


@end
