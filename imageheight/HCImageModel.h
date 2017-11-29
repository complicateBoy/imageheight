//
//  HCImageModel.h
//  imageheight
//
//  Created by apple on 2017/11/25.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "JSONModel.h"

@interface HCImageModel : JSONModel

@property (nonatomic, copy) NSString<Optional> * cover;
@property (nonatomic, copy) NSString<Optional> *name;
@property (nonatomic, copy) NSString<Optional> *type;

@end
