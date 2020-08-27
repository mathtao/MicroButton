# MicroButton
一款简单版本的语音麦克风动画（ps：今天给一个群友写的顺便上传了，后续会慢慢上传一些自己所觉得好玩的小控件）

### ScreenShot
![image](https://github.com/mathtao/Micro/blob/master/micro.gif)

### Usage
```objc
MicroButton *bt = [[MicroButton alloc] initMicroButtonWithFrame:CGRectMake(CGRectGetWidth(self.view.frame)/2.f-94, 100, 188, 188) callBack:^(BOOL startRecord) {
    if (startRecord) {//开始录音
        NSLog(@"<<<<<<<<<<<<<  开始录音  >>>>>>>>>>>>");
    }else{//结束录音
        NSLog(@"<<<<<<<<<<<<< 结束录音 >>>>>>>>>>>>");
    }
}];
```

### Installation

MicroButton is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'MicroButton'
```

### Contact

if you find bug，please pull request me <br>
