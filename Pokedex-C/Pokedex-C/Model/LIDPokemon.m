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
@implementation LIDPokemon (JSONConvertable)
- (instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)topLevelDictionary
{
    // let name = tld["name"]th an expression of type 'i
    NSString *name = topLevelDictionary[@"name"];
    //let id = tld["id"] as? Int ***
    NSInteger identifier = [topLevelDictionary[@"id"] integerValue];
    
    NSArray *abilitiesArrayOfDictionary = topLevelDictionary[@"abilities"];
    
    // let abilities: [String] = [] -- create empty array of type string
    NSMutableArray<NSString *> *abilities = [[NSMutableArray alloc] init];
    
    // Null check
    if ([name isKindOfClass:[NSNull class]] || ![abilitiesArrayOfDictionary isKindOfClass:[NSArray class]]){return nil;}
    
    for (NSDictionary *dictionary in abilitiesArrayOfDictionary)
    {
        NSDictionary *abilityDictionary = dictionary[@"ability"];
        NSString *name = abilityDictionary[@"name"];
        [abilities addObject:name];
    }
    
    NSDictionary *spriteDictionary = topLevelDictionary[@"sprites"];
    NSString *spritePath = spriteDictionary[@"front_default"];
        
    return [self initWithPokemonName:name identifier:identifier abilities:abilities spritePath:spritePath];
}

@end
