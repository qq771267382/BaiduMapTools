//
//  BaiduMapTool.m
//  BaiduMapTools
//
//  Created by 洪铭翔 on 2020/3/17.
//  Copyright © 2020 洪铭翔. All rights reserved.
//

#import "BaiduMapTool.h"
#import "BMKHistoryTrackModel.h"

#import "HMXStartAnnotation.h"
#import "HMXEndAnnotation.h"

//#define BAIDUMAPAK @"QggWTjr3FReRq2Mg5BBs8txAWYcBkcGB"
#define BAIDUMAPAK @"P1RDOlQG5F6h2GwTKxrE1H8QPYnK2WwO"

@interface BaiduMapTool ()<BMKMapViewDelegate, BTKTrackDelegate, BTKTraceDelegate>
@property (nonatomic, strong) BMKMapManager *mapManager;

@property (nonatomic, strong) BTKServiceOption *service;

@property (nonatomic, strong) BMKMapView *mapView;

@property (nonatomic, strong) HMXStartAnnotation *startAnnotation;
@property (nonatomic, strong) HMXEndAnnotation *endAnnotation;
@property (nonatomic, strong) BMKPointAnnotation *showAnnotation;

@property (nonatomic, strong) BMKPolyline *polyline;

//@property (nonatomic, strong) NSMutableArray<BMKPointAnnotation *> *annotations;
@end

@implementation BaiduMapTool

static BaiduMapTool *manager;

+ (BaiduMapTool *)shared {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[BaiduMapTool alloc] init];
    });
    return manager;
}
- (BTKServiceOption *)service {
    if (!_service) {
        _service = [[BTKServiceOption alloc] initWithAK:BAIDUMAPAK mcode:@"com.beehome.Gtalkie" serviceID:218413 keepAlive:false];
    }
    return _service;
}
//MARK: 注册app
- (void)register_app {
    _mapManager = [[BMKMapManager alloc] init];
    BOOL result = [_mapManager start:BAIDUMAPAK generalDelegate:nil];
    if (!result) {
        NSLog(@"manager start failed!");
    } else {
        [[BTKAction sharedInstance] initInfo:self.service];
    }
}
//MARK: 设置全局坐标系
/**
 全局设置地图SDK与开发者交互时的坐标类型。不调用此方法时，
 
 设置此坐标类型意味着2个方面的约定：
 1. 地图SDK认为开发者传入的所有坐标均为此类型；
 2. 所有地图SDK返回给开发者的坐标均为此类型；
 
 地图SDK默认使用BD09LL（BMK_COORDTYPE_BD09LL）坐标。
 如需使用GCJ02坐标，传入参数值为BMK_COORDTYPE_COMMON即可。ß
 本方法不支持传入WGS84（BMK_COORDTYPE_GPS）坐标。
 */
+ (void)setCoordinateTypeUsedInBaiduMapSDK {
    [BMKMapManager setCoordinateTypeUsedInBaiduMapSDK:BMK_COORDTYPE_COMMON];
}
- (BMKMapView *)getMapViewWithFrame:(CGRect)frame {
    BMKMapView *mapView = [[BMKMapView alloc] initWithFrame:frame];
    mapView.delegate = self;
    [mapView setZoomLevel:15];
    self.mapView = mapView;
    return mapView;
}
- (void)queryTrackCacheInfoRequest {
    BTKQueryTrackCacheInfoRequest *request = [[BTKQueryTrackCacheInfoRequest alloc] initWithEntityNames:nil serviceID:355287261474724 tag:0];
    [[BTKTrackAction sharedInstance] queryTrackCacheInfoWith:request delegate:self];
}
//将某个时间转化成 时间戳

#pragma mark - 将某个时间转化成 时间戳

