

#import "MainViewController.h"
#import "ImageUtil.h"
#import "ColorMatrix.h"
#import "UMSocialSnsService.h"

#define kTAB_TAG            100
#define kROTATE_TAG         200

@interface MainViewController ()

@end

@implementation MainViewController

@synthesize editIV;
@synthesize tabSV;
@synthesize effectSV;
@synthesize frameSV;
@synthesize rotateView;
@synthesize backBtn;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    rotate = 1;
    hflip = 0;
    vflip = 0;
    
    self.editIV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height)];
    self.editIV.contentMode = UIViewContentModeScaleAspectFit;
    self.editIV.image = [UserInfoManager sharedUserInfo].maxImage;
    [self.view addSubview:self.editIV];
    
    
    self.tabSV = [[UIScrollView alloc] initWithFrame:CGRectMake(0, self.view.height - 50, self.view.width, 50)];
    self.tabSV.backgroundColor=[UIColor clearColor];
    self.tabSV.showsVerticalScrollIndicator=NO;
    self.tabSV.showsHorizontalScrollIndicator=NO;
    self.tabSV.scrollEnabled=YES;
    self.tabSV.bounces = NO;
    
    int i = 0;
    for (NSString *name in [self tabArray])
    {
        UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(i * 60, 0, 60, 50)];
        view1.backgroundColor = [UIColor clearColor];
        [self.tabSV addSubview:view1];
        
        UIButton *btn = [TKGlobal getButton:name highlightName:name target:self selector:@selector(onEdit:)];
        btn.tag = kTAB_TAG + i;
        btn.center = CGPointMake(view1.width * 0.5,view1.height * 0.5);
        [view1 addSubview:btn];
        i++;
    }
    self.tabSV.contentSize=CGSizeMake(60 * i,self.tabSV.height);
    [self.view addSubview:self.tabSV];
    
    //add rotateview
    
    self.rotateView = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.height - 60, self.view.width - 80, 60)];
    self.rotateView.centerX = self.view.centerX;
    self.rotateView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.rotateView];
    self.rotateView.hidden = YES;
    
    
    //add effect
    self.effectSV = [[UIScrollView alloc] initWithFrame:CGRectMake(0, self.view.height - 80, self.view.width, 80)];
    self.effectSV.backgroundColor=[UIColor clearColor];
    self.effectSV.showsVerticalScrollIndicator=NO;
    self.effectSV.showsHorizontalScrollIndicator=NO;
    self.effectSV.scrollEnabled=YES;
    self.effectSV.bounces = NO;
    
    for (i = 1; i <= 14 ;i++) {

        UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake((i -1) * 80, 0, 80, 80)];
        view1.backgroundColor = [UIColor clearColor];
        [self.effectSV addSubview:view1];
        
        NSString *name = [NSString stringWithFormat:@"filter_button_%i",i];
        
        UIButton *btn = [TKGlobal getButton:name highlightName:name target:self selector:@selector(onEffect:)];
        btn.tag = i;
        btn.center = CGPointMake(view1.width * 0.5,view1.height * 0.5);
        [view1 addSubview:btn];
    }
    self.effectSV.contentSize=CGSizeMake(80 * 14,self.effectSV.height);
    self.effectSV.hidden = YES;
    [self.view addSubview:self.effectSV];
    
    
    //    self.rotateView.layer.borderColor = [[UIColor redColor] CGColor];
    //    self.rotateView.layer.borderWidth = 1.0f;

    
    int w = self.rotateView.width / 4;
    DLog(@" %i ",w);
    int rotateIndex = 0;
    for (NSString *name in [self rotateArray]){
        UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(rotateIndex * w, 0, w, 60)];
        view1.backgroundColor = [UIColor clearColor];
        [self.rotateView addSubview:view1];
        
        UIButton *rotateBtn = [TKGlobal getButton:name highlightName:name target:self selector:@selector(onRotate:)];
        rotateBtn.tag = kROTATE_TAG + rotateIndex;
        rotateBtn.center = CGPointMake(view1.width * 0.5,view1.height * 0.5);
        [view1 addSubview:rotateBtn];
        rotateIndex++;
    }
    
    
    //add Frame
    self.frameSV = [[UIScrollView alloc] initWithFrame:CGRectMake(0, self.view.height - 80, self.view.width, 80)];
    self.frameSV.backgroundColor=[UIColor clearColor];
    self.frameSV.showsVerticalScrollIndicator=NO;
    self.frameSV.showsHorizontalScrollIndicator=NO;
    self.frameSV.scrollEnabled=YES;
    self.frameSV.bounces = NO;
    
    for (i = 1; i <= 2 ;i++) {
        
        UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake((i -1) * 80, 0, 80, 80)];
        view1.backgroundColor = [UIColor clearColor];
        [self.frameSV addSubview:view1];
        
        NSString *name = [NSString stringWithFormat:@"frame%i_icon",i];
        
        UIButton *btn = [TKGlobal getButton:name highlightName:name target:self selector:@selector(onFrame:)];
        btn.tag = i;
        btn.center = CGPointMake(view1.width * 0.5,view1.height * 0.5);
        [view1 addSubview:btn];
    }
    self.frameSV.contentSize=CGSizeMake(80 * 14,self.frameSV.height);
    self.frameSV.hidden = YES;
    [self.view addSubview:self.frameSV];

    
    self.backBtn= [TKGlobal getButton:@"button_back_normal" highlightName:@"button_back_pressed" target:self selector:@selector(onBack)];
    self.backBtn.center = CGPointMake(30, 30);
    [self.view addSubview:self.backBtn];
    
    UIView *saveView = [[UIView alloc] initWithFrame:CGRectMake(self.view.width - 100,10, 85,33)];
    saveView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:saveView];
    
    UIButton *saveBtn = [TKGlobal getButton:@"button_save_normal" highlightName:@"button_save_pressed" target:self selector:@selector(onSave)];
    saveBtn.center = CGPointMake(saveView.width * 0.5, saveView.height * 0.5);
    [saveView addSubview:saveBtn];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    self.tabSV.hidden = NO;
}

