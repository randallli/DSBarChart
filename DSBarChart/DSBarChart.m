//
//  DSBarChart.m
//  DSBarChart
//
//  Created by DhilipSiva Bijju on 31/10/12.
//  Copyright (c) 2012 Tataatsu IdeaLabs. All rights reserved.
//

#import "DSBarChart.h"

@interface DSBarChartInterestPoint : NSObject

@property (nonatomic) NSInteger column;
@property (nonatomic) CGFloat percentInColumn;
@end

@interface DSBarChart ()

@property (nonatomic) NSMutableArray * interestPoints;

@end

@implementation DSBarChart


-(DSBarChart *)initWithFrame:(CGRect)frame
                       color:(UIColor *)theColor
                  references:(NSArray *)references
                   andValues:(NSArray *)values
{
    self = [super initWithFrame:frame];
    if (self) {
        self.shouldCalculateMaxValue = YES;
        self.color = theColor;
        self.vals = values;
        self.refs = references;
    }
    return self;
}

-(void)calculate{
    NSAssert(self.vals.count == self.refs.count, @"expecting refs and vals to be the same size. found %i and %i", self.vals.count, self.refs.count);
    for (NSNumber *val in self.vals) {
        float iLen = [val floatValue];
        if (iLen > self.maxLen) {
            self.maxLen = iLen;
        }
    }
}

- (void) addInterestPointWithText:(NSString *) text inColumn:(NSInteger) column percentageInColumn:(CGFloat ) percentInColumn
{
    if(self.interestPoints == nil)
    {
        self.interestPoints = [NSMutableArray array];
    }
    DSBarChartInterestPoint * interestPoint = [[DSBarChartInterestPoint alloc] init];
    interestPoint.column = column;
    interestPoint.percentInColumn = percentInColumn;
    
    [self.interestPoints addObject:interestPoint];
    
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect
{
    /// Drawing code
    if(self.shouldCalculateMaxValue)
    {
        [self calculate];
    }
    NSInteger numberOfBars = self.vals.count;
    float paddingBetweenBars = 0.0f;
    float lineWidth = 1.0f;
    float rectWidth = (float)(rect.size.width - (numberOfBars * paddingBetweenBars )) / (float)numberOfBars;
    CGContextRef context = UIGraphicsGetCurrentContext();
    float LBL_HEIGHT = 20.0f, iLen, x, heightRatio, height, y;
    UIColor * evenColumnsColor = [self.color colorWithAlphaComponent:0.25f];
    UIColor * oddColumnsColor = [self.color colorWithAlphaComponent:0.2f];
    /// Set color and draw the bar
    CGContextSetStrokeColorWithColor(context, self.color.CGColor);
    CGContextSetFillColorWithColor(context, evenColumnsColor.CGColor);
    
    CGMutablePathRef pathRef = CGPathCreateMutable();
    
    CGPathMoveToPoint(pathRef, NULL, 0, rect.size.height);

    CGContextSetLineWidth(context, lineWidth/8);
    
    /// Draw Bars
    for (int barCount = 0; barCount < numberOfBars; barCount++) {
        
        /// Calculate dimensions
        iLen = [[self.vals objectAtIndex:barCount] floatValue];
        x = barCount * (rectWidth);
        heightRatio = iLen / self.maxLen;
        height = heightRatio * (rect.size.height - lineWidth - LBL_HEIGHT);
        if (height < 0.1f) height = 1.0f;
        y = rect.size.height - height - LBL_HEIGHT;
        
        UIColor * columnColor = nil;
        if(barCount % 2 == 0)
        {
            columnColor = evenColumnsColor;
        }
        else
        {
            columnColor = oddColumnsColor;
        }
        
        /// Reference Label.
        UILabel *lblRef = [[UILabel alloc] initWithFrame:CGRectMake(barCount + x, rect.size.height - LBL_HEIGHT, rectWidth, LBL_HEIGHT)];
        lblRef.text = [self.refs objectAtIndex:barCount];
        lblRef.adjustsFontSizeToFitWidth = TRUE;
        lblRef.adjustsLetterSpacingToFitWidth = TRUE;
        lblRef.textColor = self.color;
        [lblRef setTextAlignment:NSTextAlignmentCenter];
        lblRef.backgroundColor = [UIColor clearColor];
        [self addSubview:lblRef];
        
        /// value Label
        UILabel * valueLabel = [[UILabel alloc] initWithFrame:CGRectMake(barCount + x, y - LBL_HEIGHT, rectWidth, LBL_HEIGHT)];
        valueLabel.text = [NSString stringWithFormat:@"%@", [self.vals objectAtIndex:barCount]];
        valueLabel.adjustsFontSizeToFitWidth = TRUE;
        valueLabel.adjustsLetterSpacingToFitWidth = TRUE;
        valueLabel.textColor = columnColor;
        [valueLabel setTextAlignment:NSTextAlignmentCenter];
        valueLabel.backgroundColor = [UIColor clearColor];
        [self addSubview:valueLabel];
        
        
        CGPathAddLineToPoint(pathRef, NULL, x, y);
        CGPathAddLineToPoint(pathRef, NULL, x + rectWidth, y);

        CGRect barRect = CGRectMake(paddingBetweenBars + x, y, rectWidth, height);
        CGContextAddRect(context, barRect);
        
        CGContextSetFillColorWithColor(context, columnColor.CGColor);
        CGContextDrawPath(context, kCGPathFillStroke);
        
    }
    
    CGContextSetLineWidth(context, lineWidth);
    CGPathAddLineToPoint(pathRef, NULL, rect.size.width, rect.size.height);
    CGPathCloseSubpath(pathRef);
    CGContextAddPath(context, pathRef);
    CGContextDrawPath(context, kCGPathStroke);
    
    /// pivot
    UIColor * pivotColor = [UIColor redColor];
    CGRect frame = CGRectZero;
    frame.origin.x = rect.origin.x;
    frame.origin.y = rect.origin.y - LBL_HEIGHT;
    frame.size.height = LBL_HEIGHT;
    frame.size.width = rect.size.width;
    UILabel *pivotLabel = [[UILabel alloc] initWithFrame:frame];
    pivotLabel.text = [NSString stringWithFormat:@"%d", (int)self.maxLen];
    pivotLabel.backgroundColor = [UIColor clearColor];
    pivotLabel.textColor = pivotColor;
    [self addSubview:pivotLabel];
    
    /// A line
    frame = rect;
    frame.size.height = 0.25f;
    CGContextSetFillColorWithColor(context, pivotColor.CGColor);
    CGContextFillRect(context, frame);
    
    ///draw interest points
    
}


@end
