//
//  RankTableViewController.m
//  TortureYourFinger
//
//  Created by 刘畅 on 16/2/10.
//  Copyright © 2016年 LCfan. All rights reserved.
//

#import "RankTableViewController.h"

@interface RankTableViewController ()

@end

@implementation RankTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerNib:[UINib nibWithNibName:@"RankTableViewCell" bundle:nil] forCellReuseIdentifier:@"RankCell"];
    _rankData=[[RankData alloc]init];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    NSLog(@"   %lu",_rankData.controller.sections.count);
    return _rankData.controller.sections.count;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    id <NSFetchedResultsSectionInfo> sectionInfo=_rankData.controller.sections[0];
    NSLog(@"nuberrows sectionInfo:%@",sectionInfo);
    return sectionInfo.numberOfObjects;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RankTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RankCell" forIndexPath:indexPath];
    Ranks* obj=(Ranks*)[_rankData.controller objectAtIndexPath:indexPath];
    NSLog(@"obj: %@",obj);
    
    cell.ame.text=[obj playerName];
    cell.score.text=[NSString stringWithFormat:@"%ld",(long)[obj score]];
    NSLog(@"tc");

    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
