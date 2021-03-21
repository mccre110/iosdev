//
//  EnterView.swift
//  cMcCrea_357_Project03
//
//  Created by cpsc on 3/20/21.
//

import SwiftUI

struct EnterView: View {
    @State private var master = ""
    @State private var showingContent = false
    var body: some View{
        VStack{
            TextField("Enter Master Password", text: $master).padding()
            Button(action: {
                showingContent.toggle()
            }, label: {
                Text("Enter")
            })
            .sheet(isPresented: $showingContent){
                ContentView(master: master)
            }
        }
    }
}
struct EnterView_Previews: PreviewProvider {
    static var previews: some View {
        EnterView()
    }
}
