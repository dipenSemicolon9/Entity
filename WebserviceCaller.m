//
//  WebserviceCaller.m
//  BlockPrograming
//
//  Created by Tops on 1/1/15.
//  Copyright (c) 2015 Tops. All rights reserved.
//

#import "WebserviceCaller.h"
#import "MBProgressHUD.h"
#import "AppDelegate.h"
#import "Reachability.h"

@implementation WebserviceCaller{
    AppDelegate *appDel;
}

static WebserviceCaller *singletonObj = NULL;
+ (WebserviceCaller *)sharedSingleton {
    @synchronized(self) {
        if (singletonObj == NULL)
            singletonObj = [[self alloc] init];
    }
    return(singletonObj);
}
- (id) init {
    appDel=(AppDelegate *)[[UIApplication sharedApplication] delegate];
    return self;
}

-(void)baseWscalldispatch:(NSMutableDictionary *)params :(NSString *)fileNameURL
                  success:(WebMasterSuccessBlock)successBlock{
    if ([self isconnectedToNetwork]) {
        NSString *url= [NSString stringWithFormat:@"%@%@",g_BaseURL,fileNameURL];
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        [manager POST:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
            if ([[responseObject objectForKey:@"FLAG"] boolValue]) {
                successBlock(responseObject);
            }else{
                //            [self AjNotificationView:[responseObject objectForKey:@"MESSAGE"]:AJNotificationTypeRed];
            }
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            //        [self AjNotificationView:@"Server Error " :AJNotificationTypeRed];
        }];
    }
}

-(void)BaseWsCall:(NSMutableDictionary *)params :(NSString *)fileNameURL
          success:(WebMasterSuccessBlock)successBlock{
    appDel=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    if ([self isconnectedToNetwork]) {
    NSString *url= [NSString stringWithFormat:@"%@%@",g_BaseURL,fileNameURL];
    [MBProgressHUD showHUDAddedTo:appDel.window animated:YES];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager POST:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [MBProgressHUD hideHUDForView:appDel.window animated:YES];
        if ([[responseObject objectForKey:@"FLAG"] boolValue]) {
            successBlock(responseObject);
        }else{
            [self AjNotificationView:[responseObject objectForKey:@"MESSAGE"]:AJNotificationTypeRed];
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [self AjNotificationView:@"Server Error " :AJNotificationTypeRed];
        [MBProgressHUD hideHUDForView:appDel.window animated:YES];
    }];
    }
}
-(void)baseImageUplaod:(NSMutableDictionary *)params :(NSString *)fileNameURL :(UIImage *)image :(NSString *)tag
                sucess:(WebMasterSuccessBlock)successBlock{

    NSString *url= [NSString stringWithFormat:@"%@%@",g_BaseURL,fileNameURL];
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:url]];
    NSData *imageData = UIImageJPEGRepresentation(image, 0.5);
    AFHTTPRequestOperation *op = [manager POST:url parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        //do not put image inside parameters dictionary as I did, but append it!
        [formData appendPartWithFileData:imageData name:tag fileName:@"photo.jpg" mimeType:@"image/jpeg"];
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"Success: %@ ***** %@", operation.responseString, responseObject);
        successBlock(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];
    [op start];
}


-(void)baseMultipleImageUplaod:(NSMutableDictionary *)params :(NSString *)fileNameURL :(NSArray *)image :(NSArray *)tag
                sucess:(WebMasterSuccessBlock)successBlock{
    
   if ([image count] == [tag count]) {
    NSString *url= [NSString stringWithFormat:@"%@%@",g_BaseURL,fileNameURL];
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:url]];
        AFHTTPRequestOperation *op = [manager POST:url parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
            //do not put image inside parameters dictionary as I did, but append it!
            int i=0;
            for (UIImage *img in image) {
                    NSData *imageData = UIImageJPEGRepresentation(img, 0.5);
                    [formData appendPartWithFileData:imageData name:[tag objectAtIndex:i] fileName:@"photo.jpg"   mimeType:@"image/jpeg"];
                i++;
            }
                } success:^(AFHTTPRequestOperation *operation, id responseObject) {
                        successBlock(responseObject);
                } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                        NSLog(@"%@",error);
                }];
        [op start];
    }
}

-(void)CustomAlert:(NSString *)title message:(NSString *)message OkButtonTitle:(NSString *)OkButtonTitle CancelButtonTitle:(NSString *)CancelButtonTitle success:(SiAlertSuccessBlock)successBlock Failure:(SiAlertCancelBlock)failure{
    
    SIAlertView *alertView = [[SIAlertView alloc] initWithTitle:title andMessage:message];
    [alertView addButtonWithTitle:NSLocalizedString(OkButtonTitle, nil)
                             type:SIAlertViewButtonTypeDefault
                          handler:^(SIAlertView *alertView)
     {
         successBlock();
     }];
    [alertView addButtonWithTitle:NSLocalizedString(CancelButtonTitle, nil)
                             type:SIAlertViewButtonTypeDefault
                          handler:^(SIAlertView *alertView)
     {
         failure();
     }];
    alertView.transitionStyle = SIAlertViewTransitionStyleSlideFromTop;
    [alertView show];
    
}

-(void)AjNotificationView :(NSString *)title :(int)AJNotificationType{
//    UIView *view=[[[[UIApplication sharedApplication] keyWindow] subviews] lastObject];
    [AJNotificationView showNoticeInView:appDel.window type:AJNotificationType title:title linedBackground:AJLinedBackgroundTypeAnimated hideAfter:1.5 offset:0 delay:0 detailDisclosure:YES response:^{
        NSLog(@"Notification Call");
    }];
}

- (BOOL)isconnectedToNetwork {
    //    if([AFNetworkReachabilityManager sharedManager].reachable)
    //        [[AlertView sharedAlertView] showAlertWithOKButton:LocalizedString(@"keyInternetConnectionError", @"")];
    //
    //    return [AFNetworkReachabilityManager sharedManager].reachable;
    
    Reachability *reachability = [Reachability reachabilityForInternetConnection];
    NetworkStatus networkStatus = [reachability currentReachabilityStatus];
    if(networkStatus == NotReachable)
    {
        [self CustomAlert:@"Internet Error" message:@"Please connect to internet" OkButtonTitle:@"OK" CancelButtonTitle:@"Cancel" success:^{
            [self isconnectedToNetwork];
        } Failure:^{
        }];
    }
    return !(networkStatus == NotReachable);
}
@end
