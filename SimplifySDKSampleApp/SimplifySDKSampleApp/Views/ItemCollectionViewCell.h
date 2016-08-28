//
//  ItemCollectionViewCell.h
//  SimplifySDKSampleApp
//
//  Created by Kevin Li on 8/27/16.
//  Copyright © 2016 MasterCard. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ItemCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *img;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *costLabel;

@end
