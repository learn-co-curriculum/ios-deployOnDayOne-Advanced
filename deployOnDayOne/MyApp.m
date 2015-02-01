//
//  MyApp.m
//  deployOnDayOne
//
//  Created by Zachary Drossman on 1/28/15.
//  Copyright (c) 2015 Zachary Drossman. All rights reserved.
//

#import "MyApp.h"
#import "FirebaseAPI.h"

@interface MyApp()

- (void)logout;
- (void)login;

@property (strong, nonatomic, readwrite) NSString *currentUser;
@property (strong, nonatomic) FirebaseAPI *firebaseAPI;

@end
@implementation MyApp

static NSString* firebaseURL = @"https://get2knowurnewbesties.firebaseio.com";

-(void)execute {
    
    self.firebaseAPI = [[FirebaseAPI alloc] init];
    
    [self login];
    
    self.firebaseAPI.currentUser = self.currentUser;
    [self.firebaseAPI createNewUser];
    
    NSString *menuResult = [self displayMenu];
    
    
//    [self.firebaseAPI createNewInterviewQuestionCategory:@"About Me"];
//    [self.firebaseAPI createNewInterviewQuestion:@"How old are you?" inCategory:@"About Me"];
//    [self.firebaseAPI createNewInterviewQuestion:@"What is your favorite color?" inCategory:@"Miscellaneous"];
//    [self.firebaseAPI createNewInterviewQuestion:@"Where do you come from?" inCategory:@"About Me"];
//    
//    NSArray *questionsList = [self getQuestionsAndFormatThem];
//    
//    NSLog([NSString stringWithFormat:@"%@",questionsList ]);
    
    if ([menuResult isEqualToString:@"1"]) {
        NSLog(@"How old are you?");
        NSString *newAnswer = [self requestKeyboardInput];
        [self.firebaseAPI createAnswer:newAnswer forInterviewQuestion:@"-Jgwnwy883Z8grmSTkBJ"];
    }
    NSDictionary *users = [self.firebaseAPI getUsers];
    NSLog(@"%@",users);
    
    NSDictionary *categories = [self.firebaseAPI getCategories];
    NSLog(@"%@",categories);
    
//    NSDictionary *answersForJoeUser = [self.firebaseAPI getAllAnswersForUser:@"Joe"];
//    NSDictionary *answersForAndrewUser = [self.firebaseAPI getAllAnswersForUser:@"Andrew"];
//    [self.firebaseAPI getAllAnswersForQuestion:@"-Jgw_yisKVCLfEZ0gyFI"];
    
//    NSDictionary *usersDictionary = [self getListOfUsers];
}

-(NSArray *)getQuestionsAndFormatThem {

    NSMutableArray *questionsList = [[NSMutableArray alloc] init];
    
    NSDictionary *unformattedQuestionsDictionary = [self.firebaseAPI getQuestions];
    
    for (NSString* identifier in unformattedQuestionsDictionary) {
        NSDictionary *subdictionary = [unformattedQuestionsDictionary objectForKey:identifier];
        [questionsList addObject:[[subdictionary allKeys] firstObject]];
    }
    
    return questionsList;
}

-(NSString *)requestKeyboardInput {
    char string[4096];
    scanf("%s", string);
    return [NSString stringWithUTF8String:string];
}

- (void)login {
    NSLog(@"Please login with your full name:");
    self.currentUser = [self requestKeyboardInput];
}

- (void)answerQuestion {
    
}

- (void)writeNewQuestion {
    [self.questionsList addObject:[self requestKeyboardInput]];
}

- (NSString *)displayMenu {
    NSLog(@"Please choose from the following three options:\r\r1. Be interviewed.\r2. Write a new interview question.\r3. Read an interview with another student.\r\rSimply type in the option number you are interested in, and press enter.");
    return [self requestKeyboardInput];
}

- (void)logout {
    self.currentUser = nil;
}
@end
