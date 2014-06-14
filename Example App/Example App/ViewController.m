//
//  ViewController.m
//  Example App
//
//  Created by Matt Zanchelli on 6/10/14.
//  Copyright (c) 2014 Matt Zanchelli. All rights reserved.
//

#import "ViewController.h"
#import "MTZRadialMenu.h"

@implementation ViewController
            
- (void)viewDidLoad
{
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	CGRect middle = CGRectMake(138, 269, 44, 44);
	CGRect right = CGRectMake(271, 269, 44, 44);
	CGRect left = CGRectMake(5, 269, 44, 44);
	
	MTZRadialMenu *radialMenu = [[MTZRadialMenu alloc] initWithFrame:right];
	[radialMenu setImage:[UIImage imageNamed:@"Circle"] forState:UIControlStateNormal];
	[radialMenu setImage:[UIImage imageNamed:@"CircleHighlighted"] forState:UIControlStateSelected];
	[self.view addSubview:radialMenu];
	
	MTZAction *send = [MTZAction actionOfType:MTZActionTypeConfirm handler:^(MTZRadialMenu *radialMenu, MTZAction *action) {
		NSLog(@"Send");
		[radialMenu dismissMenuAnimated:YES];
	}];
	[radialMenu setAction:send forLocation:MTZRadialMenuLocationTop];
	
	MTZAction *cancel = [MTZAction actionOfType:MTZActionTypeCancel handler:^(MTZRadialMenu *radialMenu, MTZAction *action) {
		NSLog(@"Cancel");
		[radialMenu dismissMenuAnimated:YES];
	}];
	[radialMenu setAction:cancel forLocation:MTZRadialMenuLocationLeft];
	
	MTZAction *play = [MTZAction actionWithImage:[UIImage imageNamed:@"ActionPlay"]
								highlightedImage:[UIImage imageNamed:@"ActionPlayHighlighted"]
										 handler:^(MTZRadialMenu *radialMenu, MTZAction *action) {
											 NSLog(@"Play");
										 }];
	[radialMenu setAction:play forLocation:MTZRadialMenuLocationBottom];
}

@end
