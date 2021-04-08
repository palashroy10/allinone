//
//  BackSplash.swift
//  AllUNeed
//
//  Created by Palash Roy on 11/06/20.
//  Copyright © 2020 Palash Roy. All rights reserved.
//

import SwiftUI

struct BackSplash: View {
    var body: some View {
        Rectangle().fill(LinearGradient(gradient: Gradient(colors: [Color("background4"), Color("background5")]), startPoint: .top, endPoint: .bottom)).edgesIgnoringSafeArea(.all)
    }
}

struct BackSplash_Previews: PreviewProvider {
    static var previews: some View {
        BackSplash()
    }
}
