#import <Foundation/Foundation.h>

@import CoreLocation;

@interface RMMeeting : NSObject <NSCoding>

@property (nonatomic) NSString *name;
@property (nonatomic) NSDate   *date;
@property (nonatomic) NSString *locationName;
@property (nonatomic) NSString *locationStreet;
@property (nonatomic) NSString *locationZip;
@property (nonatomic) NSString *locationCity;
@property (nonatomic, assign) CLLocationCoordinate2D coordinates;

- (void)encodeWithCoder:(NSCoder *)aCoder;
- (id)initWithCoder:(NSCoder *)aDecoder;

@end