- (NSArray*)tabArray
{
    NSArray *array = [[NSArray alloc] initWithObjects:
                      @"tab_rorate_normal",
                      @"tab_effect_normal",
                      @"tab_color_normal",
                      @"tab_crop_normal",
                      @"tab_frame_normal",
                      @"tab_beauty_normal",
                      @"tab_doodle_normal",
                      @"tab_text_normal",
                      nil];
    return array;
}

- (NSArray*)rotateArray
{
    NSArray *array = [[NSArray alloc] initWithObjects:
                      @"rotate_left",
                      @"rotate_right",
                      @"rotate_hflip",
                      @"rotate_vflip",
                      nil];
    return array;
}

- (void)onEdit:(UIButton*)btn
{
    switch (btn.tag) {
        case kTAB_TAG:
            DLog(@"rotate");
            self.tabSV.hidden = YES;
            self.rotateView.hidden = NO;
            break;
        case kTAB_TAG + 1:
            DLog("effect");
            self.tabSV.hidden = YES;
            self.effectSV.hidden = NO;
            break;
        case kTAB_TAG + 2:
            DLog("filter");
            self.tabSV.hidden = YES;
            [[ViewManager sharedViewManager] goFilterView];
            break;
        case kTAB_TAG + 3:
            DLog("crop");
            self.tabSV.hidden = YES;
            [[ViewManager sharedViewManager] goCropView];
            break;
        case kTAB_TAG + 4:
            DLog("frame");
            self.tabSV.hidden = YES;
            self.frameSV.hidden = NO;
            break;
        default:
            break;
    }
}

- (void)onRotate:(UIButton*)btn
{
    UIImageOrientation orientation = UIImageOrientationLeft;
    switch (btn.tag) {
        case kROTATE_TAG:
            rotate -= 1;
            rotate = (rotate <=0 ) ? (4 + rotate) : rotate;
            
            orientation = UIImageOrientationLeft;            
            break;
        case kROTATE_TAG + 1:
            rotate += 1;
            rotate = (rotate > 4 ) ? (rotate - 4) : rotate;
            orientation = UIImageOrientationRight;
            break;
        case kROTATE_TAG + 2:
            hflip =  (hflip + 1) % 2;
            orientation = UIImageOrientationDownMirrored;
            break;
        case kROTATE_TAG + 3:
            vflip =  (vflip + 1 ) % 2;
            orientation = UIImageOrientationUpMirrored;
            break;
    }
    DLog(@" %i %i %i",rotate,hflip,vflip);
    self.editIV.image = [UIImage imageWithCGImage:[UserInfoManager sharedUserInfo].maxImage.CGImage
                                            scale:1.0 orientation: [self calRotate]];
}

- (UIImageOrientation)calRotate
{
    UIImageOrientation orientation = UIImageOrientationUp;
    if (vflip ==0 && hflip == 0) {
        if (rotate == 1) {
            orientation = UIImageOrientationUp;
        }else if(rotate == 2){
            orientation = UIImageOrientationRight;
        }else if(rotate == 3){
            orientation = UIImageOrientationDown;
        }else if(rotate == 4){
            orientation = UIImageOrientationLeft;
        }
    }else if(vflip == 1 && hflip == 0){
        if (rotate == 1) {
            orientation = UIImageOrientationDownMirrored;
        }else if(rotate == 2){
            orientation = UIImageOrientationRightMirrored;
        }else if(rotate == 3){
            orientation = UIImageOrientationUpMirrored;
        }else if(rotate == 4){
            orientation = UIImageOrientationLeftMirrored;
        }
    }else{
        if (rotate == 1) {
            orientation = UIImageOrientationUpMirrored;
        }else if(rotate == 2){
            orientation = UIImageOrientationLeftMirrored;
        }else if(rotate == 3){
            orientation = UIImageOrientationDownMirrored;
        }else if(rotate == 4){
            orientation = UIImageOrientationRightMirrored;
        }
    }
    return orientation;
}

