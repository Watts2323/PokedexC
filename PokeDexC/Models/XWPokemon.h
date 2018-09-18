//
//  Pokemon.h
//  PokeDexC
//
//  Created by Xavier on 9/18/18.
//  Copyright © 2018 Xavier ios dev. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface XWPokemon : NSObject

@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, readonly) NSInteger identifier;
@property (nonatomic, copy, readonly) NSArray<NSString *> *abilities;

-(instancetype)initWithName:(NSString *)name identifier:(NSUInteger *)indentifier abilities:(NSArray<NSString *> *)abilities;

@end

@interface XWPokemon (JSONConvertible)

-(instancetype)initWithDictionary:(NSDictionary<NSString *, id> *)dictionary;

@end
NS_ASSUME_NONNULL_END
