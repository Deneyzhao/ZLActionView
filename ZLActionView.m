//
//  ZLActionView.m
//  kohlerBrandsh
//
//  Created by Deney on 17/10/16.
//  Copyright © 2016年 deney. All rights reserved.
//

#import "ZLActionView.h"
#import "Tools.h"

@interface ActionBG : UIView

@end

@implementation ActionBG


@end

@interface ActionView : UIView

@end

@implementation ActionView


@end


@implementation ZLActionView

#pragma mark - unity
+ (void)showActionAtView:(UIView *)view text:(NSString *)text animated:(BOOL)animated{
    static ZLActionView *_action = nil;
    if (!_action) {
        _action = [[ZLActionView alloc]init];
    }
    [_action showAtView:view text:text animated:animated];
}


#pragma mark - private

- (void)showAtView:(UIView *)view text:(NSString *)text animated:(BOOL)animated{
    CGSize size = [Tools sizeOfStr:text withFont:[UIFont systemFontOfSize:14] withMaxWidth:view.frame.size.width/2 withLineBreakMode:0];
    ActionBG  *bg  = [[ActionBG alloc]initWithFrame:CGRectMake((view.frame.size.width-size.width)/2,view.frame.size.height, size.width+10, 40)];
    bg.backgroundColor = [UIColor blackColor];
    bg.alpha = 0.0;
    bg.layer.cornerRadius = 5.0f;
    [view addSubview:bg];
    
    ActionView * action = [[ActionView alloc]initWithFrame:bg.frame];
    action.alpha = 0.0f;
    [view addSubview:action];
    
    UILabel *textLabel = [[UILabel alloc]initWithFrame:action.bounds];
    textLabel.text = text;
    textLabel.font = [UIFont systemFontOfSize:14];
    textLabel.textColor = [UIColor whiteColor];
    textLabel.textAlignment = NSTextAlignmentCenter;
    [action addSubview:textLabel];
    if (animated) {
        [UIView animateWithDuration:1 animations:^{
            CGRect rect = bg.frame;
            rect.origin.y = view.frame.size.height - 30-70;
            bg.alpha = 0.7f;
            action.alpha = 1.0f;
            bg.frame = rect;
            action.frame = rect;
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:1 delay:1 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                CGRect rect = bg.frame;
                rect.origin.y = view.frame.size.height;
                bg.frame = rect;
                action.frame = rect;
                bg.alpha = 0.0f;
                action.alpha = 0.0f;
            } completion:^(BOOL finished) {
                [bg removeFromSuperview];
                [textLabel removeFromSuperview];
                [action removeFromSuperview];
            }];
        }];
    }

}




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
