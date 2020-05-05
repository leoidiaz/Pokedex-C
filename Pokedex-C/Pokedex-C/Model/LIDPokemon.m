//
//  LIDPokemon.m
//  Pokedex-C
//
//  Created by Leonardo Diaz on 5/5/20.
//  Copyright © 2020 Karl Pfister. All rights reserved.
//

#import "LIDPokemon.h"

@implementation LIDPokemon
#pragma mark - Class Init
- (instancetype)initWithPokemonName:(NSString *)name identifier:(NSInteger)indetifier abilities:(NSArray<NSString *> *)abilites spritePath:(NSString *)spritePath
{
    // Create super class before we create subclass
    self = [super init];
    if (self){
        _name = name;
        _identifier = indetifier;
        _abilities = abilites;
        _spritePath = spritePath;
    }
    return self;
}


@end

#pragma mark - Dictionary Init
@implementation LIDPokemon
- (instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)dictionary
{
    
}

@end
