//
//  ViewController.m
//  imageheight
//
//  Created by apple on 2017/11/9.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "ViewController.h"
#import "HCHeader.h"

#import "HCimageCell.h"
#import "HCBimageCell.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong)  NSArray *imgArray;
@property (nonatomic, strong)  NSArray *imgBArray;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, assign) CGPoint offsetT;
@property (nonatomic, assign) CGPoint offsetB;

@property (nonatomic, copy) NSString *cellId;

@end

static NSString * const imgID = @"cell";
static NSString * const imgss = @"ss";
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.offsetT = CGPointZero;
    self.offsetB = CGPointZero;
    [super awakeFromNib];
    self.cellId = imgID;
    

//    [self.coverView sd_setImageWithURL:[NSURL URLWithChineseCharacters:url] placeholderImage:[UIImage imageNamed:HCPlaceHoder inBundleNamed:bundleHCDesignCenter]];
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNew)];
//    [self.tableView.mj_header beginRefreshing];
    
   
}
/*
- (void)loadNew {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.imgArray =  @[@"http://dummyimage.com/750x100/4A7BF7&text=发表作品",
                           @"http://idiy.haier.com/upload/test/dc03480e-ffb8-4e52-b0e3-e633c409289b.jpg",
                           @"http://idiy.haier.com/upload/test/053b01e7-cd0d-4209-ab6f-25908ef708a1.jpg",
                           @"http://idiy.haier.com/upload/test/053b01e7-cd0d-4209-ab6f-25908ef708a1.jpg",
                           @"http://idiy.haier.com/upload/test/dc03480e-ffb8-4e52-b0e3-e633c409289b.jpg",
                           @"http://dummyimage.com/750x100/4A7BF7&text=发表创意",
                           @"http://dummyimage.com/750x200",
                           @"http://dummyimage.com/750x100/4A7BF7&text=发表作品",
                           @"https://dummyimage.com/'750x100'/f2a079&text='发表作品'"];
        [self.tableView.mj_header endRefreshing];
        [self.tableView reloadData];
    });
}
*/
- (void)loadNew {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        if ([self.cellId isEqualToString:imgID]) {
            self.imgArray =  @[@"http://dummyimage.com/750x100/4A7BF7&text=发表作品",
                               @"http://idiy.haier.com/upload/test/dc03480e-ffb8-4e52-b0e3-e633c409289b.jpg",
                               @"http://idiy.haier.com/upload/test/053b01e7-cd0d-4209-ab6f-25908ef708a1.jpg",
                               @"http://idiy.haier.com/upload/test/053b01e7-cd0d-4209-ab6f-25908ef708a1.jpg",
                               @"http://idiy.haier.com/upload/test/dc03480e-ffb8-4e52-b0e3-e633c409289b.jpg",
                               @"http://dummyimage.com/750x100/4A7BF7&text=发表创意",
                               @"http://dummyimage.com/750x200",
                               @"http://dummyimage.com/750x100/4A7BF7&text=发表作品",
                               @"https://dummyimage.com/'750x100'/f2a079&text='发表作品'", @"http://idiy.haier.com/upload/test/053b01e7-cd0d-4209-ab6f-25908ef708a1.jpg",
                               @"http://idiy.haier.com/upload/test/053b01e7-cd0d-4209-ab6f-25908ef708a1.jpg",
                               @"http://idiy.haier.com/upload/test/053b01e7-cd0d-4209-ab6f-25908ef708a1.jpg",
                               @"http://idiy.haier.com/upload/test/053b01e7-cd0d-4209-ab6f-25908ef708a1.jpg",
                               @"http://idiy.haier.com/upload/test/053b01e7-cd0d-4209-ab6f-25908ef708a1.jpg",
                               @"http://idiy.haier.com/upload/test/053b01e7-cd0d-4209-ab6f-25908ef708a1.jpg",
                               @"http://idiy.haier.com/upload/test/053b01e7-cd0d-4209-ab6f-25908ef708a1.jpg",
                               @"http://idiy.haier.com/upload/test/053b01e7-cd0d-4209-ab6f-25908ef708a1.jpg",
                               @"http://idiy.haier.com/upload/test/053b01e7-cd0d-4209-ab6f-25908ef708a1.jpg",
                               @"http://idiy.haier.com/upload/test/053b01e7-cd0d-4209-ab6f-25908ef708a1.jpg",
                               @"http://idiy.haier.com/upload/test/053b01e7-cd0d-4209-ab6f-25908ef708a1.jpg",
                               @"http://idiy.haier.com/upload/test/053b01e7-cd0d-4209-ab6f-25908ef708a1.jpg",
                               @"http://idiy.haier.com/upload/test/053b01e7-cd0d-4209-ab6f-25908ef708a1.jpg",
                               @"http://idiy.haier.com/upload/test/053b01e7-cd0d-4209-ab6f-25908ef708a1.jpg",
                               @"http://dummyimage.com/750x100/4A7BF7&text=发表作品",
                               @"http://dummyimage.com/750x100/4A7BF7&text=发表作品"];
            
            [self.tableView.mj_header endRefreshing];
            [self.tableView reloadData];
            
//            [self.tableView setContentOffset:CGPointMake(0, 900)];
            [self.tableView setContentOffset:self.offsetT];
            
        } else {
            self.imgBArray = @[@"http://dummyimage.com/750x100/4A7BF7&text=发表作品",
                               @"http://idiy.haier.com/upload/test/dc03480e-ffb8-4e52-b0e3-e633c409289b.jpg",
                               @"http://idiy.haier.com/upload/test/053b01e7-cd0d-4209-ab6f-25908ef708a1.jpg",
                               @"http://idiy.haier.com/upload/test/053b01e7-cd0d-4209-ab6f-25908ef708a1.jpg",
                               @"http://idiy.haier.com/upload/test/dc03480e-ffb8-4e52-b0e3-e633c409289b.jpg",
                               @"http://dummyimage.com/750x100/4A7BF7&text=发表创意",
                               @"http://dummyimage.com/750x200",
                               @"http://dummyimage.com/750x100/4A7BF7&text=发表作品",
                               @"https://dummyimage.com/'750x100'/f2a079&text='发表作品'", @"http://idiy.haier.com/upload/test/053b01e7-cd0d-4209-ab6f-25908ef708a1.jpg",
                               @"http://idiy.haier.com/upload/test/053b01e7-cd0d-4209-ab6f-25908ef708a1.jpg",
                               @"http://idiy.haier.com/upload/test/053b01e7-cd0d-4209-ab6f-25908ef708a1.jpg",
                               @"http://idiy.haier.com/upload/test/053b01e7-cd0d-4209-ab6f-25908ef708a1.jpg",
                               @"http://idiy.haier.com/upload/test/053b01e7-cd0d-4209-ab6f-25908ef708a1.jpg",
                               @"http://idiy.haier.com/upload/test/053b01e7-cd0d-4209-ab6f-25908ef708a1.jpg",
                               @"http://idiy.haier.com/upload/test/053b01e7-cd0d-4209-ab6f-25908ef708a1.jpg",
                               @"http://idiy.haier.com/upload/test/053b01e7-cd0d-4209-ab6f-25908ef708a1.jpg",
                               @"http://idiy.haier.com/upload/test/053b01e7-cd0d-4209-ab6f-25908ef708a1.jpg",
                               @"http://idiy.haier.com/upload/test/053b01e7-cd0d-4209-ab6f-25908ef708a1.jpg",
                               @"http://idiy.haier.com/upload/test/053b01e7-cd0d-4209-ab6f-25908ef708a1.jpg",
                               @"http://idiy.haier.com/upload/test/053b01e7-cd0d-4209-ab6f-25908ef708a1.jpg",
                               @"http://idiy.haier.com/upload/test/053b01e7-cd0d-4209-ab6f-25908ef708a1.jpg",
                               @"http://idiy.haier.com/upload/test/053b01e7-cd0d-4209-ab6f-25908ef708a1.jpg",
                               @"http://dummyimage.com/750x100/4A7BF7&text=发表作品",
                               @"http://dummyimage.com/750x100/4A7BF7&text=发表作品"];
            
            [self.tableView.mj_header endRefreshing];
            [self.tableView reloadData];
            
//            [self.tableView setContentOffset:CGPointMake(0, 200)];
            [self.tableView setContentOffset:self.offsetB];
        }
        
//
//        [self.tableView.mj_header endRefreshing];
        [self.tableView reloadData];
//
//        [self.tableView setContentOffset:CGPointMake(0, 900)];
    });
}

