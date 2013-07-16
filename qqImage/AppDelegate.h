//
//  AppDelegate.h
//  qqImage
//
//  Created by zhongwei on 3/27/13.
//  Copyright (c) 2013 zhongwei. All rights reserved.
//

#import <UIKit/UIKit.h>

@class StartViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) UINavigationController *navigationVC;

+ (AppDelegate*)sharedAppDelegate;


@end
