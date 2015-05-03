//
//  Singleton.m
//  InstagramApp
//
//  Created by Webinfoways on 15/02/13.
//  Copyright (c) 2013 WebPlanex. All rights reserved.
//

#import "Singleton.h"

@implementation Singleton

static Singleton *singletonObj = NULL;

@synthesize intBgImageIncCount,boolSupportedOrientationFlag;

+ (Singleton *)sharedSingleton {
    @synchronized(self) {
        if (singletonObj == NULL)
            singletonObj = [[self alloc] init];
    }
    return(singletonObj);
}

- (NSString *) getBaseURL {
    return @"http://topsdemo.in/mit/thrillcity/ws/";
}

- (NSString *)getNibName:(NSString *)strNib {
    if (g_IS_IPHONE_4_SCREEN)
        strNib = [strNib stringByAppendingString:@""];
    else if (g_IS_IPHONE_5_SCREEN)
        strNib = [strNib stringByAppendingString:@"_5"];
    else if (g_IS_IPHONE_6_SCREEN)
        strNib = [strNib stringByAppendingString:@"_6"];
    else if (g_IS_IPHONE_6P_SCREEN)
        strNib = [strNib stringByAppendingString:@"_6P"];
    
    return strNib;
}
-(NSString *)getUserDefault:(NSString *)pref{
    NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
    NSString *val = @"";
    
    if (standardUserDefaults)
        val = [standardUserDefaults objectForKey: pref];
    
    return val;
}

-(void)setUserDefault:(NSString *)myString :(NSString *)pref  {
    NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
    
    if (standardUserDefaults) {
        [standardUserDefaults setObject:myString forKey:pref];
        [standardUserDefaults synchronize];
    }
}

-(NSMutableDictionary *)getLoginUserData{
    return [[[NSUserDefaults standardUserDefaults] objectForKey:LoginUserInfo] mutableCopy];
}
-(id)getUserData{
    NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
    id val;
    if (standardUserDefaults)
        val = [standardUserDefaults objectForKey: @"UserData"];
    
    return val;
}
-(void)setUserData:(NSData *)encodedObject{
    NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
    if (standardUserDefaults) {
        [standardUserDefaults setObject:encodedObject forKey:@"UserData"];
        [standardUserDefaults synchronize];
    }
}


#pragma mark- setfont
-(void)setFontFamily:(NSString*)fontFamily forView:(UIView*)view andSubViews:(BOOL)isSubViews
{
    if ([view isKindOfClass:[UILabel class]])
    {
        UILabel *lbl = (UILabel *)view;
        [lbl setFont:[UIFont fontWithName:fontFamily size:[[lbl font] pointSize]]];
        
    }
    if ([view isKindOfClass:[UIButton class]])
    {
        UIButton *btn =(UIButton *)view;
        [btn.titleLabel setFont:[UIFont fontWithName:fontFamily size:[[btn.titleLabel font] pointSize]]];
    }
    
    if (isSubViews)
    {
        for (UIView *sview in view.subviews)
        {
            [self setFontFamily:fontFamily forView:sview andSubViews:YES];
        }
    }
}

@end
