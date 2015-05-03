//
//  ShareObject.h
//  FootballQuizApp
//
//  Created by TopsTech on 20/02/2014.
//  Copyright (c) 2014 TopsTech. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ChatShare : NSObject

@property (nonatomic, strong) NSString *strID;
@property (nonatomic, strong) NSString *strPersonFlag;
@property (nonatomic, strong) NSString *strImage;
@property (nonatomic, strong) NSString *strTime;
@property (nonatomic, strong) NSString *strMessage;
@property (nonatomic) int intFromUserId;
@property (nonatomic) int intToUserId;
@property (nonatomic) int intChatType;


@end
