#import <UIKit/UIKit.h>

#import "BaiduMapTool.h"

@interface BMKHistoryTrackPoint : NSObject

@property (nonatomic, strong) NSString * createTime;
@property (nonatomic, assign) NSInteger direction;
@property (nonatomic, strong) NSString * latitude;
@property (nonatomic, assign) NSInteger locTime;
@property (nonatomic, strong) NSString * longitude;
@property (nonatomic, assign) NSInteger speed;

@property (nonatomic, assign) CLLocationCoordinate2D coordinate;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
