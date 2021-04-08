//
//  CollectionView.swift
//  AllUNeed
//
//  Created by Palash Roy on 5/3/20.
//  Copyright © 2020 Palash Roy. All rights reserved.
//

import SwiftUI

struct DataModel {
    let id: String
    let name: String
    let imageName: String
    var navigationlink: AnyView
}

struct DataList {
    let id: Int
    let dataModl: [DataModel]
}

struct CollectionView: View {
    
    let datalist: [DataList] = [
        .init(id: 0, dataModl: [.init(id: "0", name: "text.badge.plus", imageName: "Todo", navigationlink: AnyView(Mytodolist())), .init(id: "1", name: "doc.circle", imageName: "Stickies", navigationlink: AnyView(MyStopWatch()))]),
        .init(id: 1, dataModl: [.init(id: "2", name: "pencil.and.outline", imageName: "Reminder", navigationlink: AnyView(MyStopWatch())), .init(id: "3", name: "briefcase.fill", imageName: "Appointment", navigationlink: AnyView(MyStopWatch()))]),
        .init(id: 2, dataModl: [.init(id: "4", name: "alarm", imageName: "Alarm", navigationlink: AnyView(MyStopWatch())), .init(id: "5", name: "stopwatch", imageName: "Stopwatch", navigationlink: AnyView(MyStopWatch()))])
    ]

    var body: some View {
        VStack(alignment: .leading) {
            
            ForEach(datalist, id: \.id) { data in
                HStack(alignment: .center) {
                    Spacer()
                    ForEach(data.dataModl, id: \.id) { item in
                        NavigationLink(destination: item.navigationlink) {
                        HStack {
                            Spacer()
                            VStack {
                                Spacer()
                            Image(systemName: "\(item.name)")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .foregroundColor(Color("textcolor"))
                                .shadow(radius: 10)
                                Text(item.imageName).foregroundColor(Color("textcolor"))
                                Spacer()
                                
                            }
                            Spacer()
                        }
                        }
                        //Text(self.something)
//
                        
                    }.padding(.all, 10)
                    Spacer()
                }
                }
        }.frame(width: 300, height: 400)
        }
    }

struct CollectionView_Previews: PreviewProvider {
    static var previews: some View {
        CollectionView()
    }
}
