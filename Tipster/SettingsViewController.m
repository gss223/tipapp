//
//  SettingsViewController.m
//  Tipster
//
//  Created by Laura Yao on 6/22/21.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipPercentage;

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (void) viewDidAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    double deftip = [defaults doubleForKey:@"default_tip_percentage"];
    int defind = 0;
    if (deftip==0.15) defind = 0;
    else if (deftip==0.2) defind = 1;
    else defind = 2;
    
    self.tipPercentage.selectedSegmentIndex = defind;
}
- (IBAction)updateDefault:(id)sender {
    double tipPercentages[] = {0.15,0.2,0.25};
    double tipPercent = tipPercentages[self.tipPercentage.selectedSegmentIndex];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setDouble:tipPercent forKey:@"default_tip_percentage"];
    [defaults synchronize];
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
