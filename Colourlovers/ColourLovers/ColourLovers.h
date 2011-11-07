//
//  ColourLovers.h
//  Colourlovers
//
//  Created by Andrew Griffiths on 3/11/11.
//  Copyright (c) 2011 Mad Dog Software. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ColourPalette.h"	

typedef enum {
    ColourPaletteTypeNew,
    ColourPaletteTypeTop,
    ColourPaletteTypeRandom
} ColourPaletteType;

@interface ColourLovers : NSObject

+(ColourLovers *)instance;

// loads the top 20 palettes with default options
-(void) loadPalettes:(void (^)(NSArray* palettes))block;
-(void) loadPalettesOfType:(ColourPaletteType)type success:(void (^)(NSArray* palettes))block;
-(void) loadPalettesOfType:(ColourPaletteType)type withNumber:(int)numResults andOffset:(int)offset success:(void (^)(NSArray* palettes))block;

@end
