//
//  HomeViewCell.h
//  LiveStream
//
//  Created by 马彦春 on 2019/6/10.
//  Copyright © 2019 intj. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    BATabeViewCellStyleCarousel  = 0,     //轮播模式
    BATabeViewCellStyleCricleButtons = 1,   //原型按钮模式
    BATabeViewCellStyleSquareButtons = 2,   //方形按钮模式
    BATabeViewCellStyleNormalButtons = 3,   //正常按钮形式
    BATabeViewCellStyleNone = 4, //无样式
} BATabeViewCellStyle;

@interface HomeViewCell : UITableViewCell

+ (instancetype)cellWithTableViewCell:(UITableView *)tableView;

@end
