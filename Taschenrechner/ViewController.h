//
//  ViewController.h
//  Taschenrechner
//
//  Created by Carsten Greif on 27.12.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *anzeige;
@property (assign, nonatomic) BOOL benutzerTipptGerade;
@property (assign, nonatomic) NSInteger wartendeZahl;
@property (strong, nonatomic) NSString *wartendeOperation;

- (IBAction)zahlGedrueckt:(id)sender;

- (IBAction)operationGedrueckt:(id)sender;

-(NSString*) berechne: (NSString*) operation mitDerZahl: (NSInteger) zahl;

@end
