//
//  Config.h
//  HelpFriends
//
//  Created by magic on 15/11/2.
//  Copyright (c) 2015年 magic. All rights reserved.
//

#ifdef DEBUG
#define DLog(fmt, ...)              NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#define DLog(...)
#endif


#define KScreenHeight  [[UIScreen mainScreen] bounds].size.height
#define KScreenWidth  [[UIScreen mainScreen] bounds].size.width