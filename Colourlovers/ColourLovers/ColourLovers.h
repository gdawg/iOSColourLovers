//
//  ColourLovers.h
//  Colourlovers
//
//  Created by Andrew Griffiths on 3/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ColourPalette.h"	

@interface ColourLovers : NSObject

+(ColourLovers *)instance;

-(void) loadPalettes:(void (^)(NSArray* palettes))block;

@end
