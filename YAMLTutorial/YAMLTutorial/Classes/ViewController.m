//
//  ViewController.m
//  YAMLTutorial
//
//  Created by Kaê Coutinho on 9/27/14.
//  Copyright (c) 2014 Kaê Angeli Coutinho. All rights reserved.
//

#import "ViewController.h"

@interface ViewController()
{
    id YAMLData;
}

-(void)initialize;
-(void)parseYAMLDataFile;

@end

@implementation ViewController

@synthesize nameLabel;
@synthesize creatorLabel;
@synthesize platformLabel;
@synthesize listExampleTextField;
@synthesize yetAnotherListExampleTextField;

#pragma mark - Constructors

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if(self)
    {
        //
    }
    return self;
}

#pragma mark - UIView

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self initialize];
}

-(void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Auxiliary Methods

-(void)initialize
{
    [self parseYAMLDataFile];
    if(YAMLData)
    {
        [nameLabel setText:[NSString stringWithFormat:@"Name: %@",YAMLData[@"Name"]]];
        [creatorLabel setText:[NSString stringWithFormat:@"Creator: %@",YAMLData[@"Creator"]]];
        [platformLabel setText:[NSString stringWithFormat:@"Platform: %@",YAMLData[@"Platform"]]];
        [listExampleTextField setText:@"List Example:\n"];
        [yetAnotherListExampleTextField setText:@"Yet Another List Example:\n"];
        for(id content in YAMLData[@"ListExample"])
        {
            [listExampleTextField setText:[NSString stringWithFormat:@"%@\n%@",[listExampleTextField text],content]];
        }
        for(id content in YAMLData[@"YetAnotherListExample"])
        {
            [yetAnotherListExampleTextField setText:[NSString stringWithFormat:@"%@\n%@",[yetAnotherListExampleTextField text],content]];
        }
    }
}

-(void)parseYAMLDataFile
{
    NSError * parseError;
    NSInputStream * YAMLDataInputStream = [NSInputStream inputStreamWithFileAtPath:YAML_DATA_FILE_PATH];
    YAMLData = [[YAMLSerialization objectsWithYAMLStream:YAMLDataInputStream options:kYAMLReadOptionStringScalars error:&parseError] firstObject];
    if(parseError)
    {
        NSLog(@"\n Impossible to read YAML file. Reason:\n\n %@",[parseError description]);
        YAMLData = nil;
    }
}

@end
