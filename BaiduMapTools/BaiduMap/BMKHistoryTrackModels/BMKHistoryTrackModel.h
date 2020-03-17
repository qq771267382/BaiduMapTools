#import <UIKit/UIKit.h>
#import "BMKHistoryTrackEndPoint.h"
#import "BMKHistoryTrackPoint.h"
#import "BMKHistoryTrackEndPoint.h"

@interface BMKHistoryTrackModel : NSObject

@property (nonatomic, strong) NSString * distance;
@property (nonatomic, strong) BMKHistoryTrackEndPoint * endPoint;
@property (nonatomic, strong) NSString * message;
@property (nonatomic, strong) NSArray * points;
@property (nonatomic, assign) NSInteger size;
@property (nonatomic, strong) BMKHistoryTrackEndPoint * startPoint;
@property (nonatomic, assign) NSInteger status;
@property (nonatomic, assign) NSInteger tag;
@property (nonatomic, assign) NSInteger tollDistance;
@property (nonatomic, assign) NSInteger total;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end