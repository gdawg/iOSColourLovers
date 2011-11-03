//
//  ColourPaletteCell.h
//  Colourlovers
//
//  Created by Andrew Griffiths on 3/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ColourPalette;

@interface ColourPaletteCell : UITableViewCell {
    UILabel* colorLabel;
    NSMutableArray* colorViews;
}
    
@property (nonatomic,strong) NSArray* colors;
@property (nonatomic,strong) NSString* title;

-(void) setPalette:(ColourPalette*)palette;

@end
