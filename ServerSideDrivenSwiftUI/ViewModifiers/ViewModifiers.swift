//
//  ViewModifiers.swift
//  ServerSideDrivenSwiftUI
//
//  Created by James Rochabrun on 7/30/20.
//

import Foundation
import SwiftUI


struct ShadowModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 12)
            .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
    }
}
