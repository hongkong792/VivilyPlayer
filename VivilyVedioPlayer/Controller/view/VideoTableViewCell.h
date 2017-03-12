//
//  VideoTableViewCell.h
//  VivilyVedioPlayer
//
//  Created by yangxianggang on 17/3/11.
//  Copyright © 2017年 yangxianggang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VedioModel.h"

@interface VideoTableViewCell : UITableViewCell

@property (nonatomic,weak)IBOutlet UILabel * title;
@property (nonatomic,weak)IBOutlet UILabel * descriptionLabel;
@property (nonatomic,weak)IBOutlet UILabel * duration;
@property (nonatomic,weak)IBOutlet UILabel * playcount;

@property (nonatomic,weak)IBOutlet UIImageView *backImageView;
@property (nonatomic,weak)IBOutlet UIButton *playBtn;

@property (nonatomic,strong)VedioModel *model;
@end
