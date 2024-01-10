//  LoggingProxy.h
//  imageKitScanner
//
//  Created by david on 1/9/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LoggingProxy : NSProxy

@end

id LogProxy(id obj);

NS_ASSUME_NONNULL_END
