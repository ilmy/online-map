//
//  ViewController.m
//  online-map
//
//  Created by 李明杨 on 14-11-6.
//  Copyright (c) 2014年 李明杨. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _baiduLayer = [[BaiduMapLayer alloc] init];
    [_mapView addMapLayer:_baiduLayer withName:@"basemap"];
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_tiandituzjLayer release];
    [_tiandituLayer release];
    [_googleLayer release];
    [_baiduLayer release];
    [_mapView release];
    [super dealloc];
}
- (IBAction)segmentChanged:(id)sender {
    UISegmentedControl *_tempSegmented = (UISegmentedControl *)sender;
    NSInteger _index = _tempSegmented.selectedSegmentIndex;
    [_mapView reset];
    switch (_index) {
            //百度
        case 0:
            ;
            _baiduLayer = [[BaiduMapLayer alloc] init];
            [_mapView addMapLayer:_baiduLayer withName:@"basemap"];
            
            break;
            
        case 1:
            
            _googleLayer = [[GoogleMapLayer alloc] init:normals] ;
            [_mapView addMapLayer:_googleLayer withName:@"basemap"];
            
            break;
            
        case 2:
            
            _tiandituLayer = [[TiandiTuMapLayer alloc] init:vec] ;
            [_mapView addMapLayer:_tiandituLayer withName:@"basemap"];
            _tiandituzjLayer = [[TiandiTuMapLayer alloc] init:cav];
            [_mapView addMapLayer:_tiandituzjLayer withName:@"zj"];
            
            break;
            
        default:
            
            break;
            
    }

    
}
@end
