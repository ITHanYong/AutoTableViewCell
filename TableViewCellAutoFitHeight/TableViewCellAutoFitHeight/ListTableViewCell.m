//
//  ListTableViewCell.m
//  TableViewCellAutoFitHeight
//
//  Created by HanYong on 2018/4/15.
//  Copyright © 2018年 HanYong. All rights reserved.
//

#import "ListTableViewCell.h"

@interface ListTableViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *descLabel;


@end


@implementation ListTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)setModel:(ListModel *)model{
    _model = model;
    
    self.iconImageView.image = [UIImage imageNamed:@"image.jpg"];
    self.descLabel.text = model.desc;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
