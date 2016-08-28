//
//  ItemsViewController.m
//  SimplifySDKSampleApp
//
//  Created by Kevin Li on 8/27/16.
//  Copyright © 2016 MasterCard. All rights reserved.
//

#import "ItemCollectionViewCell.h"
#import "ItemsViewController.h"

@interface ItemsViewController ()

@property (weak, nonatomic) IBOutlet UICollectionView *itemsCollectionView;

@end

@implementation ItemsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.automaticallyAdjustsScrollViewInsets = false;
    
    [_itemsCollectionView setDelegate:self];
    [_itemsCollectionView setDataSource:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Collection View Data

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 20;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    // Placeholder cell for items
    ItemCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ItemCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor greenColor];
    return cell;
}

#pragma mark - Collection View Layout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    NSInteger screenWidth = [[UIScreen mainScreen] bounds].size.width;
    
    // Half the width minus margins
    return CGSizeMake((screenWidth - 30) / 2, (screenWidth - 30) / 2);
}

#pragma mark - Collection View Selection

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:@"ShowProduct" sender:self];
}


 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
     
 }
 

@end
