#ios-ZLActionView
自定义提示框

#项目背景
需求:app中文章详情页面。用户阅读文章超过设定好的分钟可以奖励积分，到了奖励时间时从底部弹出一个 黑色背景（有一定透明度）白色文字的提示框，显示两秒自动消失，文字显示的最大宽度已做自适应，适合显示少量的提示内容，建议不超过30个字

#效果
![image](http://otl186dvj.bkt.clouddn.com/ZLActionView.gif)

使用方法:
- 引入: #import "ZLActionView.h"
- 实现: 
- + (void)showActionAtView:(UIView *)view text:(NSString *)text animated:(BOOL)animated;
- 例如：
[ZLActionView showActionAtView:self(需要显示view对象) text:@"提交"(需要显示的文字内容) animated:YES];

- 有问题欢迎反馈!

