//
//  BASettingCell.m
//  LiveStream
//
//  Created by 马彦春 on 2019/6/13.
//  Copyright © 2019 intj. All rights reserved.
//

#import "BASettingCell.h"

@implementation BASettingCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

+ (instancetype)cellWithTableViewCell:(UITableView *)tableView {
    BASettingCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BASettingCell"];
    if (!cell) {
        cell = [[BASettingCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"BASettingCell"];
        [tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = SETTING_LIST_COLOR;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    [self setCell];
    return self;
}

- (void)setCell {
    self.line = [[UIView alloc] initWithFrame:CGRectMake(40, 49.5, SCREEN_WIDTH-40, 0.5)];
    self.line.backgroundColor = LINE_COLOR;
    [self addSubview:self.line];
    
    /** 切换主题 */
    /** 清除缓存 */
    /** 检查更新 */
    /** 分享给好友 */
    /** 关于我 */
}

//- (void)setCellWithModel:(MeModel *)model {
//    NSLog(@"%@%@", model.title, model.image);
//    self.textLabel.text = model.title;
//    self.imageView.image = [UIImage imageNamed:model.image];
//}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
