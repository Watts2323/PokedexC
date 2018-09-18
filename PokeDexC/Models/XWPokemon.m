//
//  Pokemon.m
//  PokeDexC
//
//  Created by Xavier on 9/18/18.
//  Copyright © 2018 Xavier ios dev. All rights reserved.
//

#import "XWPokemon.h"

@implementation XWPokemon

-(instancetype)initWithName:(NSString *)name identifier:(NSUInteger *)indentifier abilities:(NSArray<NSString *> *)abilities{
    
    self = [super init];
    if (self) {
        _name = name;
        _identifier = indentifier;
        _abilities = abilities;
    }
    return self;
}

@end


@implementation XWPokemon (JSONConvertible)

-(instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)dictionary{
    
    NSInteger identifier = [dictionary[@"id"] integerValue];
    NSString *name = dictionary[@"name"];
    NSArray *abilitiesDictionaries = dictionary[@"abilities"];
    
    if(![name isKindOfClass:[NSString class]] || ![abilitiesDictionaries isKindOfClass:[NSArray class]]){
        return nil;
    }
    
    NSMutableArray<NSString *> *abilities = [[NSMutableArray alloc] init];
    
    for (NSDictionary *dictionary in abilitiesDictionaries){
        NSDictionary *nameDictionary = dictionary[@"ability"];
        NSString *abilityName = nameDictionary[@"name"];
        [abilities addObject:abilityName];
        
    }
    
    return [self initWithName:name identifier:identifier abilities:abilities];
}

@end
















