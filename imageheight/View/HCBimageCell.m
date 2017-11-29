//
//  HCBimageCell.m
//  imageheight
//
//  Created by apple on 2017/11/13.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "HCBimageCell.h"
#import "HCHeader.h"
@implementation HCBimageCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)setCover:(NSString *)cover {
    _cover = cover;
    [self.coverView sd_setImageWithURL:[NSURL URLWithChineseCharacters:cover] placeholderImage:[UIImage imageNamed:kDownloadImageHolder] options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        //do nothing
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        [[SDImageCache sharedImageCache] storeImage:image forKey:cover toDisk:YES];//存
        dispatch_async(dispatch_get_main_queue(), ^{
            //            [self.tableView reloadData];
            NSLog(@"回主线程刷新");
        });
    }];
}
@end
