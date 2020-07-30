//
//  Protocols.swift
//  ServerSideDrivenSwiftUI
//
//  Created by James Rochabrun on 7/29/20.
//

import Foundation
import SwiftUI

/// Protocol Composition
typealias DecodableView = View & Decodable
typealias IdentifiableDecodableView = DecodableView & Identifiable
