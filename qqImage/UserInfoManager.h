
#import <Foundation/Foundation.h>

@interface UserInfoManager : NSObject

@property(nonatomic,strong)UIImage *maxImage;
@property(nonatomic,strong)UIImage *midImage;
@property(nonatomic,strong)UIImage *minImage;


+ (UserInfoManager*)sharedUserInfo;

@end
