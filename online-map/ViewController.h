//
//  ViewController.h
//  online-map
//
//  Created by 李明杨 on 14-11-6.
//  Copyright (c) 2014年 李明杨. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ArcGIS/ArcGIS.h>
#import "BaiduMapLayer.h"
#import "GoogleMapLayer.h"
#import "TiandiTuMapLayer.h"
@interface ViewController : UIViewController
@property (retain, nonatomic) IBOutlet AGSMapView *mapView;
@property (nonatomic,retain)BaiduMapLayer *baiduLayer;
@property (nonatomic,retain)GoogleMapLayer *googleLayer;
@property (nonatomic,retain)TiandiTuMapLayer *tiandituLayer;
@property (nonatomic,retain)TiandiTuMapLayer *tiandituzjLayer;
- (IBAction)segmentChanged:(id)sender;
@end
