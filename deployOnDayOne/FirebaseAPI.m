//
//  FirebaseAPI.m
//  deployOnDayOne
//
//  Created by Zachary Drossman on 1/29/15.
//  Copyright (c) 2015 Zachary Drossman. All rights reserved.
//

#import "FirebaseAPI.h"

@implementation FirebaseAPI

- (NSDictionary *)getUsers {
    
    NSData *returnData = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"https://get2knowurnewbesties.firebaseio.com/users.json"]];
    
    NSDictionary *returnDictionary = [NSJSONSerialization JSONObjectWithData:returnData options:0 error:nil];
    
    return returnDictionary;
    
}
- (void)createNewUser {
    
    NSData *returnData = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"https://get2knowurnewbesties.firebaseio.com/users.json"]];
    
    NSDictionary *returnDictionary = [NSJSONSerialization JSONObjectWithData:returnData options:0 error:nil];
    
    if (![self.currentUser isEqualToString:@""] && self.currentUser != nil) {
        if (returnDictionary) {
            [self patchUser:@{self.currentUser:@"true"}];
        }
        else {
            [self putUser:@{self.currentUser:@"true"}];
        }
    }
    else {
        NSLog(@"Entry invalid. Please enter an actual name.");
    }
}
- (void)putUser: (NSDictionary *)userDictionary {
    
    NSURL *usersURL = [NSURL URLWithString:@"https://get2knowurnewbesties.firebaseio.com/users.json"];
    
    NSData *returnData = [[NSData alloc]init];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:usersURL];
    request.HTTPMethod = @"PUT";
    request.HTTPBody = [NSJSONSerialization dataWithJSONObject:userDictionary options:0 error:nil];
    returnData = [NSURLConnection sendSynchronousRequest: request returningResponse: nil error: nil];
}
- (void)patchUser: (NSDictionary *)userDictionary {
    
    NSURL *usersURL = [NSURL URLWithString:@"https://get2knowurnewbesties.firebaseio.com/users.json"];
    
    NSData *returnData = [[NSData alloc]init];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:usersURL];
    request.HTTPMethod = @"PATCH";
    request.HTTPBody = [NSJSONSerialization dataWithJSONObject:userDictionary options:0 error:nil];
    returnData = [NSURLConnection sendSynchronousRequest: request returningResponse: nil error: nil];
}

- (NSDictionary *)getQuestions {
    NSData *returnData = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"https://get2knowurnewbesties.firebaseio.com/questions.json"]];
    
    NSDictionary *returnDictionary = [NSJSONSerialization JSONObjectWithData:returnData options:0 error:nil];
    
    return returnDictionary;
}
- (void)createNewInterviewQuestion:(NSString *)question inCategory:(NSString *)category{
    NSData *returnData = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"https://get2knowurnewbesties.firebaseio.com/questions.json"]];
    
    NSDictionary *returnDictionary = [NSJSONSerialization JSONObjectWithData:returnData options:0 error:nil];
    
    if (![question isEqualToString:@""] || question != nil) {
            [self postQuestion:@{question:category}];
    }
    else {
        NSLog(@"Entry invalid. Please enter an actual question.");
    }
}
- (void)postQuestion: (NSDictionary *)questionDictionary {
    NSURL *usersURL = [NSURL URLWithString:@"https://get2knowurnewbesties.firebaseio.com/questions.json"];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:usersURL];
    request.HTTPMethod = @"POST";
    request.HTTPBody = [NSJSONSerialization dataWithJSONObject:questionDictionary options:0 error:nil];
    [NSURLConnection sendSynchronousRequest: request returningResponse: nil error: nil];
}
- (void)patchQuestion: (NSDictionary *)questionDictionary {
    NSURL *usersURL = [NSURL URLWithString:@"https://get2knowurnewbesties.firebaseio.com/questions/question.json"];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:usersURL];
    request.HTTPMethod = @"PATCH";
    request.HTTPBody = [NSJSONSerialization dataWithJSONObject:questionDictionary options:0 error:nil];
    [NSURLConnection sendSynchronousRequest: request returningResponse: nil error: nil];
}

