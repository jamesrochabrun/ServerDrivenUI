//
//  ImageCover.swift
//  ServerSideDrivenSwiftUI
//
//  Created by James Rochabrun on 7/30/20.
//

import Foundation
import SwiftUI

struct ImageCover: DecodableView {
    
//    var id: UUID? = UUID()
    
    /// frame can be passes one level up
    let url: String
    let type: UIType
    
    var body: some View {
        Image(systemName: "pause.rectangle.fill")
            .resizable()
            .frame(width: 40.0, height: 40.0)
    }
}
