//
//  Mytodolist.swift
//  TodoList
//
//  Created by Palash Roy on 27/02/21.
//

import SwiftUI

struct Mytodolist: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(entity: TodoMain.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \TodoMain.id, ascending: true)], animation: .default)
    private var tms: FetchedResults<TodoMain>
    @State var title = String()
    @State var index: Int16 = 0
    @State var showModal = false
    var body: some View {
       // NavigationView{
            ZStack{
                BackSplash()
                VStack{
                    List{
                        ForEach(tms, id:\.self) {
                            newitem in
                            let name = newitem.name ?? "unknown"
                            
                            //let set = newitem.items as? [TodoDetail]
                            NavigationLink(name, destination: TodoDetailView(listView: self, td: newitem.items!, tmIndexValue: newitem.id, viewName: name, arrayValue: [], singleNote: "", marked: false, index: 0))
                        }
                    }
                    .navigationTitle("Todo List")
                    .navigationBarItems(
                        trailing:
                            HStack{
                                Button("Add"){
                                    self.showModal.toggle()
                                }
                                .sheet(isPresented: $showModal, content: {AddTodoView()})
                            }
                    )
                }
                
            }
       // }
        
    }
    
    func addTitle(){
        let tm = TodoMain(context: managedObjectContext )
        tm.name = self.title
        tm.id = Int16(tms.count)
        save()
        self.index = Int16(tms.count + 1)
        self.title = ""
    }
    func addItem(detail: String, id: Int16, isComplete: Bool, indexValue: Int){
        print(indexValue)
        let td = TodoDetails(context: managedObjectContext)
        td.details = detail
        td.id = Int16(id)
        td.isComplete = isComplete
        tms[indexValue].addToItems(td)
        save()
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

}

struct Mytodolist_Previews: PreviewProvider {
    static var previews: some View {
        Mytodolist()
    }
}
