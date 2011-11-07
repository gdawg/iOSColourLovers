//
//  ColourPaletteView.h
//  Colourlovers
//
//  Created by Andrew Griffiths on 4/11/11.
//  Copyright (c) 2011 Mad Dog Software. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ColourPalette;

@interface ColourPaletteView : UIView {
    UILabel* colorLabel;
    NSMutableArray* colorViews;
}

@property (nonatomic,strong) NSArray* colors;
@property (nonatomic,strong) NSString* title;

-(void) setPalette:(ColourPalette*)palette;

@end
