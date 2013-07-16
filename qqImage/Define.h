
#import <sys/utsname.h>


#define kFIRST                  @"kFIRST"
#define kVERSION                @"kVERSION"

#define kSQLITE_FILE_NAME       @"idb.sqlite"

#define kLANGUAGE_FILE_TAG      180
#define kLANGUAGE_FILE_NAME     @"lan"
#define kLANGUAGE_FILE_URL      @"http://liveupdate.toyboxapps.com/movieworld/gown.zip"


#define kDEFAULT_IMAGE_NAME     @"clear"

#define kIPONE_NAME             @"iphone"
#define kIPAD_NAME              @"ipad"

#define kUPDATE_LOW_VERSION     1.6

#define kLABEL_BORDER_SIZE      3
#define kBG_VIEW_ALPHA          0.7f;


#define kANIMATION_LONG2_TIME   1.0f
#define kANIMATION_LONG_TIME    0.618f
#define kANIMATION_SHORT_TIME   0.309f
#define kANIMATION_SCENE_TIME   2.0f

#define kANIMATION_TYPE_COIN    1
#define kANIMATION_TYPE_CASH    2
#define kANIMATION_TYPE_ERENGY  3
#define kANIMATION_TYPE_FAME    2

//#define kFLURRYKEY              @"CV2PNNKD3TJFCKXXCTX8"
//test
#define kFLURRYKEY              @"TV7FCMJ259G45WVBZHM6" 

#define kCHARTBOOT_KEY          @""
#define kCHARTBOOT_SIGNATURE    @""


#define kGAME_ANALYTICS_KEY     @"4c79f0b320f2900a5fcb11e63f1624bf"
#define kGAME_ANALYTICS_SEC_KEY @"b6c95e5bc9ee72f5903365c796a7417aafed6909"


#define IS_IPAD                 (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE_5             ([UIScreen mainScreen].bounds.size.height == 568)
#define MACRO(a)                (IS_IPAD?a##_IPAD:a)
#define IMG_NAME(name)          (IS_IPAD ? [NSString stringWithFormat:@"%@-hd", name] : name)
#define FEATURE                 (IS_IPAD?kIPAD_NAME:kIPONE_NAME)
#define AUTO_RECT(rect)         (IS_IPAD ? CGRectMake(rect.origin.x * 2,rect.origin.y * 2,rect.size.width * 2,rect.size.height * 2) : rect)
#define AUTO_ORIGIN(origin)     (IS_IPAD ? CGPointMake(origin.x * 2,origin.y * 2) : origin)
#define AUTO_SIZE(size)         (IS_IPAD ? CGSizeMake(size.width * 2,size.height * 2) : size)
#define NUM2(size)              (IS_IPAD ? size * 2 : size)

#define HEIGHT_Y                768 - 640

#define kMUSIC                                  @"kMUSIC"
#define kSOUND                                  @"kSOUND"
#define kNOTIFY                                 @"kNOTIFY"

#define kFONT_NAME                              @"Tw Cen MT Condensed Extra Bold"
#define kFONT_NAME2                             @"Arial"
#define kSCENE_TIME_DIC                         @"SCENE_TIME_DIC"
//Init UserInfo Value

#define kTIME_COUNT                             120
#define kSCENE_SECEND                           5
#define kDEFAULT_INCRESS_ENERGY                 1


#define kDEFAULT_COIN                           200
#define kDEFAULT_CASH                           28
#define kDEFAULT_FAME                           0


#define kDEFAULT_ENERGY                         25
#define kDEFAULT_MAXENERGY                      25
#define kDEFAULT_SALON_CASH                     4
#define kDEFAULT_SCENE_CASH                     1


//Notify
#define kNOTIFY_SAVE_ALLDATA                    @"kNOTIFY_SAVE_ALLDATA"
#define kNOTIFY_SAVE_USERINFO                   @"kNOTIFY_SAVE_USERINFO"
#define kNOTIFY_SAVE_SALON                      @"kNOTIFY_SAVE_SALON"
#define kNOTIFY_SAVE_FIRSTSHOW                  @"kNOTIFY_SAVE_FIRSTSHOW"


#define kNOTIFY_SAVE_SETTING                    @"kNOTIFY_SAVE_SETTING"

