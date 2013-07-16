

#import "UIImage+TKCategory.h"
#import "NSFileManagerAdditions.h"


@implementation UIImage(UIImageCategory)

+ (NSString*)getRealName:(NSString*)str
{
    CGFloat s = 1.0f;
	if([[UIScreen mainScreen] respondsToSelector:@selector(scale)])
    s = [[UIScreen mainScreen] scale];
    

    NSString *realName = [NSString stringWithFormat:@"%@%@",str,s > 1 ? @"@2x":@""];
    if (([UIScreen mainScreen].bounds.size.height == 568)) {
        realName = [NSString stringWithFormat:@"%@%@",str,@"-568h@2x"];
    }
    NSLog(@" %@ ",realName );
    return realName;
}

+ (UIImage*) imageNamedTK:(NSString *)str
{
    NSString *path = [NSString stringWithFormat:@"%@.png",[self getRealName:str]];
    NSString *realPath=[[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:path];
	return [UIImage imageWithContentsOfFile:realPath];
}

+ (UIImage*) imageNamedTKPNG:(NSString *)str
{
    NSLog(@" %@ ",str);
    if (str == nil || [str isEqualToString:@""]) {
        return nil;
    }
    return [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[self getRealName:str] ofType:@"png"]];
}

+ (UIImage*) imageNamedTKJPG:(NSString *)str
{
	
    if (str == nil || [str isEqualToString:@""]) {
        return nil;
    }
    return [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[self getRealName:str] ofType:@"jpg"]];
}

+ (UIImage*) imageNamedAuto:(NSString *)path
{
    
    UIImage *image=[UIImage imageNamedTK:path];
    if(!image) image=[UIImage imageNamedTKJPG:path];
    return image;
}

+ (UIImage *)loadImage:(NSString*)imageName dir:(NSString*)dir
{
    UIImage *image=[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:imageName ofType:@"png" inDirectory:dir]];
    if(!image)
    {
        image=[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:imageName ofType:@"jpg" inDirectory:dir]];
    }
    if (!image) {
        image = [NSFileManager loadImageFromDir:imageName dir:dir];
    }
    
    return image;
}

@end
