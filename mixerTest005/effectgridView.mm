//
//  effectgridView.m
//  mixerTest003
//
//  Created by Christian Persson on 2012-02-05.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Shared.h"
#import "effectgridView.h"

@implementation effectgridView

@synthesize param1, param2, curr_x, curr_y;
@synthesize param1Lbl, param2Lbl;
@synthesize effectType;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        CGSize size = self.frame.size;
        self.param1Lbl = [[UILabel alloc] initWithFrame:CGRectZero];
        self.param1Lbl.backgroundColor = [UIColor clearColor];
        //     headerLabel.opaque = NO;
        self.param1Lbl.textColor = [[UIColor whiteColor] colorWithAlphaComponent:1];
       // param1.highlightedTextColor = [UIColor whiteColor];
        self.param1Lbl.font = [UIFont fontWithName:@"GothamHTF-BookItalic" size:(16.0)];
        self.param1Lbl.frame = CGRectMake(70, -40, 100, 20.0);
        [self addSubview:self.param1Lbl];
        
        self.param2Lbl = [[UILabel alloc] initWithFrame:CGRectZero];
        self.param2Lbl.backgroundColor = [UIColor clearColor];
        //     headerLabel.opaque = NO;
        self.param2Lbl.textColor = [[UIColor whiteColor] colorWithAlphaComponent:1];
        // param1.highlightedTextColor = [UIColor whiteColor];
        self.param2Lbl.font = [UIFont fontWithName:@"GothamHTF-BookItalic" size:(16.0)];
        self.param2Lbl.frame = CGRectMake(70, -20, 100, 20.0);
        [self addSubview:self.param2Lbl];
        
    }
    return self;
}

- (void)updateparamVal{
    
    if (self.param2 < 0){
        self.param2 = self.param2 - self.param2 - self.param2;
    }
    else{
        self.param2 = self.param2 - self.param2 - self.param2;
    }
    
    if ([self.effectType isEqualToString:@"TimePitch"]){
        if ([Shared sharedInstance].curVariSpeedEffect == 0){
            self.param1Lbl.text = [NSString stringWithFormat:@"Playback rate: %.1lf",self.param1];
        }else{
            self.param1Lbl.text = [NSString stringWithFormat:@"Rate: %.1lf",self.param1];
        }
    }
    else if ([self.effectType isEqualToString:@"Lopass"]){
        self.param1Lbl.text = [NSString stringWithFormat:@"Freq: %.1lf",self.param1];
        self.param2Lbl.text = [NSString stringWithFormat:@"Res: %.1lf",self.param2];
    }
    else if ([self.effectType isEqualToString:@"Hipass"]){
        self.param1Lbl.text = [NSString stringWithFormat:@"Freq: %.1lf",self.param1];
        self.param2Lbl.text = [NSString stringWithFormat:@"Res: %.1lf",self.param2];
    }
    else if ([self.effectType isEqualToString:@"Reverb"]){
        self.param1Lbl.text = [NSString stringWithFormat:@"Dry/Wet: %.1lf",self.param2];
        self.param2Lbl.text = [NSString stringWithFormat:@"Gain: %.1lf",self.param1];
    }
    else if ([self.effectType isEqualToString:@"Volume"]){
        self.param1Lbl.text = [NSString stringWithFormat:@"Vol: %.1lf",self.param1];
    //    self.param2Lbl.text = [NSString stringWithFormat:@"Gain: %.1lf",self.param2];
    }
    
}

- (void)drawRect:(CGRect)rect
{
    [self updateparamVal];
  /*  int nrofverticallines = self.frame.size.width/20;
    for (int i=0;i<nrofverticallines;i++){
        int x = nrofverticallines * i;
        
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSetLineWidth(context, 1);
        CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
        CGFloat components[] = {self.param1/255.f, curr_x/255.f, curr_y/255.f, .7};
        CGColorRef color = CGColorCreate(colorspace, components);
        CGContextSetStrokeColorWithColor(context, color);
        
        float dashPhase = 0.0;
        float dashLengths[] = { 20, 30, 40, 30, 20, 10 };
      
    //    CGContextSetLineDash( context,
    //                         dashPhase, dashLengths,
    //                         sizeof( dashLengths ) / sizeof( float ) );
        
        CGContextMoveToPoint(context, x, 0);
        CGContextAddLineToPoint(context, x, self.frame.size.height);
            
        CGContextStrokePath(context);
        
        CGColorSpaceRelease(colorspace);
        CGColorRelease(color);
        
    }
    int nrofhorizontallines = self.frame.size.height/20;
    for (int i=0;i<nrofhorizontallines;i++){
        int y = nrofhorizontallines * i;
        
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSetLineWidth(context, 1);
        CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
        CGFloat components[] = {self.param1/255.f, curr_x/255.f, curr_y/255.f, .7};
        CGColorRef color = CGColorCreate(colorspace, components);
        CGContextSetStrokeColorWithColor(context, color);
        
        float dashPhase = 0.0;
        float dashLengths[] = { 20, 30, 40, 30, 20, 10 };
        
      //  CGContextSetLineDash( context,
      //                       dashPhase, dashLengths,
      //                       sizeof( dashLengths ) / sizeof( float ) );
        
        CGContextMoveToPoint(context, 0, y);
        CGContextAddLineToPoint(context, self.frame.size.width, y);
        
        CGContextStrokePath(context);
        
        CGColorSpaceRelease(colorspace);
        CGColorRelease(color);
        
    }
    */
   /* [self updateparamVal];
    int x = [Shared sharedInstance].effectgridX;
    int y = [Shared sharedInstance].effectgridY;
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 4.0);
    CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
    CGFloat components[] = {1, 1, 1, 1};
    CGColorRef color = CGColorCreate(colorspace, components);
    CGContextSetStrokeColorWithColor(context, color);
    
    float dashPhase = 0.0;
    float dashLengths[] = { 20, 30, 40, 30, 20, 10 };
    CGContextSetLineDash( context,
                         dashPhase, dashLengths,
                         sizeof( dashLengths ) / sizeof( float ) );
 
    if (x > 0){
        CGContextMoveToPoint(context, x, 0);
        CGContextAddLineToPoint(context, x,self.frame.size.height);
        
        CGContextStrokePath(context);
        
    }
    if (y > 0){
        CGContextMoveToPoint(context, 0, y);
        CGContextAddLineToPoint(context, self.frame.size.width,y);
        
        CGContextStrokePath(context);
        
    }
    
    CGColorSpaceRelease(colorspace);
    CGColorRelease(color);
    */
}

- (void)dealloc{
    [param1Lbl release];
    [param2Lbl release];
    
    [super dealloc];
}


@end
