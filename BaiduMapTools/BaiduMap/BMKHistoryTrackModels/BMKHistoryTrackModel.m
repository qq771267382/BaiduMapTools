//
//	BMKHistoryTrackModel.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "BMKHistoryTrackModel.h"

NSString *const kBMKHistoryTrackModelDistance = @"distance";
NSString *const kBMKHistoryTrackModelEndPoint = @"end_point";
NSString *const kBMKHistoryTrackModelMessage = @"message";
NSString *const kBMKHistoryTrackModelPoints = @"points";
NSString *const kBMKHistoryTrackModelSize = @"size";
NSString *const kBMKHistoryTrackModelStartPoint = @"start_point";
NSString *const kBMKHistoryTrackModelStatus = @"status";
NSString *const kBMKHistoryTrackModelTag = @"tag";
NSString *const kBMKHistoryTrackModelTollDistance = @"toll_distance";
NSString *const kBMKHistoryTrackModelTotal = @"total";

@interface BMKHistoryTrackModel ()
@end
@implementation BMKHistoryTrackModel




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kBMKHistoryTrackModelDistance] isKindOfClass:[NSNull class]]){
		self.distance = dictionary[kBMKHistoryTrackModelDistance];
	}	
	if(![dictionary[kBMKHistoryTrackModelEndPoint] isKindOfClass:[NSNull class]]){
		self.endPoint = [[BMKHistoryTrackEndPoint alloc] initWithDictionary:dictionary[kBMKHistoryTrackModelEndPoint]];
	}

	if(![dictionary[kBMKHistoryTrackModelMessage] isKindOfClass:[NSNull class]]){
		self.message = dictionary[kBMKHistoryTrackModelMessage];
	}	
	if(dictionary[kBMKHistoryTrackModelPoints] != nil && [dictionary[kBMKHistoryTrackModelPoints] isKindOfClass:[NSArray class]]){
		NSArray * pointsDictionaries = dictionary[kBMKHistoryTrackModelPoints];
		NSMutableArray * pointsItems = [NSMutableArray array];
		for(NSDictionary * pointsDictionary in pointsDictionaries){
			BMKHistoryTrackPoint * pointsItem = [[BMKHistoryTrackPoint alloc] initWithDictionary:pointsDictionary];
			[pointsItems addObject:pointsItem];
		}
		self.points = pointsItems;
	}
	if(![dictionary[kBMKHistoryTrackModelSize] isKindOfClass:[NSNull class]]){
		self.size = [dictionary[kBMKHistoryTrackModelSize] integerValue];
	}

	if(![dictionary[kBMKHistoryTrackModelStartPoint] isKindOfClass:[NSNull class]]){
		self.startPoint = [[BMKHistoryTrackEndPoint alloc] initWithDictionary:dictionary[kBMKHistoryTrackModelStartPoint]];
	}

	if(![dictionary[kBMKHistoryTrackModelStatus] isKindOfClass:[NSNull class]]){
		self.status = [dictionary[kBMKHistoryTrackModelStatus] integerValue];
	}

	if(![dictionary[kBMKHistoryTrackModelTag] isKindOfClass:[NSNull class]]){
		self.tag = [dictionary[kBMKHistoryTrackModelTag] integerValue];
	}

	if(![dictionary[kBMKHistoryTrackModelTollDistance] isKindOfClass:[NSNull class]]){
		self.tollDistance = [dictionary[kBMKHistoryTrackModelTollDistance] integerValue];
	}

	if(![dictionary[kBMKHistoryTrackModelTotal] isKindOfClass:[NSNull class]]){
		self.total = [dictionary[kBMKHistoryTrackModelTotal] integerValue];
	}

	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.distance != nil){
		dictionary[kBMKHistoryTrackModelDistance] = self.distance;
	}
	if(self.endPoint != nil){
		dictionary[kBMKHistoryTrackModelEndPoint] = [self.endPoint toDictionary];
	}
	if(self.message != nil){
		dictionary[kBMKHistoryTrackModelMessage] = self.message;
	}
	if(self.points != nil){
		NSMutableArray * dictionaryElements = [NSMutableArray array];
		for(BMKHistoryTrackPoint * pointsElement in self.points){
			[dictionaryElements addObject:[pointsElement toDictionary]];
		}
		dictionary[kBMKHistoryTrackModelPoints] = dictionaryElements;
	}
	dictionary[kBMKHistoryTrackModelSize] = @(self.size);
	if(self.startPoint != nil){
		dictionary[kBMKHistoryTrackModelStartPoint] = [self.startPoint toDictionary];
	}
	dictionary[kBMKHistoryTrackModelStatus] = @(self.status);
	dictionary[kBMKHistoryTrackModelTag] = @(self.tag);
	dictionary[kBMKHistoryTrackModelTollDistance] = @(self.tollDistance);
	dictionary[kBMKHistoryTrackModelTotal] = @(self.total);
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
	if(self.distance != nil){
		[aCoder encodeObject:self.distance forKey:kBMKHistoryTrackModelDistance];
	}
	if(self.endPoint != nil){
		[aCoder encodeObject:self.endPoint forKey:kBMKHistoryTrackModelEndPoint];
	}
	if(self.message != nil){
		[aCoder encodeObject:self.message forKey:kBMKHistoryTrackModelMessage];
	}
	if(self.points != nil){
		[aCoder encodeObject:self.points forKey:kBMKHistoryTrackModelPoints];
	}
	[aCoder encodeObject:@(self.size) forKey:kBMKHistoryTrackModelSize];	if(self.startPoint != nil){
		[aCoder encodeObject:self.startPoint forKey:kBMKHistoryTrackModelStartPoint];
	}
	[aCoder encodeObject:@(self.status) forKey:kBMKHistoryTrackModelStatus];	[aCoder encodeObject:@(self.tag) forKey:kBMKHistoryTrackModelTag];	[aCoder encodeObject:@(self.tollDistance) forKey:kBMKHistoryTrackModelTollDistance];	[aCoder encodeObject:@(self.total) forKey:kBMKHistoryTrackModelTotal];
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.distance = [aDecoder decodeObjectForKey:kBMKHistoryTrackModelDistance];
	self.endPoint = [aDecoder decodeObjectForKey:kBMKHistoryTrackModelEndPoint];
	self.message = [aDecoder decodeObjectForKey:kBMKHistoryTrackModelMessage];
	self.points = [aDecoder decodeObjectForKey:kBMKHistoryTrackModelPoints];
	self.size = [[aDecoder decodeObjectForKey:kBMKHistoryTrackModelSize] integerValue];
	self.startPoint = [aDecoder decodeObjectForKey:kBMKHistoryTrackModelStartPoint];
	self.status = [[aDecoder decodeObjectForKey:kBMKHistoryTrackModelStatus] integerValue];
	self.tag = [[aDecoder decodeObjectForKey:kBMKHistoryTrackModelTag] integerValue];
	self.tollDistance = [[aDecoder decodeObjectForKey:kBMKHistoryTrackModelTollDistance] integerValue];
	self.total = [[aDecoder decodeObjectForKey:kBMKHistoryTrackModelTotal] integerValue];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	BMKHistoryTrackModel *copy = [BMKHistoryTrackModel new];

	copy.distance = [self.distance copy];
	copy.endPoint = [self.endPoint copy];
	copy.message = [self.message copy];
	copy.points = [self.points copy];
	copy.size = self.size;
	copy.startPoint = [self.startPoint copy];
	copy.status = self.status;
	copy.tag = self.tag;
	copy.tollDistance = self.tollDistance;
	copy.total = self.total;

	return copy;
}
@end