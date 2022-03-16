//
//  GraphicsInteractor.swift
//  Registro
//
//  Created Branchbit on 13/03/22.
//  2022 ___ORGANIZATIONNAME___.
//

import Foundation

class GraphicsInteractor{
    var presenter: GraphicsPresenterProtocol?
}

extension GraphicsInteractor: GraphicsInteractorProtocol {
    func getGraphics(){
        getGraphic { responseInfo, responseCode, responseError in
            guard let response = responseInfo?.questions else {
                guard let error = responseError else {
                    print("casi ultimo error ")
                    return
                }
                print("Ultimno errrors")
                return
            }
           self.presenter?.responseGraphics(response: response)
        }
    }
    
    func getData(){
        getGraphic { responseInfo, responseCode, responseError in
            guard let response = responseInfo?.questions else {
                guard let error = responseError else {
                    print("casi ultimo error ")
                    return
                }
                print("Ultimno errrors")
                return
            }
//            self.presenter?.responseData(response: response.)
        }
    }
    
    func getGraphic(completionHandler:@escaping(listResponse?,Int?,Error?)->Void){
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

