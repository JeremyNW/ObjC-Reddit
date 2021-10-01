//
//  Post.h
//  ObjCReddit
//
//  Created by Jeremy Warren on 10/1/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Post : NSObject

@property NSString *title;
@property NSString *subreddit;
@property NSInteger upvotes;
@property NSInteger comments;

- (instancetype) initWithTitle:(NSString *)title
                       upvotes:(NSInteger)upvotes
                      comments:(NSInteger)comments
                      subreddit:(NSString *)subreddit;

@end

NS_ASSUME_NONNULL_END
