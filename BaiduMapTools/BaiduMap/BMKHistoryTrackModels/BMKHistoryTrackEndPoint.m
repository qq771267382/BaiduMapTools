//
//	BMKHistoryTrackEndPoint.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "BMKHistoryTrackEndPoint.h"

NSString *const kBMKHistoryTrackEndPointLatitude = @"latitude";
NSString *const kBMKHistoryTrackEndPointLocTime = @"loc_time";
NSString *const kBMKHistoryTrackEndPointLongitude = @"longitude";

@interface BMKHistoryTrackEndPoint ()
@end
@implementation BMKHistoryTrackEndPoint




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kBMKHistoryTrackEndPointLatitude] isKindOfClass:[NSNull class]]){
		self.latitude = dictionary[kBMKHistoryTrackEndPointLatitude];
	}	
	if(![dictionary[kBMKHistoryTrackEndPointLocTime] isKindOfClass:[NSNull class]]){
		self.locTime = [dictionary[kBMKHistoryTrackEndPointLocTime] integerValue];
	}

	if(![dictionary[kBMKHistoryTrackEndPointLongitude] isKindOfClass:[NSNull class]]){
		self.longitude = dictionary[kBMKHistoryTrackEndPointLongitude];
	}
    
    self.coordinate = CLLocationCoordinate2DMake((CLLocationDegrees)[self.latitude doubleValue], (CLLocationDegrees)[self.longitude doubleValue]);
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.latitude != nil){
		dictionary[kBMKHistoryTrackEndPointLatitude] = self.latitude;
	}
	dictionary[kBMKHistoryTrackEndPointLocTime] = @(self.locTime);
	if(self.longitude != nil){
		dictionary[kBMKHistoryTrackEndPointLongitude] = self.longitude;
	}
	return dictionary;

}

/**
 * Implementation of NSCoding encoding method
 */
/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
- (void)encodeWithCoder:(NSCoder *)aCoder
{
	if(self.latitude != nil){
		[aCoder encodeObject:self.latitude forKey:kBMKHistoryTrackEndPointLatitude];
	}
	[aCoder encodeObject:@(self.locTime) forKey:kBMKHistoryTrackEndPointLocTime];	if(self.longitude != nil){
		[aCoder encodeObject:self.longitude forKey:kBMKHistoryTrackEndPointLongitude];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.latitude = [aDecoder decodeObjectForKey:kBMKHistoryTrackEndPointLatitude];
	self.locTime = [[aDecoder decodeObjectForKey:kBMKHistoryTrackEndPointLocTime] integerValue];
	self.longitude = [aDecoder decodeObjectForKey:kBMKHistoryTrackEndPointLongitude];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	BMKHistoryTrackEndPoint *copy = [BMKHistoryTrackEndPoint new];

	copy.latitude = [self.latitude copy];
	copy.locTime = self.locTime;
	copy.longitude = [self.longitude copy];

	return copy;
}
@end
