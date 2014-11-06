//
//  MapTileOperation.h
//  RDMapApp
//
//  Created by 李明杨 on 14-4-13.
//  Copyright (c) 2014年 李明杨. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <ArcGIS/ArcGIS.h>
@interface MapTileOperation : NSOperation <AGSTileOperation> {
    NSString* _mapTag;
    
}

- (id)initWithTile:(AGSTile *)tile  target:(id)target action:(SEL)action baseurl:(NSString *)baseurl maptag:(NSString *)maptag;


@property (nonatomic,retain) AGSTile* tile;
@property (nonatomic,retain) id target;
@property (nonatomic,assign) SEL action;
@property (nonatomic,retain) NSString* baseurl;

//qq自定义
@property (nonatomic,retain) NSArray *subdomain;
@property (nonatomic,retain) NSArray *scopes;
@end
