

#import <UIKit/UIKit.h>
#import "ParentViewController.h"

@class BJImageCropper;
@interface CropViewController : ParentViewController

@property(nonatomic,strong)UIImageView *editIV;
@property (nonatomic, strong) BJImageCropper *imageCropper;

@property(nonatomic,strong)UIButton *backBtn;

@end
