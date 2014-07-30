//
//  MarcaViewController.m
//  Prototipo NomiaMundi
//
//  Created by Gabriel Moraes on 22/07/14.
//  Copyright (c) 2014 Gabriel Moraes. All rights reserved.
//

#import "MarcaViewController.h"
#import "TouchImageView.h"

@interface MarcaViewController ()
{
    TouchImageView *touch;
}
@end

@implementation MarcaViewController
@synthesize label01, label02, texto01, texto02;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [[PList save] carregando];
    }
    return self;
}

- (void)setTIV:(TouchImageView*)tiv
{
    touch = tiv;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [texto01 setDelegate:self];
    [texto02 setDelegate:self];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated {

    int x, y;
    //[[self label01] setText:[[PList save] label01]];
    //[[self label02] setText:[[PList save] label02]];
    
    if ([[touch tags01] count] > 0) {
        x = [[touch tags01] count] - 1;
    } else {
        x = 0;
    }
    
    if ([[touch tags02] count] > 0) {
        y = [[touch tags02] count] - 1;
    } else {
        y = 0;
    }
    
    [[self label01] setText:[NSString stringWithFormat:@"%@", [touch.tags01 objectAtIndex:x]]];
    [[self label02] setText:[NSString stringWithFormat:@"%@", [touch.tags02 objectAtIndex:y]]];
    
}

- (IBAction)Salvar:(id)sender {
    NSString *lingua01 = texto01.text;
    NSString *lingua02 = texto02.text;
    
    label01.text = lingua01;
    label02.text = lingua02;
    
    [[touch tags01] addObject:lingua01];
    [[touch tags02] addObject:lingua02];
    
//    [[PList save] setLabel01:[[self texto01] text]];
//    [[PList save] setLabel02:[[self texto02] text]];
    
    [[PList save] salvando];
}

- (IBAction)voltar:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)BackgroundTap:(id)sender {
    [self.view endEditing:YES];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

@end





































