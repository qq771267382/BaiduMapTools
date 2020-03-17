//
//  BaiduMapTool.h
//  BaiduMapTools
//
//  Created by 洪铭翔 on 2020/3/17.
//  Copyright © 2020 洪铭翔. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <BaiduMapAPI_Base/BMKBaseComponent.h>
#import <BaiduMapAPI_Map/BMKMapComponent.h>
#import <BaiduTraceSDK/BaiduTraceSDK.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaiduMapTool : NSObject

+ (BaiduMapTool *)shared;

- (void)register_app;
- (BMKMapView *)getMapViewWithFrame:(CGRect)frame;

- (void)queryHistoryTrackRequest;
- (void)queryHistoryTrackRequest:(BTKTrackProcessOptionTransportMode)transportMode;
@end

NS_ASSUME_NONNULL_END
