# Deploy on Day One

Welcome to Flatiron! As you've just heard, we want to make sure you know that [imposter syndrome](http://en.wikipedia.org/wiki/Impostor_syndrome) is just a phase. And today we're going to get over our initial [imposter syndrome](http://en.wikipedia.org/wiki/Impostor_syndrome) and jump right in.

Your mission, the one you've already chosen to accept by being here today, is as follows:

Develop an application that runs in our nifty debugger window. No fancy iPhone / iPad interfaces today! We're back in the 80's with a simple text-based application. This application is meant to help you get to know your fellow students better. And here's what it has to be able to do:

1) `login` a student by name as the `currentUser` (or sign them up if they don't already exist in our list (`NSArray`) of students who have registered to use the app.) In other words, ask for their name so you know who is currently using the app. You'll use their name to associate answers to interview questions with a specific person. (Make sure you have a `logout` method as well!) Hint on how to do this: Consider just storing the `currentUser` as a property.

2) Provide a `menu` of options (via `NSLog`) to your user that lets them choose what they want the app to do. From the `menu` the user can be interviewed with general questions or questions specific to a `category` (e.g. sports, programming, travel, art, etc.), add to the `NSArray` of questions, and read interviews of other students. As in traditional text-based applications, you'll probably want them to just specify the number of the option in which they are interested (think automated phone system).

3) When reading interviews of other students, the user should be able to choose which student's `interview` they want to read, and which `question` they would like to see the `answer` to from the chosen `user` (student).

4) When adding questions to the existing `NSMutableArray` of questions, the user should be asked to specify the `category` in which the `question` fits, and they should see the existing list of questions in that `category` so they might avoid duplicating questions.

5) Make sure to add the ability to add new categories in case a `question` they want to ask doesn't fit into the existing ones!

6) When answering a `question`, make sure the `currentUser` does not get asked a `question` they already answered.

7) If you finish early, think of other ways to make your user experience better!


Some important hints:

* You'll want to write all of your code in the `MyApp.m` file.
* Make sure to take advantage of the method we have written for you in order to get access to the keyboard inputs in the debugger window. These are `requestKeyboardInput`. Don't worry about how they work. Just know you get back the input from the user which you can store in a variable.
* Use NSLog to "talk" to your user in the debugger.
* For formatting, you can use `\r` in your strings to add line breaks and not have to write multiple `NSLog` statements if you don't want to. But multiple `NSLog` statements will work too!



###Advanced version!

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

