//
//  DetailView.swift
//  cMcCrea_357_Project03
//
//  Created by cpsc on 3/14/21.
//

import SwiftUI

struct DetailView: View{
    var displayString : String
    var master : String
    var body: some View{
        Text(Encrypt.deserialize(ustring: displayString+master))
    }
    
}

struct DetailView_Previews: PreviewProvider{
    static var previews: some View{
        DetailView(displayString: "Hello World", master:"Test")
    }
}
