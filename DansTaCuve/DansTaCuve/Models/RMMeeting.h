#import <Foundation/Foundation.h>

@interface RMMeeting : NSObject

@property (nonatomic) NSString *name;
@property (nonatomic) NSDate   *date;
@property (nonatomic) NSString *locationName;
@property (nonatomic) NSString *locationStreet;
@property (nonatomic) NSString *locationZip;
@property (nonatomic) NSString *locationCity;

@end
