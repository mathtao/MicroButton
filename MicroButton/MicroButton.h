//
//  MicroButton.h
//  Mirco
//
//  Created by mathtao on 2018/1/15.
//  Copyright © 2018年 mathtao. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^microButtonCallBack)(BOOL startRecord);
@interface MicroButton : UIButton
- (instancetype)initMicroButtonWithFrame:(CGRect)frame callBack:(microButtonCallBack)callBack;
@end
