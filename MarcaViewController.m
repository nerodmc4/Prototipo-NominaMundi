//
//  MarcaViewController.m
//  Prototipo NomiaMundi
//
//  Created by Gabriel Moraes on 22/07/14.
//  Copyright (c) 2014 Gabriel Moraes. All rights reserved.
//

#import "MarcaViewController.h"

@interface MarcaViewController ()

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

    [[self label01] setText:[[PList save] label01]];
    [[self label02] setText:[[PList save] label02]];
    
}

- (IBAction)Salvar:(id)sender {
    NSString *lingua01 = texto01.text;
    NSString *lingua02 = texto02.text;
    
    label01.text = lingua01;
    label02.text = lingua02;
    
    [[PList save] setLabel01:[[self texto01] text]];
    [[PList save] setLabel02:[[self texto02] text]];
    
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





































