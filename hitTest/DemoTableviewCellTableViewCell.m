//
//  DemoTableviewCellTableViewCell.m
//  hitTest
//
//  Created by jinren on 9/24/16.
//  Copyright © 2016 jinren. All rights reserved.
//

#import "DemoTableviewCellTableViewCell.h"



@implementation DemoTableviewCellTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code

}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    self.btn = [UIButton buttonWithType:UIButtonTypeSystem];
    self.btn.frame = CGRectMake(10, 20, 100, 100);
    [self.btn setTitle:@"I am a btn" forState:UIControlStateNormal];
    [self.btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.btn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    self.btn.backgroundColor = [UIColor blueColor];
    self.btn.enabled = NO;
    [self.contentView addSubview:self.btn];
    
    self.tLable = [[UILabel alloc] initWithFrame:CGRectMake(150, 20, 200, 200)];
    self.tLable.text = @"I am a Lable";
    self.tLable.highlightedTextColor = [UIColor redColor];
    self.tLable.textColor = [UIColor blackColor];
    self.tLable.backgroundColor = [UIColor blueColor];
    [self.contentView addSubview:self.tLable];
    
    self.backgroundColor = [UIColor clearColor];
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    NSLog(@"Selected: %d", selected);
    // Configure the view for the selected state
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated
{
    [super setHighlighted:highlighted animated:animated];
    self.tLable.highlighted = highlighted;
    self.btn.highlighted = highlighted;
    NSLog(@"HightLight: %d", highlighted);
    NSLog(@"btn.ishighlighted: %d", self.btn.isHighlighted);
    NSLog(@"lable.ishighlighted: %d", self.tLable.isHighlighted);
}
-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    NSLog(@"hitTest start");
    UIView* vi = [super hitTest:point withEvent:event];
    NSLog(@"hitTest end: %@", vi);
    if (!self.btn.isEnabled) {
        CGPoint p = [self.btn convertPoint:point fromView:self];
        if ([self.btn pointInside:p withEvent:event]) {
            vi = nil;
        }
    }
    return vi;
}

@end
