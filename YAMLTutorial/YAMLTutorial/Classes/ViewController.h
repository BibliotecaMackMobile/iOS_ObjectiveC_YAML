//
//  ViewController.h
//  YAMLTutorial
//
//  Created by Kaê Coutinho on 9/27/14.
//  Copyright (c) 2014 Kaê Angeli Coutinho. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <YAML-Framework/YAMLSerialization.h>
#define YAML_DATA_FILE_PATH [[NSBundle mainBundle] pathForResource:@"Data" ofType:@"yaml"]

@interface ViewController : UIViewController

@property (weak,nonatomic) IBOutlet UILabel * nameLabel;
@property (weak,nonatomic) IBOutlet UILabel * creatorLabel;
@property (weak,nonatomic) IBOutlet UILabel * platformLabel;
@property (weak,nonatomic) IBOutlet UITextView * listExampleTextField;
@property (weak,nonatomic) IBOutlet UITextView * yetAnotherListExampleTextField;

@end