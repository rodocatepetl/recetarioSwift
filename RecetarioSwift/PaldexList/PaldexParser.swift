//
//  PaldexParser.swift
//  RecetarioSwift
//
//  Created by Rodolfo Castillo on 01/02/24.
//

import Foundation

class PaldexParser {
    
    static var shared: PaldexParser = PaldexParser()
    public var dex: PalsData?
    
    init(dex: PalsData? = nil) {
        self.dex = dex
    }
    
    init(decodingPals: Bool) {
        if decodingPals {
            self.decode {}
        }
    }
    
    // Define un typealias para el callback que no devuelve nada y no acepta parámetros
    typealias DecodeCompletion = () -> Void
    
    // Modifica la función `decode` para aceptar un callback de tipo `DecodeCompletion`
    public func decode(completion: @escaping DecodeCompletion) {
        let decoder = JSONDecoder()
        // Simulación de la carga de datos, reemplaza con tu objeto Data real
        DispatchQueue.global(qos: .background).async {
            guard let jsonData = try? Data(contentsOf: Bundle.main.url(forResource: "corrected_sorted_pals", withExtension: "json")!) else {
                DispatchQueue.main.async {
                    completion() // Llama al callback incluso si falla para manejar errores
                }
                return
            }
            let palsData = try? decoder.decode(PalsData.self, from: jsonData)
            
            DispatchQueue.main.async {
                self.dex = palsData
                completion() // Llama al callback después de asignar `dex`
            }
        }
    }
}
