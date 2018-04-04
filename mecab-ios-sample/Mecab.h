//
//  Mecab.h
//
//  Created by Watanabe Toshinori on 10/12/22.
//  Copyright 2010 FLCL.jp. All rights reserved.
//

#include <mecab.h>
#import <UIKit/UIKit.h>


@interface Mecab : NSObject {
	mecab_t *mecab;
}

- (NSArray *)parseToNodeWithString:(NSString *)string;

@end
