static UILabel *ALClockLabel;
@interface SBIcon : NSObject
-(id)leafIdentifier;
@end
@interface SBIconView : UIView
-(id)initWithDefaultSize;
-(id)icon;
-(void)setIcon:(id)icon;
@end
%hook SBIconView
-(void)setIcon:(id)icon{
	%orig;
	if([[icon leafIdentifier] isEqualToString:@"com.tinyhearts.wake"]){
		NSDateFormatter *dateFormatter=[[NSDateFormatter alloc] init];
		[dateFormatter setDateFormat:@"hh:mm"];
		ALClockLabel=[[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width/2-18.5,18.5,37,20)];
		ALClockLabel.textAlignment=UITextAlignmentCenter;
		ALClockLabel.textColor=[UIColor whiteColor];
		ALClockLabel.font=[UIFont systemFontOfSize:12];
		ALClockLabel.text=[dateFormatter stringFromDate:[NSDate date]];
		ALClockLabel.backgroundColor=[UIColor clearColor];
		[self addSubview:ALClockLabel];
		[ALClockLabel release];
		[dateFormatter release];
		[NSTimer scheduledTimerWithTimeInterval:0.5f target:self selector:@selector(updateWakeLiveClockDigitalLabel) userInfo:nil repeats:YES];
	}
}
%new -(void)updateWakeLiveClockDigitalLabel{
	NSDateFormatter *dateFormatter=[[NSDateFormatter alloc] init];
	[dateFormatter setDateFormat:@"hh:mm"];
	ALClockLabel.text=[dateFormatter stringFromDate:[NSDate date]];
	[dateFormatter release];
}
%end