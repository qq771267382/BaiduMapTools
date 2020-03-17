#import <UIKit/UIKit.h>

#import "BaiduMapTool.h"

@interface BMKHistoryTrackEndPoint : NSObject

@property (nonatomic, strong) NSString * latitude;
@property (nonatomic, assign) NSInteger locTime;
@property (nonatomic, strong) NSString * longitude;

@property (nonatomic, assign) CLLocationCoordinate2D coordinate;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
