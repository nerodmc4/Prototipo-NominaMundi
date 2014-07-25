//
//  PList.m
//  Prototipo NomiaMundi
//
//  Created by Gabriel Moraes on 25/07/14.
//  Copyright (c) 2014 Gabriel Moraes. All rights reserved.
//

#import "PList.h"

@implementation PList

+ (PList *)save {
    static PList *save = nil;
    if (!save) {
        save = [[super alloc] init];
    }
    return save;
}

- (void) salvando {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *filePath = [[paths objectAtIndex:0] stringByAppendingString:@"/Tags.plist"];
    NSMutableDictionary *myMutableDictionary = [[NSMutableDictionary alloc] init];
	NSString *errorDesc;
    
    [myMutableDictionary setObject:[self label01] forKey:@"Lingua01"];
    [myMutableDictionary setObject:[self label02] forKey:@"Lingua02"];
    
    NSLog(@"Dicionario montado:%@",myMutableDictionary);
	
	NSData *mutableData = [NSPropertyListSerialization dataFromPropertyList:myMutableDictionary format:NSPropertyListXMLFormat_v1_0 errorDescription:&errorDesc];
	
	if(mutableData){
		[mutableData writeToFile:filePath atomically:YES];
	}
    NSLog(@"Alteracoes salvas!");
}

- (void) carregando{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *filePath = [[paths objectAtIndex:0] stringByAppendingString:@"/Tags.plist"];
	NSString *pListPath;
    
    if([[NSFileManager defaultManager] fileExistsAtPath:filePath])
		pListPath = filePath;
    else
		pListPath = [[NSBundle mainBundle] pathForResource:@"Tags" ofType:@"plist"];
	
	NSString *errorDesc;
	
	NSPropertyListFormat format;
	
	NSData *dataPlist = [[NSFileManager defaultManager] contentsAtPath:pListPath];
	
	NSDictionary *NM = [NSPropertyListSerialization propertyListFromData:dataPlist mutabilityOption:NSPropertyListMutableContainersAndLeaves format:&format errorDescription:&errorDesc];
    
    if(!NM) {
		NSLog(@"Error:%@",errorDesc);
    } else {
		NSLog(@"Dicionario armazenado:%@", NM);
    }
    
    if ([NM valueForKey:@"Lingua01"]) {
        [self setLabel01:[NM valueForKey:@"Lingua01"]];
    } else {
        [self setLabel01:@""];
    }
    
    if ([NM valueForKey:@"Lingua02"]) {
        [self setLabel02:[NM valueForKey:@"Lingua02"]];
    } else {
        [self setLabel02:@""];
    }
    
}

@end




































