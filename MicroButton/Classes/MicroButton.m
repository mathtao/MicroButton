//
//  MicroButton.m
//  Mirco
//
//  Created by mathtao on 2018/1/15.
//  Copyright © 2018年 mathtao. All rights reserved.
//

#import "MicroButton.h"

@interface MicroButton()
@property(nonatomic,copy)microButtonCallBack buttonCallBack;
@property(nonatomic,assign)BOOL startRecord;
@property(nonatomic,assign)CGFloat startCenterX;
@property(nonatomic,assign)CGFloat startCenterY;
@property(nonatomic,strong)CAShapeLayer *circleSmall;
@property(nonatomic,strong)CAShapeLayer *circleBig;
@end

@implementation MicroButton

- (instancetype)initMicroButtonWithFrame:(CGRect)frame callBack:(microButtonCallBack)callBack
{
    if (self=[super initWithFrame:frame]) {
        _startCenterX = frame.size.width/2.f+6.f;
        _startCenterY = frame.size.height/2.f-18.f;
        _buttonCallBack = callBack;
        _startRecord = NO;
        [self initData];
    }
    return self;
}

- (void)initData
{
    NSBundle *bundle = [NSBundle bundleForClass:[MicroButton class]];
    UIImage *ic = [UIImage imageNamed:@"MicroButton.bundle/micro_ic" inBundle:bundle compatibleWithTraitCollection:nil];
    [self setImage:ic forState:UIControlStateNormal];
    [self setImage:ic forState:UIControlStateHighlighted];
    [self addTarget:self action:@selector(clickedButton:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.layer addSublayer:self.circleSmall];
    [self.layer addSublayer:self.circleBig];
}

#pragma mark -action
- (void)clickedButton:(id)sender
{
    self.startRecord = !self.startRecord;
    if (self.buttonCallBack) {
        self.buttonCallBack(self.startRecord);
    }
    
    if (self.startRecord) {
        [self addAnimation];
    }else{
        [self removeAnimation];
    }
}

- (void)removeAnimation
{
    [self.circleSmall removeAllAnimations];
    [self.circleBig removeAllAnimations];
}

- (void)addAnimation
{
    [self.circleSmall addAnimation:[self flashAnimition] forKey:nil];
    __weak typeof(self) ws = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.05 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [ws.circleBig addAnimation:[ws flashAnimition] forKey:nil];
    });
}

#pragma mark - animation
- (CABasicAnimation *)flashAnimition
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"hidden"];
    animation.fromValue = @(1);
    animation.toValue = @(0);
    animation.duration = 0.3f;
    animation.autoreverses = YES;
    animation.repeatCount = MAXFLOAT;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    
    return animation;
}

#pragma mark - lazy
- (CAShapeLayer *)circleSmall
{
    if (!_circleSmall) {
        _circleSmall = [self getShapeLayer:NO];
    }
    
    return _circleSmall;
}

- (CAShapeLayer *)circleBig
{
    if (!_circleBig) {
        _circleBig = [self getShapeLayer:YES];
    }
    
    return _circleBig;
}

- (CAShapeLayer *)getShapeLayer:(BOOL)isBig
{
    CAShapeLayer *circle = [[CAShapeLayer alloc] init];
    circle.hidden = YES;
    CGMutablePathRef path = CGPathCreateMutable();
    if (isBig) {
        CGPathAddArc(path, NULL, _startCenterX+4, _startCenterY-4, 10, -M_PI_2, 0, NO);
    }else {
        CGPathAddArc(path, NULL, _startCenterX, _startCenterY, 6, -M_PI_2, 0, NO);
    }
    circle.path = path;
    CGPathRelease(path);
    circle.strokeColor = [UIColor whiteColor].CGColor;
    circle.fillColor = nil;
    circle.lineWidth = 3.f;
    circle.lineCap = kCALineCapRound;
    return circle;
}

@end
