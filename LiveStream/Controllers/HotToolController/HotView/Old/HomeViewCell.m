//
//  HomeViewCell.m
//  LiveStream
//
//  Created by 马彦春 on 2019/6/10.
//  Copyright © 2019 intj. All rights reserved.
//

#import "HomeViewCell.h"

@implementation HomeViewCell
{
    BATabeViewCellStyle tableViewCellStyle;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

+ (instancetype)cellWithTableViewCell:(UITableView *)tableView {
    HomeViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HomeViewCell"];
    if (!cell) {
        cell = [[HomeViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"HomeViewCell"];
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
    
    [self setCellWithStyle:tableViewCellStyle];
    return self;
}

- (void)setCellWithStyle:(BATabeViewCellStyle)cellStyle {
    switch (cellStyle) {
        case 0:
        {
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.frame = RECT(0, 0, 32, 20);
            btn.backgroundColor = FOOTER_VIEW_TITLECOLOR;
            [self.contentView addSubview:btn];
        }
            break;
        case 1:
        {
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.frame = RECT(0, 0, 64, 20);
            btn.backgroundColor = FOOTER_VIEW_TITLECOLOR;
            [self.contentView addSubview:btn];
        }
            break;
        case 2:
        {
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.frame = RECT(0, 0, 81, 20);
            btn.backgroundColor = FOOTER_VIEW_TITLECOLOR;
            [self.contentView addSubview:btn];
        }
            break;
        case 3:
        {
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.frame = RECT(0, 0, 108, 20);
            btn.backgroundColor = FOOTER_VIEW_TITLECOLOR;
            [self.contentView addSubview:btn];
        }
            break;
        case 4:
        {
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.frame = RECT(0, 0, 150, 20);
            btn.backgroundColor = FOOTER_VIEW_TITLECOLOR;
            [self.contentView addSubview:btn];
        }
            break;
            
        default:
            break;
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
