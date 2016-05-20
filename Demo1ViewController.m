//
//  Demo1ViewController.m
//  DemoTest
//
//  Created by hzzc on 16/5/11.
//  Copyright © 2016年 hzzc. All rights reserved.
//
#import "Demo1ViewController.h"
#import "Demo1Cell.h"
#import "Demo1Model.h"

static NSString *cellIdentifier = @"Demo1CellIdentifier";

#define kScreenWidth ([UIScreen mainScreen].bounds.size.width)

@interface Demo1ViewController ()


@end

@implementation Demo1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.itemSize = CGSizeMake((kScreenWidth -30)/2, (kScreenWidth -30)/2+20);
    layout.minimumLineSpacing = 7;
    layout.minimumInteritemSpacing = 7;
    //距离顶部 左边 底部 右边的距离
    layout.sectionInset = UIEdgeInsetsMake(0, 3, 0, 3);
    self.collectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds
                                            collectionViewLayout:layout];
    
    [self.view addSubview:_collectionView];
    
    [self.collectionView registerClass:[Demo1Cell class]
            forCellWithReuseIdentifier:cellIdentifier];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    self.collectionView.backgroundColor = [UIColor blackColor];
    
    int j = 0;
    for (int i = 0; i < 60 ; ++i) {
        if (++j >12) {
            j = 1;
        }
        Demo1Model *model = [[Demo1Model alloc]init];
        model.imageName = [NSString stringWithFormat:@"img%d.jpg",j];
        model.title = [NSString stringWithFormat:@"图片%d",i+1];
        [self.dataArray addObject:model];
    }
    
        
        [_collectionView reloadData];
  
}

- (NSMutableArray *)dataArray {

    if (_dataArray == nil) {
        _dataArray = [[NSMutableArray alloc]init];
    }
    return _dataArray;
}

#pragma mark UICollectionViewDelegate & UICollectionDataSource
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    Demo1Cell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier
                                                                forIndexPath:indexPath];
    Demo1Model *model = _dataArray[indexPath.item];
    [cell configCellWithMode:model];

    return cell;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _dataArray.count;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
