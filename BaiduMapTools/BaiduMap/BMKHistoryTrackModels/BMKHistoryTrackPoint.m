//
//	BMKHistoryTrackPoint.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "BMKHistoryTrackPoint.h"

NSString *const kBMKHistoryTrackPointCreateTime = @"create_time";
NSString *const kBMKHistoryTrackPointDirection = @"direction";
NSString *const kBMKHistoryTrackPointLatitude = @"latitude";
NSString *const kBMKHistoryTrackPointLocTime = @"loc_time";
NSString *const kBMKHistoryTrackPointLongitude = @"longitude";
NSString *const kBMKHistoryTrackPointSpeed = @"speed";

@interface BMKHistoryTrackPoint ()
@end
@implementation BMKHistoryTrackPoint




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kBMKHistoryTrackPointCreateTime] isKindOfClass:[NSNull class]]){
		self.createTime = dictionary[kBMKHistoryTrackPointCreateTime];
	}	
	if(![dictionary[kBMKHistoryTrackPointDirection] isKindOfClass:[NSNull class]]){
		self.direction = [dictionary[kBMKHistoryTrackPointDirection] integerValue];
	}

	if(![dictionary[kBMKHistoryTrackPointLatitude] isKindOfClass:[NSNull class]]){
		self.latitude = dictionary[kBMKHistoryTrackPointLatitude];
	}	
	if(![dictionary[kBMKHistoryTrackPointLocTime] isKindOfClass:[NSNull class]]){
		self.locTime = [dictionary[kBMKHistoryTrackPointLocTime] integerValue];
	}

	if(![dictionary[kBMKHistoryTrackPointLongitude] isKindOfClass:[NSNull class]]){
		self.longitude = dictionary[kBMKHistoryTrackPointLongitude];
	}	
	if(![dictionary[kBMKHistoryTrackPointSpeed] isKindOfClass:[NSNull class]]){
		self.speed = [dictionary[kBMKHistoryTrackPointSpeed] integerValue];
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
	if(self.createTime != nil){
		dictionary[kBMKHistoryTrackPointCreateTime] = self.createTime;
	}
	dictionary[kBMKHistoryTrackPointDirection] = @(self.direction);
	if(self.latitude != nil){
		dictionary[kBMKHistoryTrackPointLatitude] = self.latitude;
	}
	dictionary[kBMKHistoryTrackPointLocTime] = @(self.locTime);
	if(self.longitude != nil){
		dictionary[kBMKHistoryTrackPointLongitude] = self.longitude;
	}
	dictionary[kBMKHistoryTrackPointSpeed] = @(self.speed);
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
	if(self.createTime != nil){
		[aCoder encodeObject:self.createTime forKey:kBMKHistoryTrackPointCreateTime];
	}
	[aCoder encodeObject:@(self.direction) forKey:kBMKHistoryTrackPointDirection];	if(self.latitude != nil){
		[aCoder encodeObject:self.latitude forKey:kBMKHistoryTrackPointLatitude];
	}
	[aCoder encodeObject:@(self.locTime) forKey:kBMKHistoryTrackPointLocTime];	if(self.longitude != nil){
		[aCoder encodeObject:self.longitude forKey:kBMKHistoryTrackPointLongitude];
	}
	[aCoder encodeObject:@(self.speed) forKey:kBMKHistoryTrackPointSpeed];
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.createTime = [aDecoder decodeObjectForKey:kBMKHistoryTrackPointCreateTime];
	self.direction = [[aDecoder decodeObjectForKey:kBMKHistoryTrackPointDirection] integerValue];
	self.latitude = [aDecoder decodeObjectForKey:kBMKHistoryTrackPointLatitude];
	self.locTime = [[aDecoder decodeObjectForKey:kBMKHistoryTrackPointLocTime] integerValue];
	self.longitude = [aDecoder decodeObjectForKey:kBMKHistoryTrackPointLongitude];
	self.speed = [[aDecoder decodeObjectForKey:kBMKHistoryTrackPointSpeed] integerValue];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	BMKHistoryTrackPoint *copy = [BMKHistoryTrackPoint new];

	copy.createTime = [self.createTime copy];
	copy.direction = self.direction;
	copy.latitude = [self.latitude copy];
	copy.locTime = self.locTime;
	copy.longitude = [self.longitude copy];
	copy.speed = self.speed;

	return copy;
}
@end
