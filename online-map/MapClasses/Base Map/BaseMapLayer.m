//
//  BaseMapLayer.m
//  RDMapApp
//
//  Created by 李明杨 on 14-4-13.
//  Copyright (c) 2014年 李明杨. All rights reserved.
//

#import "BaseMapLayer.h"
#import "MapTileOperation.h"

int MakeAGSUnits(NSString* wkt){
	NSString* value ;
	BOOL _continue = YES;
 	NSScanner* scanner = [NSScanner scannerWithString:wkt];
	//Scan for the UNIT information in WKT.
	//If WKT is for a Projected Coord System, expect two instances of UNIT, and use the second one
	while (_continue) {
		[scanner scanUpToString:@"UNIT[\"" intoString:NULL];
		[scanner setCharactersToBeSkipped:[NSCharacterSet characterSetWithCharactersInString:@"UNIT[\""]];
		_continue = [scanner scanUpToString:@"\"" intoString:&value];
	}
	if([@"Foot_US" isEqualToString:value] || [@"Foot" isEqualToString:value]){
		return AGSUnitsFeet;
	}else if([@"Meter" isEqualToString:value]){
		return AGSUnitsMeters;
	}else if([@"Degree" isEqualToString:value]){
		return AGSUnitsDecimalDegrees;
	}else{
		 
		return -1;
	}
}


@implementation BaseMapLayer

-(AGSUnits)units{
	return _units;
}

-(AGSSpatialReference *)spatialReference{
	return _fullEnvelope.spatialReference;
}

-(AGSEnvelope *)fullEnvelope{
	return _fullEnvelope;
}

-(AGSEnvelope *)initialEnvelope{
	//Assuming our initial extent is the same as the full extent
	return _fullEnvelope;
}

-(AGSTileInfo*) tileInfo{
	return _tileInfo;
}
//#pragma mark -

-(id)initWithMapSchema:(id<BaseMapSchema>) baseMapSchema baseurl:(NSString*) baseurl
{
    
    
    _mapurl=baseurl;
    _mapTag = baseMapSchema.mapTag;
    _units = AGSUnitsDecimalDegrees;
    
    
	id<BaseMapSchema> shema = baseMapSchema;
	_tileInfo = shema.tileInfo ;

	_fullEnvelope = shema.fullEnvelope;
    _initExtent = shema.fullEnvelope;
    [shema release];
	[self layerDidLoad];
	return self;
	
}
- (NSOperation<AGSTileOperation>*) retrieveImageAsyncForTile:(AGSTile *) tile{
    
	MapTileOperation *operation =
	[[MapTileOperation alloc] initWithTile:tile
										target:self 
                                    action:@selector(didFinishOperation:)
     baseurl:_mapurl maptag:_mapTag];
    [super.operationQueue addOperation:operation];
    [super.operationQueue setMaxConcurrentOperationCount:8];
    
    return [operation autorelease];
}

- (void) didFinishOperation:(NSOperation<AGSTileOperation>*)op {
	//If tile was found ...
	if (op.tile.image!=nil) {
		//... notify tileDelegate of success
		[self.tileDelegate tiledLayer:self operationDidGetTile:op];
	}else {
		//... notify tileDelegate of failure
		[self.tileDelegate tiledLayer:self operationDidFailToGetTile:op];
		//NSLog([NSString stringWithFormat:@"faildop"]);
	}
}

#pragma mark -
- (void)dealloc {

    [_initExtent release];
    [_fullEnvelope release];
    [_tileInfo release];
    [super dealloc];
}




@end
