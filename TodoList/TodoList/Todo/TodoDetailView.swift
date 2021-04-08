//
//  TodoDetailView.swift
//  TodoList
//
//  Created by Palash Roy on 27/02/21.
//

import SwiftUI

struct TodoDetailView: View {
    let listView: Mytodolist
    let td: NSOrderedSet
    let tmIndexValue: Int16
    let viewName: String
    @State var arrayValue:[TodoDetails]
    @State var singleNote = ""
    @State var marked = false
    @State var index = 0
    var body: some View {
        //NavigationView{
        VStack {
            TextField("+ Add Item", text: self.$singleNote, onCommit: {
                self.addItem()
            })
            List{
                ForEach(arrayValue, id:\.self){ newitem in
                    let oneItem = newitem
                    HStack {
                        Image(systemName: oneItem.isComplete ? "checkmark.square" : "square").onTapGesture {
                            self.updateData(id: Int(oneItem.id))
                        }
                        VStack(alignment: .leading){
                            Text(oneItem.details ?? "").strikethrough(oneItem.isComplete)
                        }
                        Spacer()
                    }
                }
            }
        }.onAppear(perform: self.orderSet)
        .navigationTitle(viewName)
        //}
    }
    
    func orderSet() {
        self.arrayValue = Array(_immutableCocoaArray: td)
        self.arrayValue.sort(by: {$0.id < $1.id})
    }
    
    func addItem(){
        self.index = td.count
        listView.addItem(detail: self.singleNote, id: Int16(self.index), isComplete: self.marked, indexValue: Int(self.tmIndexValue))
        self.singleNote = ""
        orderSet()
        
    }
    func updateData(id: Int){
        if let note = td[id] as? TodoDetails {
            note.isComplete = true
            listView.updateItem(indexValue: Int(self.tmIndexValue), detailsObject: note, tdIndex: self.index)
        }
        
    }
}

//struct TodoDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        //TodoDetailView(tm)
//    }
//}
