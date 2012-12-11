# DSBarChart

A simple Objective-C Bar Chart / Histogram library.

Latest Version: 0.2.0

## Installation

### Manual Install

Simply click [here](https://github.com/dhilipsiva/DSBarChart/archive/master.zip) to download the file and add it into your project directory.

### Using CocoaPods

DSBarChart is also avilable on [CocoaPods](http://cocoapods.org/). To Install using CocoaPods, follow the instructions:

1. Open your Podfile
2. Append `pod 'DSBarChart',  '~> 0.2.0'`
3. Type `pod install` on terminal
4. Open your `.xcworkspace` file.

## Sample Usage

```objective-c
NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:
                          [NSNumber numberWithInt:30], @"0",
                          [NSNumber numberWithInt:40], @"1",
                          [NSNumber numberWithInt:20], @"2",
                          [NSNumber numberWithInt:56], @"3",
                          [NSNumber numberWithInt:70], @"4",
                          [NSNumber numberWithInt:34], @"5",
                          [NSNumber numberWithInt:43], @"6",
                          nil];
    NSArray *refs = [NSArray arrayWithObjects:@"M", @"Tu", @"W", @"Th", @"F", @"Sa", @"Su", nil];
    DSBarChart *chrt = [[DSBarChart alloc] initWithFrame:ChartView.bounds
                                                   color:[UIColor greenColor]
                                              references:refs
                                           andDictionary:dict];
    chrt.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    chrt.bounds = ChartView.bounds;
    [self.view addSubview:chrt];
```

## Output of the sample code above

<img src="https://raw.github.com/dhilipsiva/DSBarChart/master/DSBarChart.png"
 alt="DSBarChart" title="A simple objective-c Bar Chart / Histogram library." align="canter"/>
 
 
## Who is using DSBarChart

1. [ReWire](http://www.rewireapp.com/)

If you are using DSBarChart, please feel free to edit this list.

## Credits

1. [DhilipSiva](https://github.com/dhilipsiva)
2. [Gautam Jeyaraman](https://github.com/gautamjeyaraman)

## Final Note

As like many other developers, I would be happy if you give me an attribution if you use this. Drop a mail. Or buy me something from my wishlist:

1. [Amazon](http://www.amazon.com/registry/wishlist/2E251JJU12H5T)
2. [Flipkart](http://www.flipkart.com/wishlist/dhilipsiva)