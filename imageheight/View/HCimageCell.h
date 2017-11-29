//
//  HCimageCell.h
//  imageheight
//
//  Created by apple on 2017/11/9.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HCimageCell : UITableViewCell
//@property (weak, nonatomic) IBOutlet UIButton *coverBtn;
//@property (nonatomic, copy) NSString *cover;
@property (weak, nonatomic) IBOutlet UIImageView *coverBtn;
//@property (nonatomic, strong) UIImage *cover;
@property (nonatomic, copy) NSString *cover;
@end
