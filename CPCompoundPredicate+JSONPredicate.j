@implementation CPCompoundPredicate (JSONPredicate)

- (CPDictionary)toPredicateLiterals
{
    var result = [[CPMutableArray alloc] init],
        count = [_predicates count],
        type;

    if (count == 0)
        return @{@"type":@"TRUEPREDICATE"};

    switch (_type)
    {
        case CPNotPredicateType:    type = @"NOT";
        							[result addObject:[[_predicates objectAtIndex:0] toPredicateLiterals]];
                                    break;

        case CPAndPredicateType:    type = @"AND";
                                    for (var j = 0; j < count; j++)
                                        [result addObject:[[_predicates objectAtIndex:j] toPredicateLiterals]];
                                    break;

        case CPOrPredicateType:     type = @"OR";
                                    for (var j = 0; j < count; j++)
                                        [result addObject:[[_predicates objectAtIndex:j] toPredicateLiterals]];
                                    break;
    }

    return @{@"type":@"compound", @"operator":type, @"subpredicates":result};
}

@end
