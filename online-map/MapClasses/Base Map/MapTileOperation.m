//
//  MapTileOperation.m
//  RDMapApp
//
//  Created by 李明杨 on 14-4-13.
//  Copyright (c) 2014年 李明杨. All rights reserved.
//

#import "MapTileOperation.h"

int tn(int n)//计算2的n次方
{
	int num = 1;
	int i = 0;
	for (i=0; i<n; i++) {
		num = num *2;
	}
	return num;
}
@implementation MapTileOperation


- (id)initWithTile:(AGSTile *)tile  target:(id)target action:(SEL)action baseurl:(NSString *)baseurl maptag:(NSString *)maptag {
	
	if (self = [super init]) {
		_target = target;
		_action = action;
		_tile = [tile retain];
       
        _baseurl=baseurl;
        _mapTag = maptag;
        if ([_mapTag isEqualToString:@"qq"]) {
            _subdomain = [[NSArray alloc] initWithObjects:@"p0", @"p1", @"p2", @"p3",nil];
            _scopes = [[NSArray alloc] initWithObjects: @"0", @"0", @"0", @"0", @"0", @"3", @"0", @"3", @"0", @"3", @"0", @"3", @"0", @"7", @"0", @"7", @"0", @"15", @"0", @"15", @"0", @"31", @"0", @"31", @"0", @"63", @"4", @"59", @"0", @"127", @"12", @"115", @"0", @"225", @"28", @"227", @"256", @"255", @"150", @"259", @"720", @"899", @"320", @"469", @"1440", @"1799", @"650", @"929", @"2880", @"3589", @"1200", @"2069", @"5760", @"7179", @"2550", @"3709", @"11520", @"14349", @"5100", @"7999", @"23060", @"28689", @"10710", @"15429", @"46120", @"57369", @"20290", @"29849", @"89990", @"124729", @"41430", @"60689", @"184228", @"229827", @"84169", @"128886", nil];
        
        }
	}
	return self;
}

-(void)main {
	//Fetch the tile for the requested Level, Row, Column
	@try {
        NSString *baseUrl;
        if([_mapTag isEqualToString:@"qq"])
        {
            NSInteger subindex = (_tile.level + _tile.column + _tile.row) % 4;
            NSString *subdomain = [_subdomain objectAtIndex:subindex] ;
         
            NSInteger  f = _tile.level*4;
            if (f == _scopes.count)
            {return ;}
            NSInteger i = [[_scopes objectAtIndex:f++] intValue];
            NSInteger j = [[_scopes objectAtIndex:f++] intValue];
            NSInteger l = [[_scopes objectAtIndex:f++] intValue];
            NSInteger scope = [[_scopes objectAtIndex:f] intValue];
             if (_tile.column >= i && _tile.column <= j && _tile.row >= l && _tile.row <= scope) {
                 //_tile.row = pow(2, _tile.level) - 1 - _tile.row;
                 //@"http://%s.map.gtimg.com/maptilesv2/%d/%d/%d/%d_%d.png?version=20130701"];

                 baseUrl = [NSString stringWithFormat:_baseurl,[subdomain UTF8String],_tile.level,floor(_tile.column/16),floor(_tile.row/16),_tile.column,_tile.row];
             //  NSLog(@"url:%s",[baseUrl UTF8String]);
             }
             else {return;}
            
        }
        else if ([_mapTag isEqualToString:@"ln"])
        {
            baseUrl= [NSString stringWithFormat:_baseurl,_tile.column,_tile.row,_tile.level];
         
        }
        else if([_mapTag isEqualToString:@"own"])
        {
               NSString *param =@"?SERVICE=WMTS&VERSION=undefined&REQUEST=GetTile&LAYER=undefined&STYLE=undefined&FORMAT=image/png&TILEMATRIXSET=undefined&TILECOL=%d&TILEROW=%d&TILEMATRIX=%d";
            baseUrl=[_baseurl stringByAppendingString: [NSString stringWithFormat:param,_tile.column,_tile.row,_tile.level]];
        }
        else if([_mapTag isEqualToString:@"baidu"])
        {
//            double zoom = _tile.level - 1;
//            int offsetX = pow(2, zoom);
//            int offsetY = offsetX - 1;
//            int numX = _tile.column - offsetX;
//            int numY = (-_tile.row) + offsetY;
//            NSString *_tempstr=[NSString stringWithFormat:_baseurl,(_tile.column+_tile.row+_tile.level)%4,numY,numX,_tile.level];
//            baseUrl=_tempstr;
            _tile.row = pow(2, _tile.level-1) -1 - abs(_tile.row);
            NSString *_tempstr=[NSString stringWithFormat:_baseurl,(_tile.column+_tile.row+_tile.level)%4,_tile.column,_tile.row,_tile.level];
            baseUrl=_tempstr;
        }
        else{
            
            NSString *_tempstr=[NSString stringWithFormat:_baseurl,(_tile.column+_tile.row+_tile.level)%4,_tile.column,_tile.row,_tile.level];
            baseUrl=_tempstr;
           // NSLog(_tempstr);
        }
        
		if (_tile.row >=tn(_tile.level)&&![_mapTag isEqualToString:@"own"]) {
			   NSLog(baseUrl);
			return;
		}
      

		NSURL* aURL = [NSURL URLWithString:baseUrl];
		NSData* data = [[NSData alloc] initWithContentsOfURL:aURL];
        if (data !=nil && data.length > 1) {
            uint8_t c;
            [data getBytes:&c length:1];
            if (c == 0xFF || c == 0x89) {
              UIImage *image = [UIImage imageWithData:data];
                if(image != nil)
                {
                    _tile.image = image;

                }
            }
            [data release];
            data = nil;

        }
		
	}
	@catch (NSException *exception) {
		NSLog(@"main: Caught Exception %@: %@", [exception name], [exception reason]);
	}
	@finally {
		//Invoke the layer's action method
		[_target performSelector:_action withObject:self];
	}
   
}

- (void)dealloc {
	_action = nil;
    [_tile release];
    [_baseurl release];
    [_mapTag release];
    _tile = nil;
    _baseurl = nil;
    _mapTag = nil;
   [super dealloc];
}



@end
