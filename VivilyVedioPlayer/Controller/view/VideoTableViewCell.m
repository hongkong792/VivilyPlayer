//
//  VideoTableViewCell.m
//  VivilyVedioPlayer
//
//  Created by yangxianggang on 17/3/11.
//  Copyright © 2017年 yangxianggang. All rights reserved.
//

#import "VideoTableViewCell.h"
#import "UIImageView+WebCache.h"

@implementation VideoTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}



- (void)setModel:(VedioModel *)model
{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    _title.text = model.title;
    _descriptionLabel.text = model.descriptionDe;
    [_backImageView sd_setImageWithURL:[NSURL URLWithString:model.cover] placeholderImage:[UIImage imageNamed:@"logo"]];
    _playcount.text = [NSString stringWithFormat:@"%.2lf万",(CGFloat)(model.playCount/10000)] ;
    _duration.text = [model.ptime substringWithRange:NSMakeRange(12, 4)];
}
@end
