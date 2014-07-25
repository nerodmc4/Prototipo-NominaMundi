//
//  TouchImageView.h
//  Prototipo NomiaMundi
//
//  Created by Gabriel Moraes on 03/07/14.
//  Copyright (c) 2014 Gabriel Moraes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TouchImageView : UIView {
	UIImageView * internal;
	CGRect original;
	BOOL Full;
}

+ (TouchImageView *)sharedTIV;
- (UIImageView *)internal;
- (void)Cheio;
- (void)Pequeno;
- (BOOL)GetFull;

@end
