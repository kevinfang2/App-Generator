//
//  ItemsViewController.m
//  SimplifySDKSampleApp
//
//  Created by Kevin Li on 8/27/16.
//  Copyright © 2016 MasterCard. All rights reserved.
//

#import "ItemsViewController.h"
#import "SIMProductViewController.h"

@interface ItemsViewController (){
    NSMutableArray *titles;
    NSMutableArray *images;
    NSMutableArray *costs;
    NSMutableArray *description;
    NSInteger index;

}

@property (weak, nonatomic) IBOutlet UICollectionView *itemsCollectionView;

@end

@implementation ItemsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    titles.append("hi");
//    [titles addObject:@"hi"];
    
    
    self.automaticallyAdjustsScrollViewInsets = false;

    [_itemsCollectionView setDelegate:self];
    [_itemsCollectionView setDataSource:self];
    titles = [[NSMutableArray alloc] init];
    images = [[NSMutableArray alloc] init];
    costs = [[NSMutableArray alloc] init];
    [titles addObject:@"meme"];
    [costs addObject:@"10.9"];
    [images addObject:[UIImage imageNamed:@"simplifylogo.png"]];
    NSLog(@"meme");
    NSLog(@"%@", titles);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Collection View Data

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return titles.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    // Placeholder cell for items
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ItemCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor greenColor];

    UILabel *costLabel = (UILabel *)[cell viewWithTag:96];
    costLabel.text = costs[indexPath.row];
    NSLog(@"%@",costs[indexPath.row]);

    UILabel *nameLabel = (UILabel *)[cell viewWithTag:98];
    nameLabel.text = titles[indexPath.row];
    NSLog(@"%@",titles[indexPath.row]);

    UIImageView *imageView = (UIImageView *)[cell viewWithTag:100];
    imageView.layer.cornerRadius = 5;
    imageView.layer.masksToBounds = NO;

    NSLog(@"fwedwe %@", titles[indexPath.row]);
//    NSString*base64String = @" ";
//    NSData *decodedData = [[NSData alloc] initWithBase64EncodedString:base64String options:0];

//    UIImage * image = [UIImage imageWithData: decodedData];
    imageView.image = images[indexPath.row];

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
    index = indexPath.row;
}


 #pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"ShowProduct"]) {
        SIMProductViewController *destination = segue.destinationViewController;
        destination.title = [titles objectAtIndex:index];
        destination.image = [images objectAtIndex:index];
        destination.price = [costs objectAtIndex:index];
        destination.description = [description objectAtIndex: index];
    }
}

// // In a storyboard-based application, you will often want to do a little preparation before navigation
// - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
// // Get the new view controller using [segue destinationViewController].
// // Pass the selected object to the new view controller.
//     if ([segue.identifier isEqualToString:@"ShowProduct"]) {
//         SIMProductViewController *destVC = segue.destinationViewController;
//         destVC.titleLabel.text = @"testTitle";
//     }
//
// }


@end