-(NSArray *)imgArray {
    if (_imgArray == nil) {
        _imgArray = [[NSArray alloc] init];
    }
    return _imgArray;
}

-(NSArray *)imgBArray {
    if (_imgBArray == nil) {
        _imgBArray = [[NSArray alloc] init];
    }
    return _imgBArray;
}


#pragma mark - UITableViewDelegate, UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if ([self.cellId isEqualToString:imgID]) {
    return self.imgArray.count;//图片URL以数组的形式存在
    }
    
//    if ([self.cellId isEqualToString:imgss]) {
//        return self.imgBArray.count;//图片URL以数组的形式存在
//    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    CGFloat imgHeight = [self heightCover:self.imgArray[indexPath.row]];
//    UIImage *image = [[SDImageCache sharedImageCache] imageFromDiskCacheForKey: self.imgArray[indexPath.row]];
//    if (!image) {
//        image = [UIImage imageNamed:kDownloadImageHolder];
//    }
//    CGFloat imgHeight = image.size.height * [UIScreen mainScreen].bounds.size.width / image.size.width;
    CGFloat imgHeight = 0.01;
    
    if ([self.cellId isEqualToString:imgID]) {
        UIImage *image = [[SDImageCache sharedImageCache] imageFromDiskCacheForKey: self.imgArray[indexPath.row]];
        if (!image) {
            image = [UIImage imageNamed:kDownloadImageHolder];
        }
        imgHeight = image.size.height * [UIScreen mainScreen].bounds.size.width / image.size.width;
    } else {
        UIImage *image = [[SDImageCache sharedImageCache] imageFromDiskCacheForKey: self.imgArray[indexPath.row]];
        if (!image) {
            image = [UIImage imageNamed:kDownloadImageHolder];
        }
        imgHeight = image.size.height * [UIScreen mainScreen].bounds.size.width / image.size.width;
    }
    
    return imgHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if ([self.cellId isEqualToString:imgID]) {
        HCimageCell *cell = [tableView dequeueReusableCellWithIdentifier:imgID];
        cell.cover = self.imgArray[indexPath.row];
        return cell;
    }
    
