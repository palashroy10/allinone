//
//  StopWatch.swift
//  AllUNeed
//
//  Created by Palash Roy on 5/3/20.
//  Copyright © 2020 Palash Roy. All rights reserved.
//

import SwiftUI

//extension Animation {
//    func `repeat`(while expression: Bool, autoreverses: Bool = true) -> Animation {
//        if expression {
//            return self.repeatForever(autoreverses: false)
//        } else {
//            return self
//        }
//    }
//}

struct MyStopWatch: View {
    //@State private var rotation = 0.0
    
    @State var active: Bool = false
    @State var miliSec = 00
    @State var isPaused = true
    @State var btnText = "Start"
    @State var min = 00
    @State var sec = 0
    @State var duration = 0.0
    @State var degree = 0.0
    @State var lastTime = "0:0:0"
    @State var lap = ["0:0:0"]
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    let width = UIScreen.main.bounds.size.width
    var body: some View {
        ZStack {
            BackSplash()
            VStack {
                ZStack {
                    Circle().fill().foregroundColor(Color("todobg")).opacity(0.4).shadow(radius: 30).frame(width: 330, height: 330, alignment: .center).padding(40)
                    HStack {
                        Text("\(min)").frame(width: 60)
                        Text(":")
                        Text("\(sec)").frame(width: 60)
                        Text(":")
                        Text("\(miliSec)").frame(width: 60)
                    }.font(.custom("Digital-7", size: 50))
                        .foregroundColor(Color("textcolor"))
                        .frame(width: 310,
                               height: 310,
                               alignment: .center)
                    .onReceive(timer) { _ in
                        if self.isPaused == false {
                            self.miliSec += 1
                            if self.miliSec > 9 {
                                self.sec += 1 
                                self.miliSec = 0
                            }
                            if self.sec > 59 {
                                self.min += 1
                                self.sec = 0
                            }
                        }
                        self.degree = self.active ?  self.degree + 0.6 : self.degree
                        if self.degree == 360 {
                            self.degree = 0
                        }
                        
                    }
                    VStack {
                        
                        Circle().fill().foregroundColor(Color("textcolor")).shadow(radius: 30).frame(width: 10, height: 10, alignment: .center)
                        Spacer()
                    }.frame(width: 310, height: 310)
                        .rotationEffect(Angle(degrees: self.degree ))
                        .animation(Animation.linear(duration: self.duration).repeatForever(autoreverses: false))
                        
                        .onAppear {
                            self.active = false
                    }
                }
                
                HStack {
                    
                    Button(action: {
                        self.resetClock()
                    }, label: {
                        Text("Reset").font(.title) .fontWeight(.light).foregroundColor(Color.red)
                    }).frame(width: 100, height: 60).background(Color("todobg")).opacity(0.7)
                    .cornerRadius(5)
                    .shadow(radius: 30)
                    
                    Spacer().frame(width: 20)
                    
                    Button(action: {
                        self.lapIt()
                    }, label: {
                        Text("Lap").font(.title) .fontWeight(.light).foregroundColor(Color("textcolor"))
                        }).frame(width: 100, height: 60).background(Color("todobg")).opacity(0.7)
                    .cornerRadius(5)
                    .shadow(radius: 30)
                    
                    Spacer().frame(width: 20)
                    Button(action: {
                        self.toggleTimer()
                        
                    }, label: {
                        Text(self.btnText).font(.title) .fontWeight(.light).foregroundColor(Color("textcolor"))
                    }).frame(width: 100, height: 60).background(Color("todobg")).opacity(0.7)
                    .cornerRadius(5)
                    .shadow(radius: 30)
                }.padding()
                    
                
                VStack{
                    Spacer().frame(height:20)
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack(alignment: .center){
                            ForEach(self.lap, id: \.self){ val in
                                  Text(val)
                                 .fontWeight(.medium)
                                 .foregroundColor(Color("textcolor"))
                                    .frame(width: 80)
                                .background(Color("todobg"))
                                .cornerRadius(5)
                                .shadow(radius: 3)
                                    .padding(.all,5)
                        }
                            
                    }
                }.frame(width: width - 20, height: 40)
                    Spacer()
                        .onAppear{
                            self.lap.remove(at: 0)
                    }
                }
                Spacer()
            }
            
            Spacer()
        }.onDisappear{
            self.resetClock()
        }
    }
    
    
    
    func toggleTimer() {
        isPaused.toggle()
        active.toggle()
        duration = isPaused ? 60.0 : 0.0
        btnText = isPaused ? "Start" : "Pause"
        print("duration = \(duration)")
    }
    func resetClock(){
        miliSec=0
        sec=0
        min=0
        degree=0
        active = false
        isPaused = true
        lap.removeAll()
        btnText = isPaused ? "Start" : "Pause"
    }
    
    
    
    func lapIt() {
        let current = "\(min):\(sec):\(miliSec)"
        let diff = getTimeDiff(start:lastTime, end:current)
        lastTime = current
        lap.insert(diff, at: 0)
        print(lap)
    }
    
}

struct MyStopWatch_Previews: PreviewProvider {
    static var previews: some View {
        MyStopWatch()
    }
}
