//
//  ViewController.m
//  Taschenrechner
//
//  Created by Carsten Greif on 27.12.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize anzeige;
@synthesize benutzerTipptGerade = _benutzerTipptGerade;
@synthesize wartendeZahl = _wartendeZahl;
@synthesize wartendeOperation = _wartendeOperation;

- (NSString*) berechne: (NSString*) operation mitDerZahl: (NSInteger) zahl
{
    if([operation isEqualToString:@"C"])
    {
        return @"0";
    } else if ([operation isEqualToString:@"AC"])
    {
        self.wartendeZahl = 0;
        self.wartendeOperation = nil;
        return @"0";
    } else if ([self.wartendeOperation isEqualToString:@"+"])
    {
        zahl = self.wartendeZahl + zahl;
    }else if ([self.wartendeOperation isEqualToString:@"-"])
    {
        zahl = self.wartendeZahl - zahl;
    }else if ([self.wartendeOperation isEqualToString:@"*"])
    {
        zahl = self.wartendeZahl * zahl;
    }else if ([self.wartendeOperation isEqualToString:@"/"])
    
        if(zahl!=0){
        zahl = self.wartendeZahl / zahl;
        } else {
            NSLog(@"Division durch Null");
            return @"Fehler";
        }
    self.wartendeZahl = zahl;
    self.wartendeOperation = operation;
    return [NSString stringWithFormat:@"%d", zahl];
    //return nil;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setAnzeige:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)zahlGedrueckt:(id)sender {
     if (self.benutzerTipptGerade == NO)
     {
        self.anzeige.text = @"";
         self.benutzerTipptGerade = YES;
         
     }
    self.anzeige.text = [self.anzeige.text stringByAppendingFormat:[sender currentTitle]];
    
    
}

- (IBAction)operationGedrueckt:(id)sender {
    
    self.benutzerTipptGerade = NO;
    self.anzeige.text = [self berechne:[sender currentTitle] mitDerZahl:[self.anzeige.text intValue]];
    
}
@end
