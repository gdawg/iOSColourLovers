//
//  ColourPaletteView.m
//  Colourlovers
//
//  Created by Andrew Griffiths on 4/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "ColourPaletteView.h"
#import "ColourPalette.h"

@implementation ColourPaletteView
@synthesize colors=_colors;
@synthesize title=_title;

-(id) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        colorLabel = nil;
        colorViews = nil;
        self.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    }
    return self;
}

-(void) layoutSubviews {
    [super layoutSubviews];
    
    // setup subviews of this cell if necessary
    if (!colorLabel) {
        // add the label cell
        colorLabel = [[UILabel alloc] initWithFrame:CGRectMake(8, 1, self.bounds.size.width - 16, 16)];
        colorLabel.backgroundColor = [UIColor clearColor];
        colorLabel.font = [UIFont boldSystemFontOfSize:13.0];
        colorLabel.textColor = [UIColor colorWithWhite:0.4 alpha:1.0];
        colorLabel.textAlignment = UITextAlignmentLeft;
        colorLabel.text = self.title;
        [self addSubview:colorLabel];
    }
    
    if (!colorViews) {
        // add colour display views
        float x = 16.0;
        float blockSize = 18.0;
        float padding = 8.0;
        int idx = 0;
        colorViews = [[NSMutableArray alloc] init];
        for (UIColor* color in self.colors) {
            UIView* colourView = [[UIView alloc] initWithFrame:CGRectMake(x, 21, blockSize, blockSize)];
            colourView.backgroundColor = [self.colors objectAtIndex:idx];
            [self addSubview:colourView];
            [colorViews addObject:colourView];
            x += (blockSize + padding);
            idx++;
        }
    }
}

-(void) setPalette:(ColourPalette*)palette {
    for (UIView* colourView in colorViews) {
        [colourView removeFromSuperview];
    }
    
    self.colors = palette.colors;
    self.title = palette.title;
    
    colorViews = nil;
    [self setNeedsLayout];
}



@end
