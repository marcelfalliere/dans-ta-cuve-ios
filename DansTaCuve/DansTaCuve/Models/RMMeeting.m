#import "RMMeeting.h"

@implementation RMMeeting

- (void)encodeWithCoder:(NSCoder *)coder
{
    [coder encodeObject:self.name           forKey:@"name"];
    [coder encodeObject:self.date           forKey:@"date"];
    [coder encodeObject:self.locationName   forKey:@"locationName"];
    [coder encodeObject:self.locationStreet forKey:@"locationStreet"];
    [coder encodeObject:self.locationZip    forKey:@"locationZip"];
    [coder encodeObject:self.locationCity   forKey:@"locationCity"];
    
    [coder encodeDouble:self.coordinates.latitude   forKey:@"locationLatitude"];
    [coder encodeDouble:self.coordinates.longitude  forKey:@"locationLongitude"];
}

- (id)initWithCoder:(NSCoder *)decoder
{
    if(self = [self init])
    {
        self.name           = [decoder decodeObjectForKey: @"name"];
        self.date           = [decoder decodeObjectForKey: @"date"];
        self.locationName   = [decoder decodeObjectForKey: @"locationName"];
        self.locationStreet = [decoder decodeObjectForKey: @"locationStreet"];
        self.locationZip    = [decoder decodeObjectForKey: @"locationZip"];
        self.locationCity   = [decoder decodeObjectForKey: @"locationCity"];

        double latitude     = [decoder decodeDoubleForKey: @"locationLatitude"];
        double longitude    = [decoder decodeDoubleForKey: @"locationLongitude"];
        
        self.coordinates = CLLocationCoordinate2DMake(latitude, longitude);
    }
    return self;
}

@end
