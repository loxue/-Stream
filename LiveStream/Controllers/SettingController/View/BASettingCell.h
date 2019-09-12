//
//  BASettingCell.h
//  LiveStream
//
//  Created by 马彦春 on 2019/6/13.
//  Copyright © 2019 intj. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BASettingCell : UITableViewCell

@property (nonatomic, strong) UIView *line;

+ (instancetype)cellWithTableViewCell:(UITableView *)tableView;
//- (void)setCellWithModel:(MeModel *)model;

@end

NS_ASSUME_NONNULL_END
