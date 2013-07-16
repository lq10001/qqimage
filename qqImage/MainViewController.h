

#import <UIKit/UIKit.h>
#import "ParentViewController.h"

@interface MainViewController : ParentViewController
{
    int rotate;
    int hflip;
    int vflip;
}

@property(nonatomic,strong)UIImageView *editIV;
@property(nonatomic,strong)UIScrollView *tabSV;

@property(nonatomic,strong)UIView *rotateView;
@property(nonatomic,strong)UIScrollView *effectSV;
@property(nonatomic,strong)UIScrollView *frameSV;

@property(nonatomic,strong)UIButton *backBtn;



@end
