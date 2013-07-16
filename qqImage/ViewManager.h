

#import <Foundation/Foundation.h>

@interface ViewManager : NSObject

+ (ViewManager*)sharedViewManager;

- (void)goPreVC;

- (void)goStartVC;

- (void)goMainView;

- (void)goCropView;

- (void)goFilterView;

@end
