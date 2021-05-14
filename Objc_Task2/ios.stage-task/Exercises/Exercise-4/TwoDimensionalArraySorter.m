#import "TwoDimensionalArraySorter.h"

@implementation TwoDimensionalArraySorter

- (NSArray *)twoDimensionalSort:(NSArray<NSArray *> *)array {
    if (!array || ![array[0] isKindOfClass:[NSArray class]]) {
        return @[];
    }
    
    NSMutableArray *numberArr = [NSMutableArray new];
    NSMutableArray *stringArr = [NSMutableArray new];
    
    for (int i = 0; i < array.count; i++) {
        for (int j = 0; j < array[i].count; j++) {
            id innerArrElement = array[i][j];
            BOOL isNumber = [innerArrElement isKindOfClass:[NSNumber class]];
            
            [(isNumber ? numberArr : stringArr) addObject:innerArrElement];
        }
        
    }
    
    NSComparisonResult (^ascSort)(id, id) = ^NSComparisonResult (id o1, id o2) {
        return [o1 compare:o2];
    };
    NSComparisonResult (^descSort)(id, id) = ^NSComparisonResult (id o1, id o2) {
        return [o2 compare:o1];
    };
    
    
    if (!numberArr.count) {
        [stringArr sortUsingComparator: ascSort];
        
        return stringArr;
    } else if (!stringArr.count) {
        [numberArr sortUsingComparator: ascSort];
        
        return numberArr;
    } else {
        [stringArr sortUsingComparator: descSort];
        
        [numberArr sortUsingComparator: ascSort];
        
        return @[numberArr, stringArr];
    }
}

@end
