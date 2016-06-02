//
//  ViewController.m
//  DragViewDemo
//
//  Created by Arthur Knopper on 1/13/13.
//  Copyright (c) 2013 Arthur Knopper. All rights reserved.
//

#import "ViewController.h"

#define BARBUTTON(TITLE, SELECTOR) 	[[UIBarButtonItem alloc] initWithTitle:TITLE style:UIBarButtonItemStylePlain target:self action:SELECTOR]

@interface ViewController () <DragViewDelegate>

@property DragView *trash;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    CGFloat halfSizeOfView = 25.0f;
    
    self.view.backgroundColor = [UIColor blackColor];
    
    NSInteger maxViews = 10;
    
    CGSize insetSize = CGRectInset(self.view.bounds, 2*halfSizeOfView, 2*halfSizeOfView).size;
    
    // Add the Views
	for (int i = 0; i < maxViews; i++)
	{
        // Return a random position within the inset bounds
        CGFloat pointX = random() % ((int)insetSize.width) + halfSizeOfView;
        CGFloat pointY = random() % ((int)insetSize.height) + halfSizeOfView;
        
        DragView2 *flowerDragger = [[DragView2 alloc] initWithFrame:CGRectMake(pointX, pointY, 50, 50)];
		[self.view addSubview:flowerDragger];
        flowerDragger.delegate = self;
    }

    self.trash = [[DragView alloc] initWithImage:[UIImage imageNamed:@"blueFlower"]];
    self.trash.center = CGPointMake(self.view.bounds.size.width - halfSizeOfView, self.view.bounds.size.height - halfSizeOfView);
    [self.view addSubview:self.trash];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dragView:(UIView *)dragView didUpdateCenter:(CGPoint)center
{
    if(CGRectContainsPoint(self.trash.frame, center)) {
        [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
            dragView.center = self.trash.center;
            dragView.alpha = 0;
        } completion:nil];
    }
}

@end
