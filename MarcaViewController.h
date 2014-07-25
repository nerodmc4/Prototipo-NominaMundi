//
//  MarcaViewController.h
//  Prototipo NomiaMundi
//
//  Created by Gabriel Moraes on 22/07/14.
//  Copyright (c) 2014 Gabriel Moraes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PList.h"

@interface MarcaViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UILabel *label01;

@property (weak, nonatomic) IBOutlet UILabel *label02;

@property (strong, nonatomic) IBOutlet UITextField *texto01;

@property (strong, nonatomic) IBOutlet UITextField *texto02;

- (IBAction)Salvar:(id)sender;

- (IBAction)voltar:(id)sender;

- (IBAction)BackgroundTap:(id)sender;

@end

























