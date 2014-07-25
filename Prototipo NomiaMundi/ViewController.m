//
//  ViewController.m
//  Prototipo NomiaMundi
//
//  Created by Gabriel Moraes on 03/07/14.
//  Copyright (c) 2014 Gabriel Moraes. All rights reserved.
//

#import "ViewController.h"
#import "MarcaViewController.h"
#import "TouchImageView.h"


@interface ViewController ()
{
    NSMutableArray* imagens;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
	[super viewDidLoad];
	int rows = 3, columns = 3, images = 0;
	CGSize blockSize = CGSizeMake(self.view.frame.size.width / columns,
								  self.view.frame.size.height / rows);
    
    blockImage2 = [[NSMutableArray alloc] init];
    blockImage2 = [NSMutableArray arrayWithObjects:
                   [UIImage imageNamed:@"Image.jpg"],
                   [UIImage imageNamed:@"Image02.jpg"],
                   [UIImage imageNamed:@"Image03.jpg"],
                   [UIImage imageNamed:@"Image04.jpg"],
                   [UIImage imageNamed:@"Image05.jpg"],
                   [UIImage imageNamed:@"Image06.jpg"],
                   [UIImage imageNamed:@"Image07.jpg"],
                   [UIImage imageNamed:@"Image08.jpg"],
                   [UIImage imageNamed:@"Image09.jpg"], nil];
    
    imagens = [[NSMutableArray alloc] init];
    
        for (int y = 0; y < rows; y++) {
            for (int x = 0; x < columns; x++) {
                CGPoint blockOrigin = CGPointMake(x * blockSize.width, y * blockSize.height);
                CGRect blockFrame;
                blockFrame.size = blockSize;
                blockFrame.origin = blockOrigin;
                TouchImageView *tiv = [[TouchImageView alloc] initWithFrame:blockFrame];
                [[tiv internal] setImage:blockImage2[images]];
                [self.view addSubview:tiv];
                [imagens addObject:tiv];
                images++;
            }
        }
    
    UILongPressGestureRecognizer *lpGR = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(lp:)];
    [self.view addGestureRecognizer:lpGR];
    
//    for (int z = 0; z < 9; z++) {
//        if (imagens[z]) {
//            <#statements#>
//        }
//    }
    
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)lp:(UILongPressGestureRecognizer *)recognizer
{
    for (TouchImageView *t in imagens) {
        if ([t GetFull] == YES) {
            MarcaViewController *marca = [[MarcaViewController alloc] init];
            [self presentViewController: marca animated:YES completion:nil];
        }
    }
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

@end








































