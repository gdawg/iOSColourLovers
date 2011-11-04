//
//  ColourPaletteCell.h
//  Colourlovers
//
//  Created by Andrew Griffiths on 3/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ColourPaletteView.h"

@interface ColourPaletteCell : UITableViewCell {
    ColourPaletteView* paletteView;
}
    
-(void) setPalette:(ColourPalette*)palette;

@end
