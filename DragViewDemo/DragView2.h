//
//  DragView2.h
//  DragViewDemo
//
//  Created by Arthur Knopper on 1/13/13.
//  Copyright (c) 2013 Arthur Knopper. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DragViewDelegate <NSObject>

- (void)dragView:(UIView *)dragView didUpdateCenter:(CGPoint)center;

@end


@interface DragView2 : UIView
{
    CGPoint lastLocation;
}
@property (nonatomic, weak) id<DragViewDelegate> delegate;

@end
