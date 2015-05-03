//
//  facebookpageShare.h
//  Addmefast
//
//  Created by Tops on 12/17/14.
//  Copyright (c) 2014 Tops. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoginUserShare : NSObject
{
    NSString *UserId;
    NSString *name;
    NSString *profileImage;
    NSString *profileImage1;
    NSString *profileImage2;
    NSString *parentId;
    NSString *age;
}
@property (nonatomic, strong) NSString *UserId;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *profileImage;
@property (nonatomic, strong) NSString *profileImage1;
@property (nonatomic, strong) NSString *profileImage2;
@property (nonatomic, strong) NSString *parentId;
@property (nonatomic, strong) NSString *age;
-(id) init;

@end
