

#import "CropViewController.h"
#import "BJImageCropper.h"


@interface CropViewController ()

@end

@implementation CropViewController

@synthesize editIV;
@synthesize backBtn;
@synthesize imageCropper;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.imageCropper = [[BJImageCropper alloc] initWithImage:[UserInfoManager sharedUserInfo].maxImage andMaxSize:CGSizeMake(320, 480)];
    [self.view addSubview:self.imageCropper];
    self.imageCropper.center = self.view.center;
    self.imageCropper.imageView.layer.shadowColor = [[UIColor blackColor] CGColor];
    self.imageCropper.imageView.layer.shadowRadius = 3.0f;
    self.imageCropper.imageView.layer.shadowOpacity = 0.8f;
    self.imageCropper.imageView.layer.shadowOffset = CGSizeMake(1, 1);
    

    
    
    self.backBtn= [TKGlobal getButton:@"button_back_normal" highlightName:@"button_back_pressed" target:self selector:@selector(onBack)];
    self.backBtn.center = CGPointMake(30, 30);
    [self.view addSubview:self.backBtn];
    
    /*
    [self.imageCropper addObserver:self forKeyPath:@"crop" options:NSKeyValueObservingOptionNew context:nil];
    
    if (SHOW_PREVIEW) {
        self.preview = [[UIImageView alloc] initWithFrame:CGRectMake(10,10,self.imageCropper.crop.size.width * 0.1, self.imageCropper.crop.size.height * 0.1)];
        self.preview.image = [self.imageCropper getCroppedImage];
        self.preview.clipsToBounds = YES;
        self.preview.layer.borderColor = [[UIColor whiteColor] CGColor];
        self.preview.layer.borderWidth = 2.0;
        [self.view addSubview:self.preview];
    }
     */
}

#pragma mark - View lifecycle
/*
- (void)updateDisplay {
    self.boundsText.text = [NSString stringWithFormat:@"(%f, %f) (%f, %f)", CGOriginX(self.imageCropper.crop), CGOriginY(self.imageCropper.crop), CGWidth(self.imageCropper.crop), CGHeight(self.imageCropper.crop)];
    
    if (SHOW_PREVIEW) {
        self.preview.image = [self.imageCropper getCroppedImage];
        self.preview.frame = CGRectMake(10,10,self.imageCropper.crop.size.width * 0.1, self.imageCropper.crop.size.height * 0.1);
    }
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if ([object isEqual:self.imageCropper] && [keyPath isEqualToString:@"crop"]) {
        [self updateDisplay];
    }
}
*/
- (void)onBack
{
    [[ViewManager sharedViewManager] goPreVC];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
