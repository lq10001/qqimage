

#import "UserInfoManager.h"

@implementation UserInfoManager

@synthesize maxImage,midImage,minImage;

static UserInfoManager* instance = nil;

+ (UserInfoManager*)sharedUserInfo
{
    if (instance == nil) {
        instance = [[UserInfoManager alloc] init];
    }
    return instance;
}



@end
