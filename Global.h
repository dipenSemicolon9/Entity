//
//  Global.h
//  iOSCodeStructure
//
//  Created by Nishant
//  Copyright (c) 2012 Nishant. All rights reserved.
//

//Device Compatibility
#define g_IS_IPHONE             ( [[[UIDevice currentDevice] model] isEqualToString:@"iPhone"] )
#define g_IS_IPOD               ( [[[UIDevice currentDevice] model] isEqualToString:@"iPod touch"] )
#define g_IS_IPAD               ( [[[UIDevice currentDevice] model] isEqualToString:@"iPad"] )

#define FontHelveticaNeueLTStdLtWithSize(d) [UIFont fontWithName:@"HelveticaNeueLTStd-Lt" size:d]

//Amplitude-Medium
//Amplitude-Bold
//Amplitude-Book

#define CustomFontBoldWithSize(d) [UIFont fontWithName:@"Amplitude-Bold" size:d]
#define CustomFontBookWithSize(d) [UIFont fontWithName:@"Amplitude-Book" size:d]
#define CustomFontMediumWithSize(d) [UIFont fontWithName:@"Amplitude-Medium" size:d]

#define CustomFontMedium @"Amplitude-Medium"

//Color
#define RGB(r, g, b)            [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]

//#define DISTRIBUTION_APP_STORE_ENVIRONMENT
//http://52.10.169.252/index.php/ws/user/user_profile?user_id=1
#define g_BaseURL @"http://52.10.169.252/ws/"
//#define g_BaseURL @"http://topsdemo.in/mit/setup_app/ws/"
//#define g_BaseURL @"http://192.168.0.143/setup_app/trunk/ws/"

#ifdef DISTRIBUTION_APP_STORE_ENVIRONMENT
    #define ITMS_VERIFY_RECEIPT_URL     @"http://zubrax.com/addmefast/ws/verifyReceipt.php?testing=0";
#else
    #define ITMS_VERIFY_RECEIPT_URL     @"http://zubrax.com/addmefast/ws/verifyReceipt.php?testing=1";
#endif
#define hide_after_ajnotification 5
#define SavedHTTPCookiesKey @"SavedHTTPCookies"

#define g_IS_IPHONE_4_SCREEN    [[UIScreen mainScreen] bounds].size.height >= 480.0f && [[UIScreen mainScreen] bounds].size.height < 568.0f
#define g_IS_IPHONE_5_SCREEN    [[UIScreen mainScreen] bounds].size.height >= 568.0f && [[UIScreen mainScreen] bounds].size.height < 667.0f
#define g_IS_IPHONE_6_SCREEN    [[UIScreen mainScreen] bounds].size.height >= 667.0f && [[UIScreen mainScreen] bounds].size.height < 736.0f
#define g_IS_IPHONE_6P_SCREEN    [[UIScreen mainScreen] bounds].size.height >= 736.0f && [[UIScreen mainScreen] bounds].size.height < 1024.0f

#define g_IS_IOS_8 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
#define g_IS_IOS_7 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
#define g_IS_IOS_6 ([[[UIDevice currentDevice] systemVersion] floatValue] < 7.0)

//nsuserDefault
#define deviceToken @"deviceToken"
#define Latitude @"Latitude"
#define Longitude @"Longitude"
#define userFBname @"userFBname"
#define userFBemail @"userFBemail"
#define userFBGender @"userFBGender"
#define userFBId @"userFBId"
#define userFBbirthday @"userFBbirthday"
#define userFBprofileimage @"userFBprofileimage"

#define LoginUserInfo @"userInfo"
#define LoginUserRequest @"userRequest"


//nsuser default
#define LogoutNotification @"1"
#define notificationRefresh @"1001"
#define notificationtableRefresh @"1002"
#define notificationRequestRefresh @"1003"
#define chatRefresh @"1004"


