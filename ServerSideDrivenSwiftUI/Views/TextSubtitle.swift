//
//  TextSubtitle.swift
//  ServerSideDrivenSwiftUI
//
//  Created by James Rochabrun on 7/30/20.
//

import Foundation
import SwiftUI

struct TextSubtitle: DecodableView {

//    var id: UUID? = UUID()
    let title: String
    let subTitle: String
    let type: UIType
    
    var body: some View {
        VStack {
            Text(title)
            Text(subTitle)
        }
    }
}
