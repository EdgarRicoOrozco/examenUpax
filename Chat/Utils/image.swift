//
//  image.swift
//  Registro
//
//  Created by Branchbit on 14/03/22.
//

import UIKit

public extension UIImage {
    
    func toBase64String() -> String {
        return jpegData(compressionQuality: 0.5)?.base64EncodedString() ?? ""
    }
    
    func resized(toWidth width: CGFloat) -> UIImage? {
        let canvasSize = CGSize(width: width, height: CGFloat(ceil(width/size.width * size.height)))
        UIGraphicsBeginImageContextWithOptions(canvasSize, false, scale)
        defer { UIGraphicsEndImageContext() }
        draw(in: CGRect(origin: .zero, size: canvasSize))
        return UIGraphicsGetImageFromCurrentImageContext()
    }
    
    func resizedTo1MB() -> UIImage? {
        guard let imageData = self.pngData() else { return nil }
        let megaByte = 1000.0

        var resizingImage = self
        var imageSizeKB = Double(imageData.count) / megaByte

        while imageSizeKB > megaByte {
            guard let resizedImage = resizingImage.resized(toWidth: 0.5),
            let imageData = resizedImage.pngData() else { return nil }

            resizingImage = resizedImage
            imageSizeKB = Double(imageData.count) / megaByte
        }

        return resizingImage
    }
}
