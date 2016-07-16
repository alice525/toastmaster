// Generated by the protocol buffer compiler.  DO NOT EDIT!
// source: user.proto

// This CPP symbol can be defined to use imports that match up to the framework
// imports needed when using CocoaPods.
#if !defined(GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS)
 #define GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS 0
#endif

#if GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS
 #import <Protobuf/GPBProtocolBuffers.h>
#else
 #import "GPBProtocolBuffers.h"
#endif

#if GOOGLE_PROTOBUF_OBJC_GEN_VERSION != 30001
#error This file was generated by a different version of protoc which is incompatible with your Protocol Buffer library sources.
#endif

// @@protoc_insertion_point(imports)

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

CF_EXTERN_C_BEGIN

NS_ASSUME_NONNULL_BEGIN

#pragma mark - UserRoot

/// Exposes the extension registry for this file.
///
/// The base class provides:
/// @code
///   + (GPBExtensionRegistry *)extensionRegistry;
/// @endcode
/// which is a @c GPBExtensionRegistry that includes all the extensions defined by
/// this file and all files that it depends on.
@interface UserRoot : GPBRootObject
@end

#pragma mark - PBUser

typedef GPB_ENUM(PBUser_FieldNumber) {
  PBUser_FieldNumber_UserId = 1,
  PBUser_FieldNumber_Nick = 2,
  PBUser_FieldNumber_Avatar = 3,
  PBUser_FieldNumber_Password = 7,
  PBUser_FieldNumber_Email = 8,
  PBUser_FieldNumber_Mobile = 9,
  PBUser_FieldNumber_QqOpenId = 10,
  PBUser_FieldNumber_SinaId = 11,
  PBUser_FieldNumber_WeixinId = 12,
};

@interface PBUser : GPBMessage

/// 用户ID
@property(nonatomic, readwrite, copy, null_resettable) NSString *userId;

/// 用户昵称
@property(nonatomic, readwrite, copy, null_resettable) NSString *nick;

/// 用户头像
@property(nonatomic, readwrite, copy, null_resettable) NSString *avatar;

@property(nonatomic, readwrite, copy, null_resettable) NSString *password;

@property(nonatomic, readwrite, copy, null_resettable) NSString *email;

/// 手机号码
@property(nonatomic, readwrite, copy, null_resettable) NSString *mobile;

/// QQ ID
@property(nonatomic, readwrite, copy, null_resettable) NSString *qqOpenId;

/// SINA UserID
@property(nonatomic, readwrite, copy, null_resettable) NSString *sinaId;

/// WeChat UserID
@property(nonatomic, readwrite, copy, null_resettable) NSString *weixinId;

@end

NS_ASSUME_NONNULL_END

CF_EXTERN_C_END

#pragma clang diagnostic pop

// @@protoc_insertion_point(global_scope)
