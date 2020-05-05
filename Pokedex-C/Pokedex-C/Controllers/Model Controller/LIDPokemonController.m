//
//  LIDPokemonController.m
//  Pokedex-C
//
//  Created by Leonardo Diaz on 5/5/20.
//  Copyright © 2020 Karl Pfister. All rights reserved.
//

#import "LIDPokemonController.h"
#import "LIDPokemon.h"

static NSString *const baseURLString = @"https://pokeapi.co/api/v2/pokemon";

@implementation LIDPokemonController

+ (void)fetchPokemonWithSearchTerm:(NSString *)searchTerm completion:(void (^)(LIDPokemon * _Nullable pokemon))completion
{
    // URL
    NSURL *baseURL = [NSURL URLWithString: baseURLString];
    
    // Lowercase the searchTerm just in case
    NSURL *finalURL = [baseURL URLByAppendingPathComponent: [searchTerm lowercaseString]];
    
    NSLog(@"%@", finalURL);
    // Session
    [[[NSURLSession sharedSession] dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error)
      {
        // Error
        if (error) {
            NSLog(@"There was an error in %s: %@, %@", __PRETTY_FUNCTION__, error, [error localizedDescription]);
            completion(nil);
            return;
        }
        // Response
        if (response) {
            NSLog(@"%@", response);
        }
        // Data
        if(data){
            NSDictionary *topLevelDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
            
            if (!topLevelDictionary)
            {
                NSLog(@"Error parsing the JSON: %@", error);
                completion(nil);
                return;
            }
            
            LIDPokemon *pokemon = [[LIDPokemon alloc] initWithDictionary:topLevelDictionary];
            completion(pokemon);
        }
        
    }] resume];
}

+ (void)fetchImageForPokemon:(LIDPokemon *)pokemon completion:(void (^)(UIImage * _Nullable image))completion
{
    // URL
    NSURL *imageURL = [NSURL URLWithString:pokemon.spritePath];
    NSLog(@"%@", imageURL);
    
    // Datatask
    [[[NSURLSession sharedSession] dataTaskWithURL:(imageURL) completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        // Check error
        if (error){
            NSLog(@"There was an error in %s: %@, %@", __PRETTY_FUNCTION__, error, [error localizedDescription]);
            completion(nil);
            return;
        }
        // Check data
        if (!data) {
            NSLog(@"Error parsing the JSON: %@", error);
            completion(nil);
            return;
        }
        // Now we have data
        UIImage *poster = [[UIImage alloc] initWithData:data];
        completion(poster);        
    }] resume];
}


@end
