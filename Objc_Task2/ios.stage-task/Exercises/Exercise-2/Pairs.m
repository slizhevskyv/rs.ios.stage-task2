#import "Pairs.h"

@implementation Pairs

- (NSInteger)countPairs:(NSArray <NSNumber *> *)array number:(NSNumber *)number {
    NSInteger arrCount = array.count;
    NSInteger count = 0;
    
    for (int i = 0; i < arrCount; i++) {
        for (int j = i + 1; j < arrCount; j++) {
            if ([array[j] intValue] - [array[i] intValue] == [number intValue]) {
                count++;
            }
        }
    }
    
    return count;
}

@end
