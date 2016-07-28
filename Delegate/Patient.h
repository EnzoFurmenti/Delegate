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
@property (nonatomic, weak) id <PatientDelegate> delegate;


- (BOOL) fellsBetter;
- (void) takePill;
- (void) makeShot;

@end


@protocol PatientDelegate

- (void) patientFeelsBad: (Patient*)patient;
@optional
- (void) patient:(Patient*) patient hasQuestion:(NSString*) question;


@end
