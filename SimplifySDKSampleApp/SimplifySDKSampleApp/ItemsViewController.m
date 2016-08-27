//
//  ItemsViewController.m
//  SimplifySDKSampleApp
//
//  Created by Kevin Li on 8/27/16.
//  Copyright © 2016 MasterCard. All rights reserved.
//

#import "ItemsViewController.h"

@interface ItemsViewController ()

@property (weak, nonatomic) IBOutlet UICollectionView *_itemsCollectionView;

@end

@implementation ItemsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [__itemsCollectionView setDelegate:self];
    [__itemsCollectionView setDataSource:self];
    
    [__itemsCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"ItemCell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Collection View

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    // Placeholder cell for items
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ItemCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor greenColor];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(50, 50);
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
