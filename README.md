
## DEPRECATED 8/18/15

# Deploy on Day One - Advanced

So you've built a working interviewing tool. Let's take it a big step further.


## Instructions

Connect your project to our actual `get2knowurnewbesties` database.

* After linking up to our server, you will want to log what you get back in order to see the format of the dictionaries.
* Create methods that reformat them into something more useful for your current program.
* Consider other updates to your command-line code to make the best use of the API methods provided to you.

## Hints
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

You can then call the `FirebaseAPI` methods to get access to data on our servers. You do NOT need to understand how they work right now, but it should be somewhat self-explanatory as to what the methods do based on their names in the `FirebaseAPI.h`. You should only be calling the methods listed in `FirebaseAPI.h`.


<p data-visibility='hidden'>View <a href='https://learn.co/lessons/ios-deployOnDayOne-Advanced' title='DEPRECATED 8/18/15'>DEPRECATED 8/18/15</a> on Learn.co and start learning to code for free.</p>