- (void)onEffect:(UIButton*)btn
{
    switch (btn.tag -1) {
        case 0:
        {
            self.editIV.image = [UserInfoManager sharedUserInfo].maxImage;
        }
            break;
        case 1:
        {
            self.editIV.image = [ImageUtil imageWithImage:[UserInfoManager sharedUserInfo].maxImage withColorMatrix:colormatrix_lomo];
        }
            break;
        case 2:
        {
            self.editIV.image = [ImageUtil imageWithImage:[UserInfoManager sharedUserInfo].maxImage withColorMatrix:colormatrix_heibai];
        }
            break;
        case 3:
        {
            self.editIV.image = [ImageUtil imageWithImage:[UserInfoManager sharedUserInfo].maxImage withColorMatrix:colormatrix_huajiu];
        }
            break;
        case 4:
        {
            self.editIV.image = [ImageUtil imageWithImage:[UserInfoManager sharedUserInfo].maxImage withColorMatrix:colormatrix_gete];
        }
            break;
        case 5:
        {
            self.editIV.image = [ImageUtil imageWithImage:[UserInfoManager sharedUserInfo].maxImage withColorMatrix:colormatrix_ruise];
        }
            break;
        case 6:
        {
            self.editIV.image = [ImageUtil imageWithImage:[UserInfoManager sharedUserInfo].maxImage withColorMatrix:colormatrix_danya];
        }
            break;
        case 7:
        {
            self.editIV.image = [ImageUtil imageWithImage:[UserInfoManager sharedUserInfo].maxImage withColorMatrix:colormatrix_jiuhong];
        }
            break;
        case 8:
        {
            self.editIV.image = [ImageUtil imageWithImage:[UserInfoManager sharedUserInfo].maxImage withColorMatrix:colormatrix_qingning];
            
        }
            break;
        case 9:
        {
            self.editIV.image = [ImageUtil imageWithImage:[UserInfoManager sharedUserInfo].maxImage withColorMatrix:colormatrix_langman];
        }
            break;
        case 10:
        {
            self.editIV.image = [ImageUtil imageWithImage:[UserInfoManager sharedUserInfo].maxImage withColorMatrix:colormatrix_guangyun];
        }
            break;
        case 11:
        {
            self.editIV.image = [ImageUtil imageWithImage:[UserInfoManager sharedUserInfo].maxImage withColorMatrix:colormatrix_landiao];
        }
            break;
        case 12:
        {
            self.editIV.image = [ImageUtil imageWithImage:[UserInfoManager sharedUserInfo].maxImage withColorMatrix:colormatrix_menghuan];
        }
            break;
        case 13:
        {
            self.editIV.image = [ImageUtil imageWithImage:[UserInfoManager sharedUserInfo].maxImage withColorMatrix:colormatrix_yese];
        }
        default:
            break;
    }
}

- (void)onFrame:(UIButton*)btn
{
    DLog(@" onFrame ");
    UIImage *frameImage = [UIImage imageNamed:[NSString stringWithFormat:@"frame%i.png",btn.tag]];
    UIImage *currImage = [UserInfoManager sharedUserInfo].maxImage;
    DLog(@" %@ ",NSStringFromCGSize(currImage.size));
    UIGraphicsBeginImageContext(currImage.size);
    [currImage drawInRect:CGRectMake(0,0,currImage.size.width,currImage.size.height)];
    [frameImage drawInRect:CGRectMake(0,0,currImage.size.width,currImage.size.height)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.editIV.image = newImage;
}

- (void)onSave
{
    UMSocialData *socialData = [[UMSocialData alloc] initWithIdentifier:@"UMSocialSDK" withTitle:nil];
    socialData.shareText = @"test";
    socialData.shareImage =[UserInfoManager sharedUserInfo].maxImage;
    
    UMSocialControllerService *socialControllerService = [[UMSocialControllerService alloc] initWithUMSocialData:socialData];
    UINavigationController *shareListController = [socialControllerService getSocialShareListController];
    [self presentModalViewController:shareListController animated:YES];
    
    
//    [UMSocialSnsService presentSnsController:self appKey:@"" shareText:@"test" shareImage:[UserInfoManager sharedUserInfo].maxImage shareToSnsNames: delegate:self];
}

- (void)onBack
{
    if (self.tabSV.hidden) {
        self.tabSV.hidden = NO;
        self.rotateView.hidden = YES;
        self.effectSV.hidden = YES;
        self.frameSV.hidden = YES;
        self.editIV.image = [UserInfoManager sharedUserInfo].maxImage;
    }else{
        [[ViewManager sharedViewManager] goStartVC];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