//    if ([self.cellId isEqualToString:imgss]) {
//        HCBimageCell *cell = [tableView dequeueReusableCellWithIdentifier:imgID];
//        cell.cover = self.imgArray[indexPath.row];
//        return cell;
//    }
    return nil;
}

- (void)configureCell:(HCimageCell *)cell  cover:(NSString *)imgUrl {
    
    UIImage *cachedImage = [[SDImageCache sharedImageCache] imageFromDiskCacheForKey:imgUrl];//拿
    if ( !cachedImage ) {
        [self downloadImage:imgUrl];
//        [cell.coverBtn setBackgroundImage:[UIImage imageNamed:kDownloadImageHolder] forState:UIControlStateNormal];
//        cell.coverBtn.image = [UIImage imageNamed:kDownloadImageHolder];
//        cell.cover = [UIImage imageNamed:kDownloadImageHolder];
    } else {
//        cell.coverBtn.image = cachedImage;
//        cell.cover = cachedImage;
        
//        [cell.coverBtn setBackgroundImage:cachedImage forState:UIControlStateNormal];
    }
    [cell.coverBtn sd_setImageWithURL:[NSURL URLWithChineseCharacters:imgUrl] placeholderImage:[UIImage imageNamed:kDownloadImageHolder]];
}

- (void)downloadImage:(NSString *)imageURL {
    // 利用 SDWebImage 框架提供的功能下载图片
    [[SDWebImageDownloader sharedDownloader] downloadImageWithURL:[NSURL URLWithChineseCharacters:imageURL] options:SDWebImageDownloaderUseNSURLCache progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        // do nothing
    } completed:^(UIImage *image, NSData *data, NSError *error, BOOL finished) {
        [[SDImageCache sharedImageCache] storeImage:image forKey:imageURL toDisk:YES];//存
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
            NSLog(@"回主线程刷新");
        });
    }];
}

