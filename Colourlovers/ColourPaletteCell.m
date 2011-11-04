//
//  ColourPaletteCell.m
//  Colourlovers
//
//  Created by Andrew Griffiths on 3/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "ColourPaletteCell.h"
#import "ColourPalette.h"

@implementation ColourPaletteCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        paletteView = nil;
    }
    return self;
}


-(void) setPalette:(ColourPalette*)palette {
    // remove any old colour palette views if found
    [paletteView removeFromSuperview];
    paletteView = nil;
    
    // add a new view to display the colour
    paletteView = [[ColourPaletteView alloc] initWithFrame:self.bounds];
    [paletteView setPalette:palette];
    [self addSubview:paletteView];
}

@end
