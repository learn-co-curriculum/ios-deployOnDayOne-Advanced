//
//  FirebaseAPI.h
//  deployOnDayOne
//
//  Created by Zachary Drossman on 1/29/15.
//  Copyright (c) 2015 Zachary Drossman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FirebaseAPI : NSObject

@property (strong, nonatomic) NSString *currentUser;

- (NSDictionary *)getUsers;
- (void)createNewUser;
- (void)loginExistingUser;

- (NSDictionary *)getQuestions;
- (void)createNewInterviewQuestion:(NSString *)question inCategory:(NSString *)category;

- (NSDictionary *)getCategories;
- (void)createNewInterviewQuestionCategory:(NSString *)category;

- (NSDictionary *)getAllAnswersForQuestion:(NSString *)questionID;
- (NSDictionary *)getAllAnswersForUser:(NSString *)username;
- (void)createAnswer:(NSString *)answer forInterviewQuestion:(NSString *)questionID;



@end