//userinfo notify
#define kNOTIFY_TIMER_CHARGING                  @"kNOTIFY_TIMER_CHARGING"
#define kNOTIFY_ENERGY_CHARGING                 @"kNOTIFY_ENERGY_CHARGING"
#define kNOTIFY_ENERGY_VALUE_CHANGED            @"kNOTIFY_ENERGY_VALUE_CHANGED"

#define kNOTIFY_COIN_VALUE_CHANGED              @"kNOTIFY_COIN_VALUE_CHANGED"
#define kNOTIFY_CASH_VALUE_CHANGED              @"kNOTIFY_CASH_VALUE_CHANGED"
#define kNOTIFY_FAME_VALUE_CHANGED              @"kNOTIFY_FAME_VALUE_CHANGED"


#define kPOSTER_IMAGENAME                       @"poster"

//daily
#define kSTARTTIME                              @"kSTARTTIME"
#define kPRESTARTTIME                           @"kPRESTARTTIME"
#define kSTARTDAYS                              @"kSTARTDAYS"

//quest after quest
#define kEARN_COIN                              @"kEARN_COIN"
#define kEARN_COIN_SUM                          @"kEARN_COIN_SUM"
#define kCOMPLETE_SCENE                         @"kCOMPLETE_SCENE"
#define kCOMPLETE_SCENE_SUM                     @"kCOMPLETE_SCENE_SUM"
#define kPAIR_CARD_SUM                          @"kPAIR_CARD_SUM"

#define kBOOTS_TUTORIAL                         @"kBOOTS_TUTORIAL"


//shopid
#define kDEFAULT_ID                             1
#define kSALON_ID                               2
#define kGOWN_ID                                3
#define kHOME_ID                                4

#define kADVEN_ID                               101
#define kCHILDREN_ID                            102
#define kSCIFI_ID                               103
#define kHERO_ID                                104
#define kVIC_ID                                 105

//view
#define kSTUDIOVIEW_TAG                         100
#define kJOBVIEW_TAG                            200
#define kSCENEVIEW_TAG                          300


//categoryId

#define kTOP_CATEGORYID                         1
#define kJACKET_CATEGORYID                      15
#define kVEST_CATEGORYID                        16
#define kBOTTOM_CATEGORYID                      2
#define kDRESS_CATEGORYID                       3
#define kSHOES_CATEGORYID                       4
#define kHAIR_CATEGORYID                        7
#define kHAIRCOLOR_CATEGORYID                   8
#define kMODEL_CATEGORYID                       9
#define kRIGHTHOLD_CATEGORYID                   61

//dress view tag
#define kALLBTN_TAG                             20

#define kCELL_ROW1_TAG                          21
#define kCELL_ROW2_TAG                          22
#define kCELL_LBL_TAG                           29
#define kICON_COMPONENT_TAG                     31
#define kICON_COMPONENT_SEL_TAG                 32
#define kICON_PRICE_TAG                         41
#define kLABEL_PRICE_TAG                        42
#define kICON_HOTNESS_TAG                       51
#define kLABEL_HOTNESS_TAG                      52
#define kICON_BUY_TAG                           61
#define kICON_SOLD_TAG                          62
#define kICON_COMING_TAG                        71
#define kICON_PROCESS_TAG                       72
#define kICON_LOCK_TAG                          73
#define kICON_FAME_TAG                          74
#define kLABEL_FAME_TAG                         75
#define kLOCK_BACK_TAG                          76


//Alert tag
#define kALERT_COIN_NOENOUGH                    10001
#define kALERT_CASH_BUY                         10002
#define kALERT_CASH_NOENOUGH                    10003
#define kALERT_FULL_ENERGY                      10004
#define kALERT_ENERGY_NOENOUGH                  10005
#define kALERT_SCENE_FINISHED                   10006
#define kALERT_NO_PREMIER                       10007
#define kALERT_NO_FULLY_DRESSED                 10008
#define kALERT_FIRST_START                      10009
#define kALERT_FIRST_SALON                      10010
#define kALERT_SALON_CASH_BUY                   10011
#define kALERT_SALON_CASH_NOENOUGH              10012
#define kALERT_DOWNLOAD_FAIL                    10013
#define kALERT_SKIPTASK_BYCASH                  10014
#define kALERT_SCENE_INSTANT                    10015
#define kALERT_BANK_BUYCASH                     10016
#define kALERT_SALON_STYLE                      10017
#define kALERT_SALON_STYLE_END                  10018
#define kALERT_DOWNLOAD_OK                      10019
#define kALERT_WORK_OK                          10020
#define kALERT_FAME_ENOUGH                      10021
#define kALERT_DOWNLOAD_CONFIRM                 10022


