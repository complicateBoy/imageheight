//
//  HCGuDingImageCell.m
//  imageheight
//
//  Created by apple on 2017/11/24.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "HCGuDingImageCell.h"
#import "HCHeader.h"

@interface HCGuDingImageCell ()
@property (weak, nonatomic) IBOutlet UIImageView *coverView;

@end

@implementation HCGuDingImageCell


-(void)setCover:(NSString *)cover {
    _cover = cover;
    [self.coverView sd_setImageWithURL:[NSURL URLWithChineseCharacters:cover] placeholderImage:[UIImage imageNamed:kDownloadImageHolder]];
}


@end