- (NSDictionary *)getCategories {
    
    NSData *returnData = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"https://get2knowurnewbesties.firebaseio.com/categories.json"]];
    
    NSDictionary *returnDictionary = [NSJSONSerialization JSONObjectWithData:returnData options:0 error:nil];
    
    return returnDictionary;
}
- (void)createNewInterviewQuestionCategory:(NSString *)category {
    NSData *returnData = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"https://get2knowurnewbesties.firebaseio.com/categories.json"]];
    
    NSDictionary *returnDictionary = [NSJSONSerialization JSONObjectWithData:returnData options:0 error:nil];
    
    if (![category isEqualToString:@""] || category != nil) {
        if (returnDictionary) {
            [self patchCategory:@{category:@"true"}];
        }
        else {
            [self putCategory:@{category:@"true"}];
        }
    }
    else {
        NSLog(@"Entry invalid. Please enter an actual category.");
    }
}
- (void)putCategory: (NSDictionary *)categoryDictionary {
    
    NSURL *usersURL = [NSURL URLWithString:@"https://get2knowurnewbesties.firebaseio.com/categories.json"];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:usersURL];
    request.HTTPMethod = @"PUT";
    request.HTTPBody = [NSJSONSerialization dataWithJSONObject:categoryDictionary options:0 error:nil];
    [NSURLConnection sendSynchronousRequest: request returningResponse: nil error: nil];
}
- (void)patchCategory: (NSDictionary *)categoryDictionary {
    
    NSURL *usersURL = [NSURL URLWithString:@"https://get2knowurnewbesties.firebaseio.com/categories.json"];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:usersURL];
    request.HTTPMethod = @"PATCH";
    request.HTTPBody = [NSJSONSerialization dataWithJSONObject:categoryDictionary options:0 error:nil];
    [NSURLConnection sendSynchronousRequest: request returningResponse: nil error: nil];
}

- (void)createAnswer:(NSString *)answer forInterviewQuestion:(NSString *)questionID {
   
    NSData *returnData = [NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://get2knowurnewbesties.firebaseio.com/answers/%@.json",questionID]]];
    
    NSDictionary *returnDictionary = [NSJSONSerialization JSONObjectWithData:returnData options:0 error:nil];
    
    if (![answer isEqualToString:@""] || answer != nil) {
        if (returnDictionary) {
            [self patchAnswer:@{questionID:@{self.currentUser:answer}}];
        }
        else {
            [self putAnswer:@{questionID:@{self.currentUser:answer}}];
        }
    }
    else {
        NSLog(@"Entry invalid. Please enter an actual answer.");
    }
    
    
}
- (void)patchAnswer:(NSDictionary *)answerDictionary {
    NSString *userQuestionURL = [NSString stringWithFormat:@"@https://get2knowurnewbesties.firebaseio.com/answers.json"];
    NSURL *questionURL = [NSURL URLWithString:userQuestionURL];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:questionURL];
    request.HTTPMethod = @"PATCH";
    request.HTTPBody = [NSJSONSerialization dataWithJSONObject:answerDictionary options:0 error:nil];
    [NSURLConnection sendSynchronousRequest: request returningResponse: nil error: nil];
}
- (void)putAnswer:(NSDictionary *)answerDictionary {
    
    NSURL *answersByQuestionURL = [NSURL URLWithString:@"https://get2knowurnewbesties.firebaseio.com/answersByQuestion.json"];
    
    NSMutableURLRequest *request1 = [NSMutableURLRequest requestWithURL:answersByQuestionURL];
    request1.HTTPMethod = @"PUT";
    request1.HTTPBody = [NSJSONSerialization dataWithJSONObject:answerDictionary options:0 error:nil];
    [NSURLConnection sendSynchronousRequest: request1 returningResponse: nil error: nil];
    
    NSMutableDictionary *userBasedAnswersDictionary = [[NSMutableDictionary alloc] init];
    for (id key1 in answerDictionary) {
        for (id key2 in answerDictionary[key1])
             userBasedAnswersDictionary[key2] = @{answerDictionary[key1][key2]:key1};
        NSLog(@"%@",userBasedAnswersDictionary);
    }
    
    NSURL *answersByUserURL = [NSURL URLWithString:@"https://get2knowurnewbesties.firebaseio.com/answersByUser.json"];
    NSMutableURLRequest *request2 = [NSMutableURLRequest requestWithURL:answersByUserURL];
    request2.HTTPMethod = @"PUT";
    request2.HTTPBody = [NSJSONSerialization dataWithJSONObject:userBasedAnswersDictionary options:0 error:nil];
    [NSURLConnection sendSynchronousRequest: request2 returningResponse: nil error: nil];

}

- (NSDictionary *)getAllAnswersForQuestion:(NSString *)questionID {
    
    NSString *queryString = [NSString stringWithFormat:@"https://get2knowurnewbesties.firebaseio.com/answersByQuestion.json?equalTo=\"%@\"&orderBy=\"$key\"",questionID];
    NSData *returnData = [NSData dataWithContentsOfURL:[NSURL URLWithString:queryString]];
    NSDictionary *returnDictionary = [NSJSONSerialization JSONObjectWithData:returnData options:0 error:nil];
    
    return returnDictionary;
}

- (NSDictionary *)getAllAnswersForUser:(NSString *)username {
    NSString *queryString = [NSString stringWithFormat:@"https://get2knowurnewbesties.firebaseio.com/answersByUser.json?equalTo=\"%@\"&orderBy=\"$key\"",username];
    
    NSData *returnData = [NSData dataWithContentsOfURL:[NSURL URLWithString:queryString]];
    
    NSDictionary *returnDictionary = [NSJSONSerialization JSONObjectWithData:returnData options:0 error:nil];
    
    return returnDictionary;
}


@end
