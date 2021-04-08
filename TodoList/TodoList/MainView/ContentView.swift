//
//  ContentView.swift
//  TodoList
//
//  Created by Palash Roy on 27/02/21.
//

import SwiftUI
import CoreData


struct ContentView: View {
    @State var showMenu: Bool = false
    
    var body: some View {
        NavigationView {
        ZStack() {
            BackSplash().onTapGesture {
                self.showMenu = false
            }
            AddEvent(showMenu: $showMenu)
                .onAppear{
                    self.showMenu = false
            }
        .navigationBarTitle("Key Me")
        }
    }.navigationViewStyle(StackNavigationViewStyle())
}



struct AddEvent: View {
    @Binding var showMenu: Bool
    var body: some View {
        VStack {
            showMenu ? nil : Spacer()
        HStack{
            showMenu ? nil : Spacer()
            ZStack {
                ShowView(showMenu: $showMenu)
                Image(systemName: "plus.circle.fill").resizable().frame(width: showMenu ? 0 : 60, height: showMenu ? 0 : 60).foregroundColor(Color("textcolor")).onTapGesture {
                    self.showMenu.toggle()
                }
            }
            
            }.padding(.trailing, showMenu ? 0 :40)
        }.padding(.bottom, showMenu ? 0 :60)
        
        }
    }
}

struct ShowView: View {
    @Binding var showMenu: Bool
    var body: some View {
        ZStack {
            Rectangle().fill(LinearGradient(gradient: Gradient(colors: [Color("lightPink"), Color("accent")]), startPoint: .top, endPoint: .bottom)).opacity(0.3)
                .frame(width: self.showMenu ? 300 : 0, height: self.showMenu ? 400 : 0)
                .cornerRadius(40.0)
            .shadow(radius: 20)
                .animation(Animation.spring(response: 0.1, dampingFraction: 0.7, blendDuration: 1.0))
            
            showMenu ? CollectionView() : nil
        }
    }
}
