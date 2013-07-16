
#import "TKGlobal.h"
#import "UIImage+TKCategory.h"
#import "Define.h"

@implementation TKGlobal

+ (UIButton*) getButton:(NSString *)normalName selectedName:(NSString *)selectedName target:(id)target selector:(SEL)aselector
{
    UIImage *normalImage=[UIImage imageNamedTKPNG:normalName];
    UIImage *selectedImage=[UIImage imageNamedTKPNG:selectedName];
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    btn.exclusiveTouch=YES;
    [btn setBackgroundImage:normalImage forState:UIControlStateNormal];
    [btn setBackgroundImage:selectedImage forState:UIControlStateSelected];
    [btn addTarget:target action:aselector forControlEvents:UIControlEventTouchUpInside];
//    [btn sizeToFit];
    btn.frame = IS_IPAD ? CGRectMake(0, 0,normalImage.size.width , normalImage.size.height) :
                            CGRectMake(0, 0,normalImage.size.width  / 2, normalImage.size.height / 2) ;
    return btn;
}

+ (UIButton*) getButton:(NSString *)normalName highlightName:(NSString *)highlightName target:(id)target selector:(SEL)aselector
{
    UIImage *normalImage=[UIImage imageNamedTKPNG:normalName];
    UIImage *highlightImage=[UIImage imageNamedTKPNG:highlightName];
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    btn.exclusiveTouch=YES;
    [btn setBackgroundImage:normalImage forState:UIControlStateNormal];
    [btn setBackgroundImage:highlightImage forState:UIControlStateHighlighted];
    [btn addTarget:target action:aselector forControlEvents:UIControlEventTouchUpInside];
//    [btn sizeToFit];
    btn.frame = IS_IPAD ? CGRectMake(0, 0,normalImage.size.width , normalImage.size.height) :
                        CGRectMake(0, 0,normalImage.size.width , normalImage.size.height) ;
    return btn;
}

+ (UIButton*) getButton:(NSString *)normalName highlightName:(NSString *)highlightName selectedName:(NSString *)selectedName target:(id)target selector:(SEL)aselector
{
    UIImage *normalImage=[UIImage imageNamedTKPNG:normalName];
    UIImage *selectedImage=[UIImage imageNamedTKPNG:selectedName];
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    btn.exclusiveTouch=YES;
    [btn setBackgroundImage:normalImage forState:UIControlStateNormal];
    [btn setBackgroundImage:selectedImage forState:UIControlStateHighlighted];
    [btn setBackgroundImage:selectedImage forState:UIControlStateSelected];
    [btn addTarget:target action:aselector forControlEvents:UIControlEventTouchUpInside];
    //    [btn sizeToFit];
    btn.frame = IS_IPAD ? CGRectMake(0, 0,normalImage.size.width , normalImage.size.height) :
                        CGRectMake(0, 0,normalImage.size.width  / 2, normalImage.size.height / 2) ;
    return btn;
}

+ (UIImageView*) getImageView:(NSString *)imageName
{
    UIImage *image=[UIImage imageNamedAuto:imageName];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    DLog(" %@ ",NSStringFromCGSize(image.size));
    imageView.frame = AUTO_RECT(CGRectMake(0, 0, image.size.width, image.size.height));
    return imageView;
}


@end