/**
//1.异步获取图片
- (void)getCover:(NSString  *)imgUrl {
        [[SDWebImageDownloader sharedDownloader] downloadImageWithURL:[NSURL URLWithString:imgUrl] options:SDWebImageDownloaderUseNSURLCache progress:^(NSInteger receivedSize, NSInteger expectedSize) {
            // do nothing
        } completed:^(UIImage *image, NSData *data, NSError *error, BOOL finished) {
            [[SDImageCache sharedImageCache] storeImage:image forKey:imgUrl toDisk:YES];//保存图片，并选择是否保存到物理存储上
            dispatch_async(dispatch_get_main_queue(), ^{
//                [self.tableView reloadData];
            });
        }];
}
//2.计算高度
- (CGFloat)heightCover:(NSString *)imgUrl{
    UIImage *image = [[SDImageCache sharedImageCache] imageFromDiskCacheForKey:imgUrl];//拿到沙盒中指定的缓存图片
    if (!image) {
        image = [UIImage imageNamed:kDownloadImageHolder];
//        [self getCover:imgUrl];
    }
    CGFloat imgHeight = image.size.height * [UIScreen mainScreen].bounds.size.width / image.size.width;
    return imgHeight;
}
 */

//- (void)getCover:(NSString  *)imgUrl {
//    UIImage *cachedImage = [[SDImageCache sharedImageCache] imageFromDiskCacheForKey:imgUrl];//拿到沙盒中指定的缓存图片
//    if ( !cachedImage ) {
//        [[SDWebImageDownloader sharedDownloader] downloadImageWithURL:[NSURL URLWithString:imgUrl] options:SDWebImageDownloaderUseNSURLCache progress:^(NSInteger receivedSize, NSInteger expectedSize) {
//            // do nothing
//        } completed:^(UIImage *image, NSData *data, NSError *error, BOOL finished) {
//            [[SDImageCache sharedImageCache] storeImage:image forKey:imgUrl toDisk:YES];//保存图片，并选择是否保存到物理存储上
//
//            dispatch_async(dispatch_get_main_queue(), ^{
//                [self.tableView reloadData];
//            });
//        }];
//    }
//}

//- (void)downloadImage:(NSString *)imageURL forIndexPath:(NSIndexPath *)indexPath {
//    // 利用 SDWebImage 框架提供的功能下载图片
//    [[SDWebImageDownloader sharedDownloader] downloadImageWithURL:[NSURL URLWithString:imageURL] options:SDWebImageDownloaderUseNSURLCache progress:^(NSInteger receivedSize, NSInteger expectedSize) {
//        // do nothing
//
//    } completed:^(UIImage *image, NSData *data, NSError *error, BOOL finished) {
//        [[SDImageCache sharedImageCache] storeImage:image forKey:imageURL toDisk:YES];
//        dispatch_async(dispatch_get_main_queue(), ^{
//            [self.tableView reloadData];
//        });
//    }];
//
//
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//- (IBAction)startLoadNew:(id)sender {
//    self.imgArray = nil;
//    [self.tableView reloadData];
//    self.cellId = imgID;
//    [self.tableView.mj_header beginRefreshing];
//
//    NSLog(@"starLoadNew");
//}
//- (void)configureCell:(HCimageCell *)cell cover:(NSString  *)imgUrl {
//    UIImage *cachedImage = [[SDImageCache sharedImageCache] imageFromDiskCacheForKey:imgUrl];
//    if ( !cachedImage ) {
//        [[SDWebImageDownloader sharedDownloader] downloadImageWithURL:[NSURL URLWithString:imgUrl] options:SDWebImageDownloaderUseNSURLCache progress:^(NSInteger receivedSize, NSInteger expectedSize) {
//            // do nothing
//        } completed:^(UIImage *image, NSData *data, NSError *error, BOOL finished) {
//            [[SDImageCache sharedImageCache] storeImage:image forKey:imgUrl toDisk:YES];
//            dispatch_async(dispatch_get_main_queue(), ^{
//                [self.tableView reloadData];
//            });
//        }];
//        cell.cover = kDownloadImageHolder;
//    } else {
//        [cell.coverBtn setBackgroundImage:cachedImage forState:UIControlStateNormal];
//        cell.cover = imgUrl;
//    }
//}
//- (void)configureCell:(HCimageCell *)cell atIndexPath:(NSIndexPath *)indexPath {
//    NSString *imgURL = self.imgArray[indexPath.row];
//    UIImage *cachedImage = [[SDImageCache sharedImageCache] imageFromDiskCacheForKey:imgURL];
//    if ( !cachedImage ) {
//        [self downloadImage:self.imgArray[indexPath.row] forIndexPath:indexPath];
//        cell.cover = kDownloadImageHolder;
//    } else {
//        [cell.coverBtn setBackgroundImage:cachedImage forState:UIControlStateNormal];
//    }
//
//}

