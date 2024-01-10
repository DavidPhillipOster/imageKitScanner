//  LoggingProxy.m
//  imageKitScanner
//
//  Created by david on 1/9/24.
//

#import "LoggingProxy.h"

@implementation LoggingProxy {
  id _obj;
}

- (instancetype)initWith:(id)obj {
  _obj = obj;
  return self;
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel {
  return [_obj methodSignatureForSelector:sel];
}

- (void)forwardInvocation:(NSInvocation *)call {
  [call setTarget:_obj];
  [call invoke];
  // set breakpoint here.
}

+ (BOOL)respondsToSelector:(SEL)sel {
  return [super respondsToSelector:sel];
}


@end

id LogProxy(id obj) {
#if DEBUGLOG
  return [[LoggingProxy alloc] initWith:obj];
#else
  return obj;
#endif
}
