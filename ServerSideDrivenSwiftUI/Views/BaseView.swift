//
//  BaseView.swift
//  ServerSideDrivenSwiftUI
//
//  Created by James Rochabrun on 7/27/20.
//

import SwiftUI

struct BaseView<Content: View>: View {
    
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        
        VStack {
            HStack(spacing: 10) {
                Image(systemName: "sun.max.fill")
                    .resizable()
                    .frame(width: 40, height: 40)
                Text("Main Title")
            }
            Divider()
            content
            Spacer()
            Text("Footer text")
                .frame(width: UIScreen.main.bounds.width, height: 50)
                .font(.footnote)
                .background(Color.gray)
                .foregroundColor(Color.white)
        }
    }
}

struct BaseView_Previews: PreviewProvider {
    static var previews: some View {
        BaseView {
            Image(systemName: "sun.max.fill")
                .resizable()
                .frame(width: 40, height: 40)
        }
    }
}
