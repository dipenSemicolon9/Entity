//
//  FriendListShare.h
//  Setup
//
//  Created by Tops on 1/27/15.
//  Copyright (c) 2015 Tops. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FriendListShare : NSObject
{
    NSString *user_id;
    NSString *name;
    NSString *profileimage;
    NSString *type;
}
@property (nonatomic, strong) NSString *user_id;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *profileimage;
@property (nonatomic, strong) NSString *type;
-(id) init;

@end
