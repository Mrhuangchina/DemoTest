//
//  Demo2ViewController.m
//  DemoTest
//
//  Created by hzzc on 16/5/11.
//  Copyright © 2016年 hzzc. All rights reserved.
//

#import "Demo2ViewController.h"
#import "Demo2FlowLayout.h"
#import "Demo2Cell.h"

static NSString *CellIdentifier = @"CellIdentifier";

@interface Demo2ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@end

@implementation Demo2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Demo2FlowLayout *layout = [[Demo2FlowLayout alloc]init];
    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds        collectionViewLayout:layout];
    [self.view addSubview:collectionView];
    [collectionView registerClass:[Demo2Cell class] forCellWithReuseIdentifier:CellIdentifier];
    collectionView.dataSource = self;
    collectionView.delegate = self;
    
    self.view.backgroundColor = [UIColor blackColor];
    //洋红色
    collectionView.backgroundColor = [UIColor magentaColor];
    
    collectionView.pagingEnabled = YES;
    
    // Do any additional setup after loading the view.
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UICollectionViewDataSource & UICollectionViewDelegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 1;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 12;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    Demo2Cell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    //
    [cell configWithImage:[NSString stringWithFormat:@"img%ld.jpg",indexPath.section +1 ]];
    return cell;
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
