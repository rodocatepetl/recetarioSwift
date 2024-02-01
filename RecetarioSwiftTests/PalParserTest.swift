//
//  PalParserTest.swift
//  RecetarioSwiftTests
//
//  Created by Rodolfo Castillo on 01/02/24.
//

import XCTest
@testable import RecetarioSwift

class PaldexParserTests: XCTestCase {
    
    func testDecode() {
        // Preparación
        let parser = PaldexParser.shared
        let expectation = self.expectation(description: "DecodeCompletionExpectation")
        
        // Ejecución
        parser.decode {
            // Validación
            XCTAssertNotNil(parser.dex, "La propiedad 'dex' debería tener un valor después de decodificar.")
            
            // Aquí podrías agregar más validaciones, como verificar el contenido específico de `dex`
            // para asegurarte de que coincida con lo que esperas del archivo JSON de prueba.
            
            expectation.fulfill()
        }
        
        // Espera que se cumpla la expectativa antes de finalizar la prueba.
        // Ajusta el tiempo de espera según sea necesario, pero ten en cuenta que no debe ser demasiado largo.
        waitForExpectations(timeout: 5, handler: nil)
    }
}
