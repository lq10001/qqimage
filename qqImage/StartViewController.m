

#import "StartViewController.h"

#define kEDIT_TAG       100
#define kCOLLECT_TAG    110
#define kCAMERA_TAG     120


@interface StartViewController ()

@end

@implementation StartViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationController.navigationBarHidden = YES;

    UIImageView *bg =  [TKGlobal getImageView:@"frontpage_bg"];
    [self.view addSubview:bg];
    
    UIImageView *logo = [TKGlobal getImageView:@"frontpage_logo_en"];
    logo.center = CGPointMake(260, 50);
    [self.view addSubview:logo];
    
    
    UIButton *editBtn = [TKGlobal getButton:@"frontpage_button_edit" highlightName:@"frontpage_button_edit_down" target:self selector:@selector(onDo:)];
    editBtn.tag = kEDIT_TAG;
    editBtn.center = CGPointMake(260, 120);
    [self.view addSubview:editBtn];
    
    UIButton *collectBtn = [TKGlobal getButton:@"frontpage_button_collage" highlightName:@"frontpage_button_collage_down" target:self selector:@selector(onDo:)];
    collectBtn.tag = kCOLLECT_TAG;
    collectBtn.center = CGPointMake(260, 220);
    [self.view addSubview:collectBtn];
    
    UIButton *cameraBtn = [TKGlobal getButton:@"frontpage_button_camera" highlightName:@"frontpage_button_camera_down" target:self selector:@selector(onDo:)];
    cameraBtn.tag = kCAMERA_TAG;
    cameraBtn.center = CGPointMake(260, 320);
    [self.view addSubview:cameraBtn];
    
        
    UIButton *settingBtn = [TKGlobal getButton:@"frontpage_button_setting" highlightName:@"frontpage_button_setting_down" target:self selector:@selector(onSetting)];
    settingBtn.center = CGPointMake(60, 420);
    [self.view addSubview:settingBtn];
    
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)onSetting
{
    DLog(@"setting");
}

- (void)onDo:(UIButton*)btn
{
    switch (btn.tag) {
        case kEDIT_TAG:
            DLog(@"Edit");
            [self openAlbum];
            break;
        case kCOLLECT_TAG:
            DLog(@"Cll;ect");
            break;
        case kCAMERA_TAG:
            DLog(@"camera");
            [self openCamera];
            break;
        default:
            break;
    }
}

- (void)openAlbum
{
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.allowsEditing = NO;
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        [self presentModalViewController:picker animated:YES];
    }else{
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:@"连接到图片库错误"
                              message:@""
                              delegate:nil
                              cancelButtonTitle:@"确定"
                              otherButtonTitles:nil];
        [alert show];
    }
}

- (void)openCamera
{
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.allowsEditing = NO;
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        [self presentModalViewController:picker animated:YES];
    }else{
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:@"连接到图片库错误"
                              message:@""
                              delegate:nil
                              cancelButtonTitle:@"确定"
                              otherButtonTitles:nil];
        [alert show];
    }
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    [UserInfoManager sharedUserInfo].maxImage = image;
    [[ViewManager sharedViewManager] goMainView];
    [picker dismissModalViewControllerAnimated:YES];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
