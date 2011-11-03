//
//  ColourPalette.h
//  Colourlovers
//
//  Created by Andrew Griffiths on 3/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

// As of 2/11/2011 the API returns these:
//
//"id": 92095,
//"title": "Giant Goldfish",
//"userName": "manekineko",
//"numViews": 255687,
//"numVotes": 4011,
//"numComments": 532,
//"numHearts": 4.5,
//"rank": 1,
//"dateCreated": "2007-07-03 10:42:02",
//"colors": [
//           
//           "69D2E7",
//           "A7DBD8",
//           "E0E4CC",
//           "F38630",
//           "FA6900"
//           
//           ],
//"description": "",
//"url": "http://www.colourlovers.com/palette/92095/Giant_Goldfish",
//"imageUrl": "http://www.colourlovers.com/paletteImg/69D2E7/A7DBD8/E0E4CC/F38630/FA6900/Giant_Goldfish.png",
//"badgeUrl": "http://www.colourlovers.com/images/badges/p/92/92095_Giant_Goldfish.png",
//"apiUrl": "http://www.colourlovers.com/api/palette/92095

// we're currently only parsing some of the above as needed

@interface ColourPalette : NSObject

@property (nonatomic,strong) NSString* remoteId;
@property (nonatomic,strong) NSString* title;
@property (nonatomic,strong) NSString* user;
@property (nonatomic,strong) NSString* url;
@property (nonatomic,strong) NSArray*  hexColors;
@property (nonatomic,strong) NSArray*  colors;

@property (nonatomic,strong) NSString* rawJson;

@end