#define kALERT_IAP_OK                           10023

#define kALERT_FIRST                            10024
#define kALERT_FIRST_SCENE_PAY                  10025
#define kALERT_CAFE_CASH_BUY                    10026

#define  kALERT_SALON_STYLE_SELED               10027
#define  kALERT_TOTURIAL_SHOP                   10028
#define  kALERT_CAFE_BUYED                      10029
#define kALERT_SCENE_END_FAME_ENOUGH            10030
#define kALERT_PREMIER_END_FAME_ENOUGH          10031
#define kALERT_TOTURIAL_END                     10032
#define kALERT_STUDIO_FIRSTSHOW                 10033
#define kALERT_TUTORIAL_HOME                    10034
#define kALERT_TUTORIAL_CAFE_GO                 10035
#define kALERT_CAFE_CASH_TUTORIAL_BUY           10036
#define kALERT_CASH_TUTORAIL_BUY                10037

#define kALERT_SHOP_FIRST                       10038

#define kALERT_TUTORIAL_HOME_START              10039


//Setting
#define kSETTING_SOUND  YES
#define kSETTING_MUSIC  YES
#define kSETTING_NOTIFY  YES

#define kBG2_TAG                                155

#define kEYE_TAG                                110

#define BLACK_VIEW_TAG                          1055
#define ARROW_VIEW_TAG                          1056



//dress core

#ifndef iDressCore_iDressCore_Config_h
#define iDressCore_iDressCore_Config_h 


//HSV
struct ColorHSV {
	int h;
	int s;
	int v;
};
typedef struct ColorHSV ColorHSV;
static const ColorHSV hsvZero={0,0,0};

static inline BOOL isColorHSVEqual(ColorHSV original,ColorHSV target){if(original.h==target.h&&original.s==target.s&&original.v==target.v)
    return YES ;
else 
    return NO;
}

static ColorHSV ColorHSVFromString(NSString *aString) {
	NSArray *hsvArray=[aString componentsSeparatedByString:@","];
	if ([hsvArray count]!=3) {
		return hsvZero;
	}
	ColorHSV hsvValue;
	hsvValue.h=[[hsvArray objectAtIndex:0] intValue];
	hsvValue.s=[[hsvArray objectAtIndex:1] intValue];
	hsvValue.v=[[hsvArray objectAtIndex:2] intValue];
	return hsvValue;
}

static inline NSString* NSStringFromColorHSV(ColorHSV hsv) { return [NSString stringWithFormat:@"%i,%i,%i",hsv.h, hsv.s, hsv.v]; }


// half rect for image and origin
static inline CGRect getUIFrame(CGSize size, CGPoint origin) {
    
    float width =UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPad?size.width:size.width/2;
    float height =UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPad?size.height:size.height/2;
    origin.x=UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPad?(origin.x/640)*768:origin.x/2;
    origin.y=UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPad?(origin.y/960)*1024:origin.y/2;
    return CGRectMake(origin.x, origin.y, width, height);
}

#define MARGIN_LEFT_PLUS_IPAD   30
#define MARGIN_TOP_PLUS_IPAD    20

static inline CGRect getComponentFrame(CGSize size, CGPoint origin) 
{
    float width =IS_IPAD ? size.width:size.width/2;
    float height = IS_IPAD?size.height:size.height/2;
    CGPoint newOrigin;
    newOrigin.x=IS_IPAD ? (origin.x==0?0:origin.x+MARGIN_LEFT_PLUS_IPAD):origin.x/2;
    newOrigin.y=IS_IPAD ?(origin.y==0?0:origin.y+MARGIN_TOP_PLUS_IPAD):origin.y/2;
    
    return CGRectMake(newOrigin.x, newOrigin.y, width, height);
}

static inline CGRect rectHalfForImage(UIImage *image) {return getUIFrame(image.size, CGPointZero);}


#endif

// DLog is almost a drop-in replacement for NSLog  
// DLog();  
// DLog(@"here");  
// DLog(@"value: %d", x);  
// Unfortunately this doesn't work DLog(aStringVariable); you have to do this instead DLog(@"%@", aStringVariable);  
#ifdef DEBUG  
#   define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);  
#else  
#   define DLog(...)  
#endif  
// ALog always displays output regardless of the DEBUG setting  
#define ALog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);  


