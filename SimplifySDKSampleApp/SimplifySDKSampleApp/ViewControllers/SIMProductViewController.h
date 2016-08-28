/**
 
 Sample App root view Controller. This view controller simply shows the easiest way to use the SIMChargeCardViewController.
 
 */

#import <UIKit/UIKit.h>

@interface SIMProductViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UIImageView *productImage;
@property (weak, nonatomic) IBOutlet UIImageView *priceImage;


@end
