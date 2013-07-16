
#import "NSFileManagerAdditions.h"

@implementation NSFileManager(Addtions)

#pragma mark - copy file to doc

+ (void)copyDBFileNamed:(NSString *)filename intoDocumentsSubfolder:(NSString *)dirname
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *documentsDirectory = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    
    if (![dirname isEqualToString:@""] || dirname != NULL) {
        NSString *subDirPath = [NSString stringWithFormat:@"%@/%@", documentsDirectory,dirname];
        if([fileManager createDirectoryAtPath:subDirPath withIntermediateDirectories:YES attributes:nil error:nil])
        {
            documentsDirectory = [documentsDirectory stringByAppendingPathComponent:dirname];
        }
    }
    
    NSString *writableFilePath = [documentsDirectory stringByAppendingPathComponent:filename];
    [fileManager removeItemAtPath:writableFilePath error:nil];
    
    NSError *error;
    NSString *defaultFilePath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:filename];
    BOOL isFileExist = [fileManager copyItemAtPath:defaultFilePath toPath:writableFilePath error:&error];
    if (!isFileExist) {
        NSAssert1(0, @"Failed to copy file to documents with message '%@'.", [error localizedDescription]);
    }
}

+ (void)copyFileNamed:(NSString *)filename intoDocumentsSubfolder:(NSString *)dirname
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *documentsDirectory = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    
    NSString *writableFilePath = [documentsDirectory stringByAppendingPathComponent:filename];
    [fileManager removeItemAtPath:writableFilePath error:nil];
    
    NSError *error;
    NSString *defaultFilePath = [documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"%@/%@",@"db",filename]];
    
    BOOL isFileExist = [fileManager copyItemAtPath:defaultFilePath toPath:writableFilePath error:&error];
    if (!isFileExist) {
        NSAssert1(0, @"Failed to copy file to documents with message '%@'.", [error localizedDescription]);
    }
}

+ (void)copyBundleDBFileNamed:(NSString *)filename intoDocumentsSubfolder:(NSString *)dirname
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *documentsDirectory = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    
    NSString *writableFilePath = [documentsDirectory stringByAppendingPathComponent:filename];
    
    NSError *error;
    NSString *defaultFilePath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:filename];
    
    BOOL isFileExist = [fileManager copyItemAtPath:defaultFilePath toPath:writableFilePath error:&error];
    if (!isFileExist) {
        NSAssert1(0, @"Failed to copy file to documents with message '%@'.", [error localizedDescription]);
    }
}


+ (void)saveImage:(UIImage*)image imageName:(NSString*)imageName 
{
    NSData *imageData = UIImagePNGRepresentation(image);
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    NSString *fullPath = [path stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.png", imageName]];     
    [fileManager createFileAtPath:fullPath contents:imageData attributes:nil];     
}

+ (void)removeImage:(NSString*)fileName
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    NSString *fullPath = [path stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.png", fileName]];
    [fileManager removeItemAtPath: fullPath error:NULL];
}

+ (UIImage*)loadImage:(NSString*)imageName
{
    NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    NSString *fullPath = [path stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.png", imageName]];
    return [UIImage imageWithContentsOfFile:fullPath];
}

+ (UIImage*)loadImageFromDir:(NSString*)imageName dir:(NSString*)dir
{
    NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    NSString *fullPath = [path stringByAppendingPathComponent:[NSString stringWithFormat:@"%@/%@.png",dir,imageName]];
    return [UIImage imageWithContentsOfFile:fullPath];
}

@end
