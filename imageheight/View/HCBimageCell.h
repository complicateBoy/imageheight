//
//  HCBimageCell.h
//  imageheight
//
//  Created by apple on 2017/11/13.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HCBimageCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *coverView;
@property (nonatomic, copy) NSString *cover;
@end