+(NSInteger)timeSwitchTimestamp:(NSString *)formatTime andFormatter:(NSString *)format{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:format]; //(@"YYYY-MM-dd hh:mm:ss") ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
    [formatter setTimeZone:timeZone];
    NSDate* date = [formatter dateFromString:formatTime];
    //------------将字符串按formatter转成nsdate
    //时间转时间戳的方法:
    NSInteger timeSp = [[NSNumber numberWithDouble:[date timeIntervalSince1970]] integerValue];
    NSLog(@"将某个时间转化成 时间戳&&&&&&&timeSp:%ld",(long)timeSp); //时间戳的值
    return timeSp;
}
- (void)queryHistoryTrackRequest {
    [self queryHistoryTrackRequest:BTK_TRACK_PROCESS_OPTION_TRANSPORT_MODE_AUTO];
}
- (void)queryHistoryTrackRequest:(BTKTrackProcessOptionTransportMode)transportMode {
    // 构造请求对象
    NSString *time = @"2020-03-13 23:59:59";
    
    BTKQueryTrackProcessOption *option = [[BTKQueryTrackProcessOption alloc] init];
    option.denoise = TRUE;
    option.mapMatch = TRUE;
    option.radiusThreshold = 10;
    option.transportMode = transportMode;
    
    NSUInteger endTime = [BaiduMapTool timeSwitchTimestamp:time andFormatter:@"YYYY-MM-dd HH:mm:ss"];
    BTKQueryHistoryTrackRequest *request = [[BTKQueryHistoryTrackRequest alloc] initWithEntityName:@"355287261474724" startTime:endTime - 84400 endTime:endTime isProcessed:YES processOption:option supplementMode:BTK_TRACK_PROCESS_OPTION_SUPPLEMENT_MODE_WALKING outputCoordType:BTK_COORDTYPE_BD09LL sortType:BTK_TRACK_SORT_TYPE_DESC pageIndex:1 pageSize:5000 serviceID:218413 tag:0];
    // 发起查询请求
    [[BTKTrackAction sharedInstance] queryHistoryTrackWith:request delegate:self];
}
//MARK: 轨迹服务
- (void)startService:(NSString *)entityName {
    BTKStartServiceOption *op = [[BTKStartServiceOption alloc] initWithEntityName:entityName];
    [[BTKAction sharedInstance] startService:op delegate:self];
}
//MARK: BTKTrackDelegate
- (void)onQueryTrackCacheInfo:(NSData *)response {
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:response options:0 error:nil];
    
}
- (void)onQueryHistoryTrack:(NSData *)response {
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:response options:0 error:nil];
    BMKHistoryTrackModel *rootClass = [[BMKHistoryTrackModel alloc] initWithDictionary:dict];
    
    [self createStartAnnotation:rootClass.startPoint];
    [self createEndAnnotation:rootClass.endPoint];
    [self drawTrajectory:rootClass.points];
}
- (void)createStartAnnotation:(BMKHistoryTrackEndPoint *)point {
    [self.mapView removeAnnotation:self.startAnnotation];
    self.startAnnotation = [[HMXStartAnnotation alloc] init];
    self.startAnnotation.coordinate = point.coordinate;
    [self.mapView addAnnotation:self.startAnnotation];
}
- (void)createEndAnnotation:(BMKHistoryTrackEndPoint *)point {
    [self.mapView removeAnnotation:self.endAnnotation];
    self.endAnnotation = [[HMXEndAnnotation alloc] init];
    self.endAnnotation.coordinate = point.coordinate;
    [self.mapView addAnnotation:self.endAnnotation];
}
- (void)drawTrajectory:(NSArray *)points {
    CLLocationCoordinate2D coords[5000] = {};
    for (int i = 0; i < points.count; i++) {
        BMKHistoryTrackPoint *point = points[i];
        coords[i] = point.coordinate;
    }
    [self.mapView removeOverlay:self.polyline];
    BMKPolyline *polyline = [BMKPolyline polylineWithCoordinates:coords count:points.count];
    [self.mapView setCenterCoordinate:coords[0] animated:YES];
    self.polyline = polyline;
    [self.mapView addOverlay:polyline];
    [self.mapView setZoomLevel:21];
}
- (BMKOverlayView *)mapView:(BMKMapView *)mapView viewForOverlay:(id <BMKOverlay>)overlay{
    if ([overlay isKindOfClass:[BMKPolyline class]]){
         BMKPolylineView *polylineView = [[BMKPolylineView alloc] initWithPolyline:overlay];
         //设置polylineView的画笔颜色为蓝色
        
//         polylineView.strokeColor = [[UIColor alloc] initWithRed:61/255.0 green:168/255.0 blue:245/255.0 alpha:1.0];
         //设置polylineView的画笔宽度
         polylineView.lineWidth = 8;
         //圆点虚线，V5.0.0新增
//        polylineView.lineDashType = kBMKLineDashTypeDot;
         //方块虚线，V5.0.0新增
//       polylineView.lineDashType = kBMKLineDashTypeSquare;
        
        polylineView.lineCapType = kBMKLineCapRound;
        //拐角处尖角衔接，V5.0.0新增
        polylineView.lineJoinType = kBMKLineJoinRound;
        
        [polylineView loadStrokeTextureImage:[UIImage imageNamed:@"traffic_texture_unknown"]];
         return polylineView;
    }
    return nil;
}
- (BMKAnnotationView *)mapView:(BMKMapView *)mapView viewForAnnotation:(id<BMKAnnotation>)annotation {
    if ([annotation isKindOfClass:[HMXStartAnnotation class]])
    {
        static NSString *reuseIndetifier = @"HMXStartAnnotation";
        BMKAnnotationView *annotationView = [mapView dequeueReusableAnnotationViewWithIdentifier:reuseIndetifier];
        if (annotationView == nil)
        {
            annotationView = [[BMKAnnotationView alloc] initWithAnnotation:annotation
                                                              reuseIdentifier:reuseIndetifier];
        }

        annotationView.image = [UIImage imageNamed:@"学校"];
        return annotationView;
    } else if ([annotation isKindOfClass:[HMXEndAnnotation class]]) {
        static NSString *reuseIndetifier = @"HMXEndAnnotation";
        BMKAnnotationView *annotationView = [mapView dequeueReusableAnnotationViewWithIdentifier:reuseIndetifier];
        if (annotationView == nil)
        {
            annotationView = [[BMKAnnotationView alloc] initWithAnnotation:annotation
                                                              reuseIdentifier:reuseIndetifier];
        }

        annotationView.image = [UIImage imageNamed:@"位置"];
        return annotationView;
    }
    return nil;
}
@end
