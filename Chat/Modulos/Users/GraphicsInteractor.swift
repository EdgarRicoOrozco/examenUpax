//
//  GraphicsInteractor.swift
//  Registro
//
//  Created Branchbit on 13/03/22.
//  2022 ___ORGANIZATIONNAME___.
//

import Foundation
import Alamofire

class GraphicsInteractor{
    var presenter: GraphicsPresenterProtocol?
    private let urlBase = "https://us-central1-bibliotecadecontenido.cloudfunctions.net/helloWorld"
    private let statusOk = 200...299
}

extension GraphicsInteractor: GraphicsInteractorProtocol {
    func getGraphics(){
        nombre1Movies { responseInfo, responseCode, responseError in
            guard let response = responseInfo?.questions else {
                guard let error = responseError else {
                    print("casi ultimo error ")
                    return
                }
                print("Ultimno errrors")
                return
            }
            print(response)
           self.presenter?.responseGraphics(response: response)
        }
    }
    
    func nombre1Movies(completionHandler:@escaping(listResponse?,Int?,Error?)->Void){
        let urlString = "https://us-central1-bibliotecadecontenido.cloudfunctions.net/helloWorld"
        if let urlObject = URL(string: urlString){
            var urlRequest = URLRequest(url: urlObject)
            urlRequest.httpMethod = "GET"

            let task = URLSession.shared.dataTask(with: urlRequest) { responseData, responseCode, responseError in
                if let auxResponse = responseCode as? HTTPURLResponse {
                    let auxResponseCode = auxResponse.statusCode
                }
                guard let respuestaDiferente = responseData else {
                    completionHandler(nil, responseCode.hashValue, responseError)
                    return
                }

                if let json = try? JSONDecoder().decode(listResponse.self, from: respuestaDiferente){
                    completionHandler(json,200,nil)
                }
            }
            task.resume()
        }
    }
}

