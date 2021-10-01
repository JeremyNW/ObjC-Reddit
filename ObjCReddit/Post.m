//
//  Post.m
//  ObjCReddit
//
//  Created by Jeremy Warren on 10/1/21.
//

#import "Post.h"

@implementation Post

- (instancetype)initWithTitle:(NSString *)title upvotes:(NSInteger)upvotes comments:(NSInteger)comments subreddit:(NSString *)subreddit {
    self = [super init];
    
    if (self) {
        _title = title;
        _subreddit = subreddit;
        _upvotes = upvotes;
        _comments = comments;
        
    }
    
    return self;
}

@end
