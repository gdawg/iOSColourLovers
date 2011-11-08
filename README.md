# iOSColourLovers

### iOS / Objective C library for interfacing with colourLovers.com

The site at http://www.colourlovers.com hosts a great community of artist colour palettes and more.
This library allows you to access the colour palettes in an iPhone or iPad app.

Please note that the ColourLovers API is available for non commercial products. They may have a 
commercial api available shortly.

### Dependencies:
This library depends on networking from the excellent AFNetworking library.

Once you check out the project you can add appropriate git submodules by changing
to the project directory and running

    git submodule add https://github.com/gowalla/AFNetworking.git thirdparty/AFNetworking
    git submodule init thirdparty/AFNetworking
    git submodule update thirdparty/AFNetworking
    git submodule add https://github.com/johnezang/JSONKit thirdparty/JSONKit
    git submodule init thirdparty/JSONKit
    git submodule update thirdparty/JSONKit


### Using the library:

NOTE: It's assumed you're using ARC (automatic reference counting) for this library.

Loading colours should be as easy as calling the api and passing a block to handle the callback once
colours have loaded:

    [[ColourLovers instance] loadPalettesOfType:ColourPaletteTypeNew success:^(NSArray *palettes) {
        self.palettes = palettes;
        [self.tableView reloadData];
    }];

The code above comes from the example provided (in the file ColoursTableVc). 

### Other
There's also other options for calling the library which allow you to load the top palettes, page the list etc.
Please see the source for this, it's not too complicated.
