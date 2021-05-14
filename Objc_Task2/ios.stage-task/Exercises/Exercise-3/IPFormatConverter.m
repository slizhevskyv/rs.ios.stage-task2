#import "IPFormatConverter.h"

@implementation IPFormatConverter

- (NSString *)ipFormatConverter:(NSArray *)numbersArray {
    NSMutableString *result = [NSMutableString new];
    
    if (!numbersArray || numbersArray.count == 0) {
        return result;
    }
    
    for (NSInteger i = 0; i < 4; i++) {
        NSNumber *arrNum = i < numbersArray.count
            ? numbersArray[i]
            : @0;
        
        if ([arrNum intValue] > UINT8_MAX) {
            return @"The numbers in the input array can be in the range from 0 to 255.";
        } else if ([arrNum intValue] < 0) {
            return @"Negative numbers are not valid for input.";
        }
        
        [result appendFormat:result.length ? @".%d" : @"%d", [arrNum intValue]];
    }

    return result;
}

@end
