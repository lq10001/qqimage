//
//  TKGlobal.h
//  Twilight
//
//  Created by  mac-mini-012 on 12-1-9.
//  Copyright (c) 2012年 .com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TKGlobal : NSObject
+ (UIButton*) getButton:(NSString*)normalName selectedName:(NSString*)selectedName target:(id)target selector:(SEL)aselector;
+ (UIButton*) getButton:(NSString*)normalName highlightName:(NSString*)highlightName target:(id)target selector:(SEL)aselector;
+ (UIButton*) getButton:(NSString *)normalName highlightName:(NSString *)highlightName selectedName:(NSString *)selectedName target:(id)target selector:(SEL)aselector;

+ (UIImageView*) getImageView:(NSString *)imageName;
@end
