//
//  HCimageCell.m
//  imageheight
//
//  Created by apple on 2017/11/9.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "HCimageCell.h"
#import "HCHeader.h"


@interface HCimageCell()


@end

@implementation HCimageCell

//-(void)setCover:(NSString *)cover {
//    _cover = cover;
//
//     [self.coverBtn sd_setBackgroundImageWithURL:[NSURL URLWithString:cover] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"HCPlaceHolder"]];
//}
//-(void)setCover:(UIImage *)cover {
//    _cover = cover;
//    self.coverBtn.image = cover;
//
//}

//-(void)setCover:(NSString *)cover {
//    _cover = cover;
//    UIImage *cachedImage = [[SDImageCache sharedImageCache] imageFromDiskCacheForKey:cover];//拿
//    if (!cachedImage) {
//        self.coverBtn.image = [UIImage imageNamed:@"HCPlaceHolder"];
//    } else {
//        self.coverBtn.image = cachedImage;
//    }
//}

-(void)setCover:(NSString *)cover {
    _cover = cover;
    [self.coverBtn sd_setImageWithURL:[NSURL URLWithChineseCharacters:cover] placeholderImage:[UIImage imageNamed:kDownloadImageHolder] options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        //do nothing
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        [[SDImageCache sharedImageCache] storeImage:image forKey:cover toDisk:YES];//存
        dispatch_async(dispatch_get_main_queue(), ^{
            //            [self.tableView reloadData];
            NSLog(@"回主线程刷新");
        });
    }];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}



@end
