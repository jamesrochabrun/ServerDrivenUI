//
//  View+Extensions.swift
//  ServerSideDrivenSwiftUI
//
//  Created by James Rochabrun on 7/29/20.
//

import Foundation
import SwiftUI

/// Returns a view as a content or self if the condition is false.

extension View {
    
    func ifConditional<Content: View>(_ conditional: Bool,
                                      content: (Self) -> Content) -> some View {
        
        guard conditional else { return AnyView(self) }
        return AnyView(content(self))
    }
}
