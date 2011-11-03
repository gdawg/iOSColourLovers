//
//  ColoursTableVc.m
//  Colourlovers
//
//  Created by Andrew Griffiths on 3/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "ColoursTableVc.h"
#import "ColourPaletteCell.h"

#import "ColourLovers.h"

@implementation ColoursTableVc
@synthesize palettes=_palettes;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        self.tableView.allowsSelection = NO;
        self.title = @"thx to colourlovers.com";
        self.palettes = nil;
    }
    return self;
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    // for the demo we load the new set because it's more interesting than just the top list
    [[ColourLovers instance] loadPalettesOfType:ColourPaletteTypeNew success:^(NSArray *palettes) {
        self.palettes = palettes;
        [self.tableView reloadData];
    }];
    
    // the following would load the top 20 instead
    /*
    [[ColourLovers instance] loadPalettes:^(NSArray *palettes) {
        self.palettes = palettes;
        [self.tableView reloadData];
    }];
    */

    // there's also more specialised methods to do paged loads, newest etc.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.palettes) {
        return self.palettes.count;
    }
    
    // until we've loaded some we just return no rows
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"colour.palettes.cell";
    
    ColourPaletteCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[ColourPaletteCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    ColourPalette* palette = [self.palettes objectAtIndex:indexPath.row];
    [cell setPalette:palette];
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
}

@end
