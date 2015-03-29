//
//  SXXMPPTools.h
//  98 - QQQ
//
//  Created by 董 尚先 on 15/2/21.
//  Copyright (c) 2015年 shangxianDante. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XMPPFramework.h"

// 用户名
extern NSString *const SXLoginUserNameKey;
// 密码
extern NSString *const SXLoginPasswordKey;
// 主机名
extern NSString *const SXLoginHostnameKey;

// 登录结果通知(成功／失败)
extern NSString *const SXLoginResultNotification;

@interface SXXMPPTools : NSObject

// 是否是注册用户的标记
@property (nonatomic, assign) BOOL isRegisterUser;

/** xmpp流 */
@property(nonatomic,strong,readonly) XMPPStream * xmppStream;

@property(nonatomic,strong) XMPPRoster *xmppRoster;
@property(nonatomic,strong) XMPPRosterCoreDataStorage * xmppRosterCoreDataStorage;

/** 消息归档 */
@property (nonatomic, strong, readonly) XMPPMessageArchiving *xmppMessageArchiving;
/** 消息归档存储 */
@property (nonatomic, strong, readonly) XMPPMessageArchivingCoreDataStorage *xmppMessageArchivingCoreDataStorage;


+ (instancetype)sharedXMPPTools;

- (BOOL)connectionWithFailed:(void (^)(NSString *errorMessage))failed;

- (void)disconnect;

// $$$$$
- (void)logout;

@end
