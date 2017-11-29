//
//  HCCollectionViewController.m
//  imageheight
//
//  Created by apple on 2017/11/24.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "HCCollectionViewController.h"
#import "HCHeader.h"
#import "HCGuDingImageCell.h"
#import "HCBianHuaImageCell.h"
#import "HCImageModel.h"

@interface HCCollectionViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic, strong) NSArray *data;
@end

@implementation HCCollectionViewController

static NSString * const gudingCell = @"guding";
static NSString * const bian = @"bian";

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    
}
- (void)initData {
    self.collectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNew)];
    [self.collectionView.mj_header beginRefreshing];
}

- (void)loadNew {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.collectionView.mj_header endRefreshing];
        //
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"HCimg" ofType:@"plist"];
        //newsModel.plist文件
        NSMutableArray *data1 = [[NSMutableArray alloc] initWithContentsOfFile:filePath];
        NSArray *data = [HCImageModel arrayOfModelsFromDictionaries:data1 error:NULL];
        NSMutableDictionary *imageData = [@{} mutableCopy];
        
        for (int i = 0; i < data.count ; i++) {
            
        }
        self.data = data;
        [self.collectionView reloadData];
    });
}

-(NSArray *)data {
    if (!_data) {
        _data = [[NSArray alloc] init];
    }
    return _data;
}
#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.data.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
  
    HCImageModel *model = self.data[indexPath.item];
    if ([model.type isEqualToString:@"1"]) {
         HCGuDingImageCell  *cell = [collectionView dequeueReusableCellWithReuseIdentifier:gudingCell forIndexPath:indexPath];
        cell.cover = model.cover;
        return cell;
    }
    
    if ([model.type isEqualToString:@"2"]) {
        HCBianHuaImageCell  *cell = [collectionView dequeueReusableCellWithReuseIdentifier:bian forIndexPath:indexPath];
        [self configureCell:cell cover:model.cover];
        return cell;
    }
    return nil;
}

/** 每个cell的尺寸*/
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    HCImageModel *model = self.data[indexPath.item];
    CGFloat imgH = 0.01;
    if ([model.type isEqualToString:@"1"]) {
        imgH = 100;
    }
    
    if ([model.type isEqualToString:@"2"]) {
        UIImage *image = [[SDImageCache sharedImageCache] imageFromDiskCacheForKey: model.cover];
        if (!image) {
            image = [UIImage imageNamed:kDownloadImageHolder];
        }
        imgH = image.size.height * [UIScreen mainScreen].bounds.size.width / image.size.width;
    }
    NSLog(@"imH-item%tu----------------%f",indexPath.item,imgH);
    return CGSizeMake([UIScreen mainScreen].bounds.size.width, imgH);
}

- (void)configureCell:(HCBianHuaImageCell *)cell  cover:(NSString *)imgUrl {
    UIImage *cachedImage = [[SDImageCache sharedImageCache] imageFromDiskCacheForKey:imgUrl];//拿
    if (!cachedImage) {
        cell.coverView.image = [UIImage imageNamed:kDownloadImageHolder];
        [self downloadImage:imgUrl];
    }
    else {
        [cell.coverView sd_setImageWithURL:[NSURL URLWithChineseCharacters:imgUrl] placeholderImage:[UIImage imageNamed:kDownloadImageHolder]];
    }
}

- (void)downloadImage:(NSString *)imageURL {
    
    __weak typeof(self) weakSelf = self;
    [[SDWebImageDownloader sharedDownloader] downloadImageWithURL:[NSURL URLWithChineseCharacters:imageURL] options:SDWebImageDownloaderUseNSURLCache progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        // do nothing
    } completed:^(UIImage *image, NSData *data, NSError *error, BOOL finished) {
        [[SDImageCache sharedImageCache] storeImage:image forKey:imageURL toDisk:YES];//存
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakSelf.collectionView reloadData];
            NSLog(@"回主线程刷新");
        });
    }];
}
#pragma mark <UICollectionViewDelegate>

/*
 // Uncomment this method to specify if the specified item should be highlighted during tracking
 - (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
 return YES;
 }
 */

/*
 // Uncomment this method to specify if the specified item should be selected
 - (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
 return YES;
 }
 */

/*
 // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
 - (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
 return NO;
 }
 
 - (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
 return NO;
 }
 
 - (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
 
 }
 */

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

