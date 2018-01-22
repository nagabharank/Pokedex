//
//  Pokemon.swift
//  Pokedex
//
//  Created by NagaBharan Kothrui on 1/19/18.
//  Copyright © 2018 Bharan Kothrui. All rights reserved.
//

import Foundation
import  Alamofire

class Pokemon {
    private var _name: String!
    private var _pokedexId: Int!
    private var _mainImg: String!
    private var _descrition: String!
    private var _type: String!
    private var _defence: String!
    private var _height: String!
    private var _weight: String!
    private var _baseAttack: String!
    private var _nextEvoTxt: String!
    private var _pokemonURL: String!
    
    
    
    var name: String {
        return _name
    }
    
    var pokedexId: Int {
        return _pokedexId
    }
    
    init(name: String, PokedexId: Int) {
        
        self._name = name
        self._pokedexId = PokedexId
        
        self._pokemonURL = "\(URL_BASE)\(URL_POKEMON)\(self.pokedexId)/"
    }
    
    func downloadPokemonDetails(completed: DownloadComplete) {
        
        Alamofire.request(_pokemonURL).responseString { (response) in
            
            if let dict = response.result.value as? Dictionary<String, AnyObject> {
                
                if let weight = dict["weight"] as? String {
                    self._weight = weight
                }
                
                if let heigh = dict["height"] as? String {
                    self._height = heigh
                }
                
                if let baseattack = dict["base_experience"] as? String {
                    self._baseAttack = baseattack
                }
                
                if let stats = dict["stats"] as? [Dictionary<String, AnyObject>] {
                    if let defence = stats[0]["base_stat"] as? String {
                        self._defence = defence
                    }
                }
                
                print(self._weight)
                print(self._height)
                print(self._baseAttack)
                print(self._defence)
            }
                
        }
    }
}
