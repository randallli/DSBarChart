//
//  DSViewController.m
//  DSBarChart
//
//  Created by DhilipSiva Bijju on 31/10/12.
//  Copyright (c) 2012 Tataatsu IdeaLabs. All rights reserved.
//

#import "DSViewController.h"
#import "DSBarChart.h"

@interface DSViewController ()

@end

@implementation DSViewController
@synthesize ChartView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSInteger maxValue = 0;
    {
        NSArray *vals = [NSArray arrayWithObjects:
                         [NSNumber numberWithInt:30],
                         [NSNumber numberWithInt:40],
                         [NSNumber numberWithInt:20],
                         [NSNumber numberWithInt:56],
                         [NSNumber numberWithInt:90],
                         [NSNumber numberWithInt:34],
                         [NSNumber numberWithInt:43],
                         nil];
        NSArray *refs = [NSArray arrayWithObjects:@"M", @"Tu", @"W", @"Th", @"F", @"Sa", @"Su", nil];
        DSBarChart *chrt = [[DSBarChart alloc] initWithFrame:ChartView.bounds
                                                       color:[UIColor greenColor]
                                                  references:refs
                                                   andValues:vals];
        chrt.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [ChartView addSubview:chrt];
        maxValue = chrt.maxLen;
    }
    
    {
        NSArray *vals = [NSArray arrayWithObjects:
                         [NSNumber numberWithInt:3],
                         [NSNumber numberWithInt:50],
                         [NSNumber numberWithInt:2],
                         [NSNumber numberWithInt:5],
                         [NSNumber numberWithInt:60],
                         [NSNumber numberWithInt:3],
                         [NSNumber numberWithInt:4],
                         nil];
        NSArray *refs = [NSArray arrayWithObjects:@"M", @"Tu", @"W", @"Th", @"F", @"Sa", @"Su", nil];
        DSBarChart *chrt = [[DSBarChart alloc] initWithFrame:ChartView.bounds
                                                       color:[UIColor orangeColor]
                                                  references:refs
                                                   andValues:vals];
        chrt.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        chrt.opaque = NO;
        chrt.shouldCalculateMaxValue = NO;
        chrt.maxLen = 90;
        [ChartView addSubview:chrt];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
