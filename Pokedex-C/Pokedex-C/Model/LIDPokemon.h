//
//  LIDPokemon.h
//  Pokedex-C
//
//  Created by Leonardo Diaz on 5/5/20.
//  Copyright © 2020 Karl Pfister. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LIDPokemon : NSObject

// let name: String
@property (nonatomic, readonly, copy) NSString *name;
@property (nonatomic, readonly)NSInteger identifier;
// let abilities: [String]
@property (nonatomic, readonly, copy)NSArray<NSString *> *abilities;
@property (nonatomic, readonly, copy)NSString *spritePath;
//1 2           3                    4        5  6     7          8         9         10          11       12    13 14 15         16        17       18  19      20
- (instancetype)initWithPokemonName:(NSString *)name identifier:(NSInteger)indetifier abilities:(NSArray<NSString *>*)abilites spritePath: (NSString *)spritePath;
// init(name: String, abilities:[String],  ) -> LIDPokemon
@end

#pragma mark - JSON Dictionary --Manual Codable
@interface LIDPokemon (JSONConvertable)
- (instancetype)initWithDictionary:(NSDictionary <NSString *, id>*)topLevelDictionary;
// init(dictionary: Dictionary(String, Any)) -> LIDPokemon
@end


NS_ASSUME_NONNULL_END
