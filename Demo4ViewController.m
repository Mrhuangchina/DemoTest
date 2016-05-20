//
//  Demo4ViewController.m
//  DemoTest
//
//  Created by hzzc on 16/5/11.
//  Copyright © 2016年 hzzc. All rights reserved.
//

#import "Demo4ViewController.h"
#import "Demo4Cell.h"
#import "Demo4FlowLayout.h"

static NSString *CellIdentifier = @"CellIdentifier";

@interface Demo4ViewController ()

@end

@implementation Demo4ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    Demo4FlowLayout *layout = [[Demo4FlowLayout alloc]init];
    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:layout];
    collectionView.dataSource = self;
    [collectionView registerClass:[Demo4Cell class] forCellWithReuseIdentifier:CellIdentifier];
    collectionView.backgroundColor = [UIColor magentaColor];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:collectionView];
    // Do any additional setup after loading the view.
}


#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{

    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 12;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    Demo4Cell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier
                                                                forIndexPath:indexPath];
    //
    [cell configWithImage:[NSString stringWithFormat:@"img%ld.jpg",indexPath.item + 1]];

    return  cell;
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
