//
//  BaiduMapSchema.m
//  RDMapApp
//
//  Created by 李明杨 on 14-4-13.
//  Copyright (c) 2014年 李明杨. All rights reserved.
//

#import "BaiduMapSchema.h"


@implementation BaiduMapSchema



-(id) init
{
	[super init];
    _mapTag = @"baidu";
 	self.spatialReference = [[AGSSpatialReference alloc] initWithWKID:102113 WKT:nil];

    self.fullEnvelope = [[AGSEnvelope alloc] initWithXmin:-15998201.815134
                                                     ymin:217294.044439
                                                     xmax:-9700428.502114
                                                     ymax:4940624.029204
                                         spatialReference:self.spatialReference];
	NSMutableArray *lods = [NSMutableArray arrayWithObjects:
                         
                          [[AGSLOD alloc] initWithLevel:2 resolution:39135.7584819998 scale: 147914381.897888],
                            [[AGSLOD alloc] initWithLevel:3 resolution:19567.8792409999 scale: 73957190.948944],
                            [[AGSLOD alloc] initWithLevel:4 resolution:9783.93962049996 scale: 36978595.474472],
                            [[AGSLOD alloc] initWithLevel:5 resolution:4891.96981024998 scale: 18489297.737236],
                            [[AGSLOD alloc] initWithLevel:6 resolution:2445.98490512499 scale: 9244648.868618],
                            [[AGSLOD alloc] initWithLevel:7 resolution:1222.99245256249 scale: 4622324.434309],
                            [[AGSLOD alloc] initWithLevel:8 resolution:611.49622628138 scale: 2311162.217155],
                            [[AGSLOD alloc] initWithLevel:9 resolution:305.748113140558 scale: 1155581.108577],
                            [[AGSLOD alloc] initWithLevel:10 resolution:152.874056570411 scale: 577790.554289],
                            [[AGSLOD alloc] initWithLevel:11 resolution:76.4370282850732 scale: 288895.277144],
                            [[AGSLOD alloc] initWithLevel:12 resolution:38.2185141425366 scale: 144447.638572],
                            [[AGSLOD alloc] initWithLevel:13 resolution:19.1092570712683 scale: 72223.819286],
                            [[AGSLOD alloc] initWithLevel:14 resolution:9.55462853563415 scale: 36111.909643],
                            [[AGSLOD alloc] initWithLevel:15 resolution:4.77731426794937 scale: 18055.954822],
                            [[AGSLOD alloc] initWithLevel:16 resolution:2.38865713397468 scale: 9027.977411],
                            [[AGSLOD alloc] initWithLevel:17 resolution:1.19432856685505 scale:4513.988705],
                            [[AGSLOD alloc] initWithLevel:18 resolution:0.597164283559817 scale: 2256.994353],
                            [[AGSLOD alloc] initWithLevel:19 resolution:0.298582141647617 scale: 1128.497176],
                             nil ];
                  
	self.tileInfo = [[AGSTileInfo alloc] 
                     initWithDpi:96 
                     format :@"png"
                     lods:lods
                     origin:[AGSPoint pointWithX:-20037508.342787 y:20037508.342787 spatialReference:self.spatialReference]
                     spatialReference :self.spatialReference
                     tileSize:CGSizeMake(256,256)
                     ];
	[self.tileInfo computeTileBounds:self.fullEnvelope ];
	return self;
}
- (void)dealloc {
	self.spatialReference = nil;
	self.fullEnvelope = nil;
	self.tileInfo = nil;
    
	[super dealloc];	
}




@end
