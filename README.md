---
tags: firstDay
language: objc
---

# Deploy on Day One - Advanced

## Instructions

So you've built a working interviewing tool. Let's take it a big step further.

Connect your project to our actual `get2knowurnewbesties` database.

* To link up to our server, you will need to follow some conventions:

You dictionary of interview data must contain the following keys:
* intervieweeName (NSString)
* questionNumber (NSNumber)
* answer (NSString)

Your dictionary of questions must contain the following keys:
* questionNumber (NSNumber)
* question (NSString)
* questionCategory (NSString)

Also, you will need to instantiate a copy of our `FirebaseAPI` class in your `MyApp.m`. Consider adding it as a property, and then instantiating it right at the top of your `execute` method, i.e.

```
#import "MyApp.h"
#import "FirebaseAPI.h"

@interface MyApp()

@property (strong, nonatomic, readwrite) NSString *currentUser;
@property (strong, nonatomic) FirebaseAPI *firebaseAPI;

@end

-(void)execute {
    
    self.firebaseAPI = [[FirebaseAPI alloc] init];

    ...

}
```

You can then call the `FirebaseAPI` methods to get access to data on our servers. You do NOT need to understand how they work right now, but it should be somewhat self-explanatory as to what the methods do based on their names in the `FirebaseAPI.h`. You should only be touching the methods listed in `FirebaseAPI.h`.

