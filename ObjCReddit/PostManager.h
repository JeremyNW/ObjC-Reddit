//
//  PostManager.h
//  ObjCReddit
//
//  Created by Jeremy Warren on 10/1/21.
//

#import <Foundation/Foundation.h>
#import "Post.h"

NS_ASSUME_NONNULL_BEGIN

@interface PostManager : NSObject

+ (void) fetchSubredditWithName:(NSString *)subredditName completion:(void (^)(NSArray<Post *> *posts))completion;

@end

NS_ASSUME_NONNULL_END
