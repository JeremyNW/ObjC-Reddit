//
//  PostManager.m
//  ObjCReddit
//
//  Created by Jeremy Warren on 10/1/21.
//

#import "PostManager.h"

@implementation PostManager
+ (void)fetchSubredditWithName:(NSString *)subredditName completion:(void (^)(NSArray<Post *> *))completion {
    NSURL *baseURL = [NSURL URLWithString:@"https://www.reddit.com/r/"];
    NSURL *searchURL = [baseURL URLByAppendingPathComponent:subredditName];
    NSURL *finalURL = [searchURL URLByAppendingPathExtension:@"json"];
    NSLog(@"%@", finalURL);
    
    [[NSURLSession.sharedSession dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                
        if (error) {
            NSLog(@"%@", error.localizedDescription);
            completion(@[]);
            return;
        }
        
        if (!data) {
            completion(@[]);
            return;
        }
        NSMutableArray *decodedPosts = [[NSMutableArray alloc] init];
        
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        NSDictionary *daba = json[@"data"];
        NSArray *children = daba[@"children"];
        
        for (NSDictionary *child in children) {
            NSDictionary *childData = child[@"data"];
            NSString *title = childData[@"title"];
            NSString *subreddit = childData[@"subreddit"];
            NSInteger comments = [childData[@"num_comments"] integerValue];
            NSInteger upvotes = [childData[@"ups"] integerValue];
            
            Post *post = [[Post alloc] initWithTitle:title upvotes:upvotes comments:comments subreddit:subreddit];
            [decodedPosts addObject:post];
        }
        
        completion(decodedPosts);
        
    }] resume];
    
    
}

@end
