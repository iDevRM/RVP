//
//  Extensions.swift
//  Reddit Feed
//
//  Created by Rick Martinez on 9/9/21.
//

import Foundation
import SwiftUI

extension String {
    func toImage() -> UIImage {
        do {
            guard let url = URL(string: self) else { return UIImage() }
            let data = try Data(contentsOf: url)
            return UIImage(data: data) ?? UIImage()
        } catch {
            debugPrint(error.localizedDescription)
        }
        return UIImage()
    }
}
