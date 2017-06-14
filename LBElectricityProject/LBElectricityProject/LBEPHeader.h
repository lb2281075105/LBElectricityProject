//
//  LBEPHeader.h
//  LBElectricityProject
//
//  Created by 云媒 on 2017/5/3.
//  Copyright © 2017年 刘博. All rights reserved.
//

///宏定义

///判断是不是开发、调试状态，如果是开发、调试状态，就让SXTLog替换NSLog
#ifdef DEBUG
///SXTLog是不限制参数的，中间用三个英文句号表示
#define LBEPLog(...) NSLog(__VA_ARGS__)
///如果是发布状态SXTLog就直接为空
#elif     
#define LBEPLog(...)
#endif

