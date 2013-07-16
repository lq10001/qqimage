//
//  UIImage+TKCategory.h
//  Twilight
//
//  Created by  mac-mini-012 on 12-1-9.
//  Copyright (c) 2012年 .com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIImage(UIImageCategory)

+ (NSString*)getRealName:(NSString*)str;
+ (UIImage*) imageNamedAuto:(NSString*)str;
+ (UIImage*) imageNamedTK:(NSString*)str;
+ (UIImage*) imageNamedTKPNG:(NSString *)str;
+ (UIImage*) imageNamedTKJPG:(NSString*)str;
+ (UIImage*) loadImage:(NSString*)imageName dir:(NSString*)dir;
@end
