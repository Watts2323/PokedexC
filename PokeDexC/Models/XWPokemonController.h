//
//  XWPokemonController.h
//  PokeDexC
//
//  Created by Xavier on 9/18/18.
//  Copyright © 2018 Xavier ios dev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XWPokemon.h"

@interface XWPokemonController : NSObject

NS_ASSUME_NONNULL_BEGIN 

+ (void)fetchPokemonForSearchTerm:(NSString *)searchTerm completion:(void (^ _Nullable) (XWPokemon * _Nullable))completion;


NS_ASSUME_NONNULL_END
@end


