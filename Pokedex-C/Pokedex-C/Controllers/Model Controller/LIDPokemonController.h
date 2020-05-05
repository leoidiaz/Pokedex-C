//
//  LIDPokemonController.h
//  Pokedex-C
//
//  Created by Leonardo Diaz on 5/5/20.
//  Copyright © 2020 Karl Pfister. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LIDPokemon.h"
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LIDPokemonController : NSObject
//1 2  3                              4      5  6           7         8     9   10       11  12        13
+(void)fetchPokemonWithSearchTerm: (NSString *)searchTerm completion:(void (^)(LIDPokemon * pokemon))completion;
+(void)fetchImageForPokemon: (LIDPokemon *)pokemon completion: (void (^)(UIImage * image))completion;

@end

NS_ASSUME_NONNULL_END
