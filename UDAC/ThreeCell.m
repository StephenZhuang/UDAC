//
//  ThreeCell.m
//  UDAC
//
//  Created by Stephen Zhuang on 14-10-10.
//  Copyright (c) 2014年 udows. All rights reserved.
//

#import "ThreeCell.h"

@implementation ThreeCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)valueChanged:(id)sender
{
    [_countLabel setText:[NSString stringWithFormat:@"%.0f",_step.value]];
    [_totalPriceLabel setText:[NSString stringWithFormat:@"%.1f",_priceLabel.text.floatValue * _step.value]];
    if (_stepBlcok) {
        _stepBlcok(_step.value);
    }
}

@end
