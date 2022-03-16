//
//  GraphicsEntity.swift
//  Registro
//
//  Created Branchbit on 13/03/22.
//  2022 ___ORGANIZATIONNAME___.
//

import UIKit
import Foundation

struct listResponse: Codable {
    var colors: [String]?
    var questions: [__Questions]?
    
    enum CodingKeys: String, CodingKey {
        case colors = "colors"
        case questions = "questions"
        }
    struct __Questions: Codable{
        var total: Int?
        var text: String?
        var chartData: [__ChartData]?

        enum CodingKeys: String, CodingKey{
            case total = "total"
            case text = "text"
            case chartData = "chartData"
        }
        struct __ChartData: Codable{
            var text: String?
            var percetnage: Int?

            enum CodingKeys: String, CodingKey{
                case text = "text"
                case percetnage = "percetnage"
            }
        }
    }
}

struct ChartData {
    var text: String?
    var percetnage: Int?
}


struct Questions {
    var total: Int?
    var text: String?
   
}

