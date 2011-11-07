//
//  ColourLovers.m
//  Colourlovers
//
//  Created by Andrew Griffiths on 3/11/11.
//  Copyright (c) 2011 Mad Dog Software. All rights reserved.
//

#import "ColourLovers.h"

#import "AFJSONRequestOperation.h"

@implementation ColourLovers

static const int kColourLoversDefaultPageSize = 20;

// get the api object instance
+(ColourLovers *)instance {
    static dispatch_once_t pred;
    static ColourLovers *shared = nil;
    
    dispatch_once(&pred, ^{
        shared = [[ColourLovers alloc] init];
    });
    return shared;
}

// routines taken from the excellent UIColor+Expanded library and inline for
// convenience of end users (so they don't have to download that library too)
+(UIColor *)colorWithRGBHex:(UInt32)hex {
	int r = (hex >> 16) & 0xFF;
	int g = (hex >> 8) & 0xFF;
	int b = (hex) & 0xFF;
	
	return [UIColor colorWithRed:r / 255.0f
						   green:g / 255.0f
							blue:b / 255.0f
						   alpha:1.0f];
}

// Returns a UIColor by scanning the string for a hex number and passing that to +[UIColor colorWithRGBHex:]
// Skips any leading whitespace and ignores any trailing characters
+(UIColor *)colorWithHexString:(NSString *)stringToConvert {
	NSScanner *scanner = [NSScanner scannerWithString:stringToConvert];
	unsigned hexNum;
	if (![scanner scanHexInt:&hexNum]) return nil;
	return [ColourLovers colorWithRGBHex:hexNum];
}



-(void) loadPalettes:(void (^)(NSArray* palettes))success {
    [self loadPalettesOfType:ColourPaletteTypeTop success:success];
}
-(void) loadPalettesOfType:(ColourPaletteType)type success:(void (^)(NSArray* palettes))success {
    [self loadPalettesOfType:type withNumber:kColourLoversDefaultPageSize andOffset:0 success:success];
}
-(void) loadPalettesOfType:(ColourPaletteType)type withNumber:(int)numResults andOffset:(int)offset success:(void (^)(NSArray* palettes))success {
    NSString* urlString = @"http://www.colourlovers.com/api/palettes/";
    switch (type) {
        case ColourPaletteTypeTop:
            urlString = [urlString stringByAppendingString:@"top"];
            break;
            
        case ColourPaletteTypeNew:
            urlString = [urlString stringByAppendingString:@"new"];
            break;
            
        case ColourPaletteTypeRandom:
            urlString = [urlString stringByAppendingString:@"random"];
            break;
            
        default:
            break;
    }
    urlString = [urlString stringByAppendingString:@"?format=json"];
    
    // the api only allows loading one random colour at a time, no offset
    if (type != ColourPaletteTypeRandom) {
        urlString = [urlString stringByAppendingFormat:@"&numResults=%d",numResults];
        urlString = [urlString stringByAppendingFormat:@"&resultOffset=%d",offset];
    }
    
    NSLog(@"loading colours at url %@",urlString);
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        NSMutableArray* parsed = [[NSMutableArray alloc] init];
        for (id node in JSON) {
            ColourPalette* palette = [[ColourPalette alloc] init];
            
            // parse basic properties
            palette.remoteId = [node valueForKeyPath:@"id"];
            palette.title = [node valueForKeyPath:@"title"];
            palette.user = [node valueForKeyPath:@"userName"];
            palette.url = [node valueForKeyPath:@"url"];
            
            // parse the colours as string and into a UIColor
            NSMutableArray* hexColors = [[NSMutableArray alloc] init];
            NSMutableArray* colors = [[NSMutableArray alloc] init];
            for (NSString* colorHex in [node valueForKeyPath:@"colors"]) {
                [hexColors addObject:colorHex];
                [colors addObject:[ColourLovers colorWithHexString:colorHex]];
            }
            palette.hexColors = hexColors;
            palette.colors = colors;
            
            [parsed addObject:palette];
        }
        
        // notify the caller of our success and send the list of colours along
        success(parsed);
        
    } failure:nil];
    
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [queue addOperation:operation];
}


@end
