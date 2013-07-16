
#import <Foundation/Foundation.h>

@interface NSFileManager(Addtions)

+ (void)copyDBFileNamed:(NSString *)filename intoDocumentsSubfolder:(NSString *)dirname;
+ (void)copyFileNamed:(NSString *)filename intoDocumentsSubfolder:(NSString *)dirname;
+ (void)copyBundleDBFileNamed:(NSString *)filename intoDocumentsSubfolder:(NSString *)dirname;
+ (void)saveImage:(UIImage*)image imageName:(NSString*)imageName;
+ (void)removeImage:(NSString*)fileName;
+ (UIImage*)loadImage:(NSString*)imageName;
+ (UIImage*)loadImageFromDir:(NSString*)imageName dir:(NSString*)dir;

@end
