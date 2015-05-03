//
//  Singleton.h
//  InstagramApp
//
//  Created by Webinfoways on 15/02/13.
//  Copyright (c) 2013 WebPlanex. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Singleton : NSObject {
    int intBgImageIncCount;
    BOOL boolSupportedOrientationFlag;
    
}

@property (nonatomic, assign) int intBgImageIncCount;
@property (nonatomic, assign) BOOL boolSupportedOrientationFlag;
@property (nonatomic, assign) BOOL isLogout;

+ (Singleton *)sharedSingleton;
- (NSString *) getBaseURL;
- (NSString *)getNibName:(NSString *)strNib;

-(NSString *)getUserDefault:(NSString *)pref;
-(void)setUserDefault:(NSString *)myString :(NSString *)pref ;
-(void)setFontFamily:(NSString*)fontFamily forView:(UIView*)view andSubViews:(BOOL)isSubViews
;
-(id)getUserData;
-(void)setUserData:(NSData *)myString;
-(NSMutableDictionary *)getLoginUserData;
@end
