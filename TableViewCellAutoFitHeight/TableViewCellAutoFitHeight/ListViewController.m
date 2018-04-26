//
//  ListViewController.m
//  TableViewCellAutoFitHeight
//
//  Created by HanYong on 2018/4/15.
//  Copyright © 2018年 HanYong. All rights reserved.
//

#import "ListViewController.h"
#import "ListTableViewCell.h"

static NSString *const ReuseIdentifier = @"cell";

@interface ListViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationItem.title = @"标题";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"reladdata" style:UIBarButtonItemStylePlain target:self action:@selector(rightBarButtonItemDidClick:)];
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([ListTableViewCell class]) bundle:nil] forCellReuseIdentifier:ReuseIdentifier];
}

#pragma mark - Methods
- (void)rightBarButtonItemDidClick:(UIBarButtonItem *)item
{
    [self.tableView reloadData];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ReuseIdentifier];
    cell.model = self.dataArray[indexPath.row];
    return cell;
}

-(NSMutableArray *)dataArray{
    
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
        
        NSString *string = @"燕子去了，有再来的时候；杨柳枯了，有再青的时候；桃花谢了，有再开的时候。但是，聪明的，你告诉我，我们的日子为什么一去不复返呢？ ——是有人偷了他们罢：那是谁？又藏在何处呢？是他们自己逃走了：现在又到了哪里呢？";
        
        for (int i=0; i<100; i++) {
            ListModel *model = [[ListModel alloc] init];
            NSInteger index = (arc4random()%(string.length / 20))*20;
            model.desc = [string substringToIndex:MAX(20, index)];
            
            [_dataArray addObject:model];
        }
    }
    
    return _dataArray;
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
