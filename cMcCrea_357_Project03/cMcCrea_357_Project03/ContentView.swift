 //
//  ContentView.swift
//  cMcCrea_357_Project03
//
//  Created by cpsc on 3/14/21.
//

import SwiftUI

struct ContentView: View {
    @State var words = StorageHandler.getStorage()
    @State private var password: String = ""
    @State private var name: String = ""
    @State private var showingDetail = false
    var master : String
    var body: some View {
        VStack {
            TextField("Enter name", text: $name)
                .padding()
            TextField("Enter password", text: $password)
                .padding()
            Button(
                action: {
                    if password != "" && name != "" && words[name] == nil {
                        words[name] = Encrypt.serialize(ustring: password + master)
                        StorageHandler.setStorage(input: words)
                        self.password = ""
                        self.name = ""
                    }
                    
                },
                label: {
                Text("Add a password")
                    .padding(.horizontal, 12)
                    .padding(.vertical, 5)
                    .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/,width: 1)
                    .foregroundColor(.black)
            })
            List {
                ForEach(Array(words.keys), id: \.self){ item in Button(
                        action:{
                            showingDetail.toggle()
                        } ,
                        label: {
                            Text(item).frame(maxWidth: .infinity, alignment: .leading)
                    })
                        .sheet(isPresented: $showingDetail, content: {
                            DetailView(displayString: words[item]!, master: master)
                        })
                }
                .onDelete(perform: delete)
            }
        }
    }
    func delete(at offsets: IndexSet){
        var keyl : [String] = []
        let list = Array(words.keys)
        for i in offsets{
            keyl.append(list[i])
        }
        for key in keyl {
            words[key] = nil
        }
        StorageHandler.setStorage(input: words)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(master: "Test")
    }
}
