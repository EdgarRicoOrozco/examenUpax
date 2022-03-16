//
//  DataDecoder.swift
//  Registro
//
//  Created by Branchbit on 14/03/22.
//

import Foundation
final class DateDecoder: JSONDecoder{
    let dateFormatter = DateFormatter()
    override init(){
        super.init()

    }
}