//- (void)downloadImage:(NSString *)imageURL forIndexPath:(NSIndexPath *)indexPath {
//    // 利用 SDWebImage 框架提供的功能下载图片
//    [[SDWebImageDownloader sharedDownloader] downloadImageWithURL:[NSURL URLWithString:imageURL] options:SDWebImageDownloaderUseNSURLCache progress:^(NSInteger receivedSize, NSInteger expectedSize) {
//        // do nothing
//
//    } completed:^(UIImage *image, NSData *data, NSError *error, BOOL finished) {
//        [[SDImageCache sharedImageCache] storeImage:image forKey:imageURL toDisk:YES];
//        dispatch_async(dispatch_get_main_queue(), ^{
//            [self.tableView reloadData];
//        });
//    }];
//
//
//}
//- (void)configureCell:(HCimageCell *)cell atIndexPath:(NSIndexPath *)indexPath {
//    NSString *imgURL = self.imgArray[indexPath.row];
//    UIImage *cachedImage = [[SDImageCache sharedImageCache] imageFromDiskCacheForKey:imgURL];
//    if ( !cachedImage ) {
//        [self downloadImage:self.imgArray[indexPath.row] forIndexPath:indexPath];
//        cell.cover = kDownloadImageHolder;
//    } else {
//        [cell.coverBtn setBackgroundImage:cachedImage forState:UIControlStateNormal];
//    }
//
//}
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    // 先从缓存中查找图片
//    UIImage *image = [[SDImageCache sharedImageCache] imageFromDiskCacheForKey: self.imgArray[indexPath.row]];
//
//    // 没有找到已下载的图片就使用默认的占位图，当然高度也是默认的高度了，除了高度不固定的文字部分。
//    if (!image) {
//        image = [UIImage imageNamed:kDownloadImageHolder];
//    }
//
//    //手动计算cell
//    CGFloat imgHeight = image.size.height * [UIScreen mainScreen].bounds.size.width / image.size.width;
//
//    return imgHeight;
//}
- (IBAction)startLoadNew:(id)sender {
    self.imgArray = nil;
    [self.tableView reloadData];
    self.cellId = imgID;
    [self.tableView.mj_header beginRefreshing];
    
    NSLog(@"starLoadNew");
}

- (IBAction)ssBtn:(id)sender {
    self.cellId = imgss;
    self.imgBArray = nil;
    [self.tableView reloadData];
    [self.tableView.mj_header beginRefreshing];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if ([self.cellId isEqualToString:imgID]) {
        self.offsetT = scrollView.contentOffset;
        NSLog(@"imgID- %@",NSStringFromCGPoint(self.offsetT));
    } else {
        self.offsetB = scrollView.contentOffset;
        NSLog(@"ss- %@",NSStringFromCGPoint(self.offsetB));
        
    }
   
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewRowAction *deleteRowAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"取消\n收藏" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
        [self.tableView setEditing:NO animated:YES];
        //        [self cancelCollectGoodsWithIndexPath:indexPath];//打开
//        [self deleteSingleIndexPath:indexPath]; //删除
    }];
    deleteRowAction.backgroundColor = [UIColor orangeColor];
    return @[deleteRowAction];
}


@end
