//
//  PList.h
//  Prototipo NomiaMundi
//
//  Created by Gabriel Moraes on 25/07/14.
//  Copyright (c) 2014 Gabriel Moraes. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PList : NSObject

@property (nonatomic, strong) NSString *label01;
@property (nonatomic, strong) NSString *label02;

+ (PList *)save;
- (void) salvando;
- (void) carregando;

@end
