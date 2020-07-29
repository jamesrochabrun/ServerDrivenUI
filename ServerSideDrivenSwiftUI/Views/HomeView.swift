//
//  HomeView.swift
//  ServerSideDrivenSwiftUI
//
//  Created by James Rochabrun on 7/26/20.
//

import Foundation
import SwiftUI

struct HomeView: View {
    
    @State var show = false
    
    var body: some View {
        BaseView {
            Text("Home")
            createListView()
            createButton()
        }
    }
    
    func createListView() -> some View {
        List {
            ForEach(0..<20) {
                Text("the row is \($0)")
            }
        }
    }
    
    func createButton() -> some View {
        Button(action: {
            self.show.toggle()
        }, label: {
            /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
        }).sheet(isPresented: $show) {
            DetailView()
        }
    }
}


struct HomeView_Previews: PreviewProvider {
    
    static var previews: some View {
        HomeView()
    }
}
