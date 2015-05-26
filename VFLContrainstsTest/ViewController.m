//
//  ViewController.m
//  VFLContrainstsTest
//
//  Created by dev on 15/5/22.
//  Copyright (c) 2015年 dev. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *button1;
@property (weak, nonatomic) IBOutlet UIButton *button2;
@property (weak, nonatomic) IBOutlet UIButton *button3;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self test];
    [self addBtn];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)test{
    @try {
        NSString *restorationId = self.restorationIdentifier;
        
        
        SEL sel = NSSelectorFromString(restorationId);
        
        
        [self performSelector:sel];
        
    }
    @catch (NSException *exception) {
        NSLog(@"%@", exception);
    }
    @finally {
    }
}

-(void)test1{
    NSLog(@"1111 %s", sel_getName(_cmd));
    
    [self fun];
    
    
}
-(void)test2{
    
    NSLog(@"%s", sel_getName(_cmd));
    
    UIButton* button = nil;
    
    button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"mgden1" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor greenColor];
    [self.view addSubview:button];
    
    _button1 = button;
    
    button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"mgden2" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor greenColor];
    [self.view addSubview:button];
    
    _button2 = button;
    
    button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"mgden3" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor greenColor];
    [self.view addSubview:button];
    
    _button3 = button;
    
    _button1.translatesAutoresizingMaskIntoConstraints = NO;
    _button2.translatesAutoresizingMaskIntoConstraints = NO;
    _button3.translatesAutoresizingMaskIntoConstraints = NO;

    
    [self fun];
    
}
-(void)fun{
    //创建需要参与约束规则的对象字典 <span style="font-family:Arial,Helvetica,sans-serif">表示这三个Button将参与Autolayout的约束处理</span>
    NSDictionary *viewsDic = NSDictionaryOfVariableBindings(_button1,_button2,_button3);
    
    NSArray *constraints = nil;
    constraints = [NSLayoutConstraint constraintsWithVisualFormat:
                   @"H:|-10-[_button1(==_button2@700)]-(>=8)-[_button2(_button3Width)]-[_button3(_button3Width)]-rectY-|"//水平 可视化格式语言
                                                          options:NSLayoutFormatAlignAllTop //对齐功能
                                                          metrics:@{@"rectY":@50,@"_button3Width":@60}//指标参数
                                                            views:viewsDic];//参与约束的对象字典
    [self.view addConstraints:constraints];
    
    constraints = [NSLayoutConstraint constraintsWithVisualFormat:
                   @"V:[_button3]-40-|" //垂直 可视化格式语言
                                                          options:0 //无条件
                                                          metrics:nil//不带指标参数
                                                            views:viewsDic];//参与约束的对象字典
    
    [self.view addConstraints:constraints];
    [_button1 setContentHuggingPriority:249 forAxis:UILayoutConstraintAxisHorizontal];
    
}

-(void) addBtn{
    UIButton *button=[[UIButton alloc]init];
    [button setTitle:@"点击一下" forState:UIControlStateNormal];
    button.translatesAutoresizingMaskIntoConstraints=NO;
    [button setBackgroundColor:[UIColor blackColor]];
    [self.view addSubview:button];
    NSArray *constraints1=[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[button]-|"
                                                                  options:0
                                                                  metrics:nil
                                                                    views:NSDictionaryOfVariableBindings(button)];
    
    NSArray *constraints2=[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[button(==height)]"
                                                                  options:0
                                                                  metrics:@{@"height":@30}
                                                                    views:NSDictionaryOfVariableBindings(button)];
    
    [self.view addConstraints:constraints1];
    [self.view addConstraints:constraints2];
    
    
    UIButton *button1=[[UIButton alloc]init];
    button1.translatesAutoresizingMaskIntoConstraints=NO;
    [button1 setTitle:@"请不要点击我" forState:UIControlStateNormal];
    [button1 setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:button1];
    
    NSArray *constraints3=[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[button1(button)]"
                                                                  options:0
                                                                  metrics:nil
                                                                    views:NSDictionaryOfVariableBindings(button1,button)];
    
    NSArray *constraints4=[NSLayoutConstraint constraintsWithVisualFormat:@"V:[button]-100-[button1(button)]"
                                                                  options:0
                                                                  metrics:nil
                                                                    views:NSDictionaryOfVariableBindings(button1,button)];
    [self.view addConstraints:constraints3];
    [self.view addConstraints:constraints4];
}
@end
