//
//  TouchImageView.m
//  Prototipo NomiaMundi
//
//  Created by Gabriel Moraes on 03/07/14.
//  Copyright (c) 2014 Gabriel Moraes. All rights reserved.
//

#import "TouchImageView.h"

@implementation TouchImageView

- (UIImageView *)internal {
	return internal;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _tags01 = [[NSMutableArray alloc] init];
        _tags02 = [[NSMutableArray alloc] init];
        
        [_tags01 addObject:@"Editável"];
        [_tags02 addObject:@"Editável"];
        
        internal = [[UIImageView alloc] initWithFrame:self.bounds];
		[internal setBackgroundColor:[UIColor blackColor]];
		[internal setContentMode:UIViewContentModeScaleAspectFit];
        [self addSubview:internal];
    }
    
    return self;
}

+ (TouchImageView *)sharedTIV
{
    static TouchImageView* sharedTIV = nil;
    if (!sharedTIV) {
        sharedTIV = [[super alloc] init];
    }
    return sharedTIV;
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
	if (touch.tapCount == 2) {
        if (Full) [self Pequeno];
        else [self Cheio];
    }
}

- (void)Cheio {
	[[self superview] bringSubviewToFront:self];
	Full = YES;
	CGRect largeFrame = [self superview].bounds;
	original = self.frame;
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:0.5];
	[self setFrame:largeFrame];
	[internal setFrame:self.bounds];
	[UIView commitAnimations];
	
}
- (void)Pequeno {
	Full = NO;
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:0.5];
	[self setFrame:original];
	[internal setFrame:self.bounds];
	[UIView commitAnimations];
	
}

- (BOOL)GetFull {
    return Full;
}

@end
