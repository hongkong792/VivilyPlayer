//
//  TencentViewController.m
//  VivilyVedioPlayer
//
//  Created by yangxianggang on 17/3/11.
//  Copyright © 2017年 yangxianggang. All rights reserved.
//

#import "TencentViewController.h"
#import "AppDelegate.h"
#import "VideoTableViewCell.h"
#import "MJRefresh.h"
#import "DataManager.h"

#import "WMPlayer.h"
#define cellIdentifier  @"cellIdentifier"


@interface TencentViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *dataSource;
    WMPlayer *wmPlayer;
    NSIndexPath *currentIndexPath;
    BOOL isSmallScreen;
}

@property (nonatomic,retain)VideoTableViewCell * currentCell;

@end

@implementation TencentViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        dataSource = [NSMutableArray array];
     }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    //1.上拉下拉刷新
    //2.视频播放控制
    //3.旋转
    //4.监听旋转，变成小view窗口
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerNib:[UINib nibWithNibName:@"VideoTableViewCell" bundle:nil] forCellReuseIdentifier:cellIdentifier];
    [self addRefresh];
    
 
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self performSelector:@selector(loadData) withObject:nil afterDelay:1];
}

- (void)loadData
{
    NSArray *arr = [AppDelegate shareAppDelegate].vedioArray;
    [dataSource addObjectsFromArray:arr];
    [self.tableView reloadData];
   
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma UITableViewDelegate,UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return dataSource.count;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    VideoTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    cell.model = dataSource[indexPath.row];
    [cell.playBtn addTarget:self action:@selector(startPlay:) forControlEvents:UIControlEventTouchUpInside];
    cell.playBtn.tag = indexPath.row;
    return cell;
    
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 274;
}

#pragma 播放
- (void)startPlay:(UIButton *)button
{
    currentIndexPath = [NSIndexPath indexPathForRow:button.tag inSection:0];
    VedioModel *model = [dataSource objectAtIndex:button.tag];
    //获取currentCell
    UIView *cell = [button superview];
    while (![cell isKindOfClass:[VideoTableViewCell class]]) {
        cell = [cell superview];
    }
    self.currentCell = (VideoTableViewCell*)cell;
    
    
    if (wmPlayer) {
 
    }else{
        
        wmPlayer = [[WMPlayer alloc] initWithFrame:self.currentCell.backImageView.bounds];
        wmPlayer.delegate = self;
        wmPlayer.URLString = model.mp4_url;
        wmPlayer.closeBtnStyle = CloseBtnStyleClose;
        wmPlayer.dragEnable = NO;
        wmPlayer.enableVolumeGesture = NO;
        wmPlayer.titleLabel.text = model.title;
    }
    
    [self.currentCell.backImageView addSubview:wmPlayer];
    [self.currentCell.backImageView bringSubviewToFront:wmPlayer];
    [self.currentCell.playBtn.superview sendSubviewToBack:self.currentCell.playBtn];
    [self.tableView reloadData];
    
    
    
    
    
}

#pragma 添加刷新空间
- (void)addRefresh
{
    __weak typeof(self)weakSelf = self;
    __unsafe_unretained UITableView * weakTableView = self.tableView;
    weakTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [weakSelf addHudViewWithMessage:@"加载中"];
        [[DataManager shareManager] getAllDataWithURL:@"http://c.m.163.com/nc/video/home/0-10.html" successBlock:^(NSArray *vedioArray, NSArray *sidArray) {
            
            //更新数据源，并在主线程刷新界ui
            dataSource = [NSMutableArray arrayWithArray:vedioArray];
            dispatch_async(dispatch_get_main_queue(), ^{
                
                [weakSelf removeHudView];
                [weakTableView reloadData];
                [weakTableView.mj_header endRefreshing];
                
            });
        } failBlock:^(NSError *error) {
            [weakSelf removeHudView];
        }];
        
    }];
    weakTableView.mj_header.automaticallyChangeAlpha = YES;
    //上拉刷新
    weakTableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [[DataManager shareManager] getAllDataWithURL:[NSString stringWithFormat:@"http://c.m.163.com/nc/video/home/%ld-10.html",dataSource.count - dataSource.count%10] successBlock:^(NSArray *vedioArray, NSArray *sidArray) {
             [weakSelf addHudViewWithMessage:@"上拉刷新"];
            [dataSource addObjectsFromArray:vedioArray];
            dispatch_async(dispatch_get_main_queue(), ^{
                
                [weakSelf removeHudView];
                [weakTableView reloadData];
                [weakTableView.mj_footer endRefreshing];
                
            });
            
        } failBlock:^(NSError *error) {
            [weakSelf removeHudView];
        }];
        
        
    }];
    
    
    
}


@end
