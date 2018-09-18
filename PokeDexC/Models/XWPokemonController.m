//
//  XWPokemonController.m
//  PokeDexC
//
//  Created by Xavier on 9/18/18.
//  Copyright © 2018 Xavier ios dev. All rights reserved.
//

#import "XWPokemonController.h"
#import "XWPokemon.h"

static NSString * const baseURLString = @"https://pokeapi.co/api/v2";

@implementation XWPokemonController

+ (void)fetchPokemonForSearchTerm:(NSString *)searchTerm completion:(void (^ _Nullable) (XWPokemon * _Nullable))completion{
    
    //1) construct the Url
    NSURL *baseUrl = [[NSURL alloc] initWithString:baseURLString];
    NSURL *searchUrl = [[baseUrl URLByAppendingPathComponent:@"pokemon"] URLByAppendingPathComponent:[searchTerm lowercaseString]];
    
    NSLog(@"%@", [searchUrl absoluteString]);
    
    // 2) DataTask, serialize the Data, complete & resume
    [[[NSURLSession sharedSession] dataTaskWithURL:searchUrl completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error){
            NSLog(@"There was an error in %s: %@, %@", __PRETTY_FUNCTION__, error, error.localizedDescription);
            completion(nil);
            return;
        }
        NSLog(@"%@", response);
        
        if(!data){
            NSLog(@"No DATA AVAILABLE");
            completion(nil);
            return;
        }
        
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error: &error];
        if (!jsonDictionary || ![jsonDictionary isKindOfClass:[NSDictionary class]]){
            NSLog(@"Error parsing the json: %@", error);
            completion(nil);
            return;
        }
        XWPokemon *pokemon = [[XWPokemon alloc] initWithDictionary:jsonDictionary];
        completion(pokemon);
    }] resume];
    
}

@end
