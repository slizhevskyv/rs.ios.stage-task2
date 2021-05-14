#import "ReverseBinary.h"

UInt8 ReverseInteger(UInt8 n) {
    int result = 0;

    NSMutableString *binaryRepresentation = [NSMutableString new];
    
    while(binaryRepresentation.length != 8) {
        NSString *stringToInsert = n > 0
            ? [NSString stringWithFormat:@"%d", n % 2]
            : @"0";
        [binaryRepresentation insertString:stringToInsert atIndex:0];
        n = n / 2;
    }
    
    for (NSInteger i = 0; i < binaryRepresentation.length; i++) {
        int n = [binaryRepresentation characterAtIndex:i] - '0';
        result = result + n * pow(2, i);
    }
    
    return result;
}
