//
//  AddTodoView.swift
//  TodoList
//
//  Created by Palash Roy on 28/02/21.
//

import SwiftUI

struct AddTodoView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(entity: TodoMain.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \TodoMain.id, ascending: true)], animation: .default)
    private var tms: FetchedResults<TodoMain>
    //@State var td: NSOrderedSet
//    @State var listView: Mytodolist
    @State var index: Int16 = 0
    @State var detailIndex: Int16 = 0
    @State var title = String()
    @State var singleNote = ""
    @State var arrayValue = [TodoDetails]()
    var body: some View {
        ZStack {
            BackSplash()
            VStack {
                Spacer()
                
                TextField("Add Title", text: self.$title, onCommit: {
                    addTitle()
                }).font(.title)
                
                TextField("+ Add Item", text: self.$singleNote, onCommit: {
                    self.addItem()
                })

                List{
                    ForEach(arrayValue, id:\.self){ newitem in
                        let oneItem = newitem
                        HStack {
                            Image(systemName: oneItem.isComplete ? "checkmark.square" : "square").onTapGesture {
                                //self.updateData(id: Int(oneItem.id))
                            }
                            VStack(alignment: .leading){
                                Text(oneItem.details ?? "").strikethrough(oneItem.isComplete)
                            }
                            Spacer()
                        }
                    }
                }
                Spacer()
            }.padding(.leading, 10).padding(.top, -10)
            
        }
    }
    
    func addTitle(){
        let tm = TodoMain(context: managedObjectContext)
        tm.name = self.title
        self.index = Int16(tms.count)
        tm.id = Int16(tms.count)
        save()
        
    }
    func addItem(){
        let td = TodoDetails(context: managedObjectContext)
        td.details = self.singleNote
        td.id = self.detailIndex
        self.detailIndex += 1
        td.isComplete = false
        tms[Int(self.index)].addToItems(td)
        print("Name--\(tms[Int(self.index)].name) and id -- \(tms[Int(self.index)].id) index value -- \(self.index) ")
        save()
        orderSet()
    }
    
    func updateItem(indexValue: Int, detailsObject: TodoDetails, tdIndex: Int){
        tms[indexValue].replaceItems(at: tdIndex, with: detailsObject)
        save()
    }
    
    func save() {
        do {
            try managedObjectContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
    func orderSet() {
        self.arrayValue = Array(_immutableCocoaArray: (tms[Int(self.index)].items!))
        self.arrayValue.sort(by: {$0.id < $1.id})
    }
    
//    func addItem(){
//        self.index = td.count
//        listView.addItem(detail: self.singleNote, id: Int16(self.index), isComplete: self.marked, indexValue: Int(self.tmIndexValue))
//        self.singleNote = ""
//        orderSet()
//
//    }
//    func updateData(id: Int){
//        if let note = td[id] as? TodoDetails {
//            note.isComplete = true
//            listView.updateItem(indexValue: Int(self.tmIndexValue), detailsObject: note, tdIndex: self.index)
//        }
//
//    }
}

//struct AddTodoView_Previews: PreviewProvider {
//    static var previews: some View {
//        //AddTodoView()
//    }
//}
