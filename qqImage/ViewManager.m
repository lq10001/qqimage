

#import "ViewManager.h"
#import "MainViewController.h"
#import "CropViewController.h"
#import "AppDelegate.h"
#import "ShowcaseFilterViewController.h"

@implementation ViewManager

static ViewManager* instance = nil;

+ (ViewManager*)sharedViewManager
{
    if (instance == nil) {
        instance = [[ViewManager alloc] init];
    }
    return instance;
}

- (void)goPreVC
{
    [[AppDelegate sharedAppDelegate].navigationVC popViewControllerAnimated:NO];
}

- (void)goStartVC
{
    [[AppDelegate sharedAppDelegate].navigationVC popToRootViewControllerAnimated:NO];
}

- (void)goMainView
{
    MainViewController *mainVC = [[MainViewController alloc] init];
    [[AppDelegate sharedAppDelegate].navigationVC pushViewController:mainVC animated:NO];
}

- (void)goCropView
{
    CropViewController *cropVC = [[CropViewController alloc] init];
    [[AppDelegate sharedAppDelegate].navigationVC pushViewController:cropVC animated:NO];
}

- (void)goFilterView
{
    NSMutableArray *checkedIndexArray = [NSMutableArray arrayWithObjects:
                                  @"0",
                                  @"1",
                                  @"2",
                                  @"3",
                                  nil];
    
    ShowcaseFilterViewController *filterViewController = [[ShowcaseFilterViewController alloc] initWithFilterType:0];
    filterViewController.checkedIndexArray = checkedIndexArray;
    filterViewController.isStatic = YES;
    
    filterViewController.stillImage = [UserInfoManager sharedUserInfo].maxImage;
    [[AppDelegate sharedAppDelegate].navigationVC pushViewController:filterViewController animated:NO];
}

@end
