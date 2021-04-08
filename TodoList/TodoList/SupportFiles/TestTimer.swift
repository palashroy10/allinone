//
//  TestTimer.swift
//  AllUNeed
//
//  Created by Palash Roy on 06/06/20.
//  Copyright © 2020 Palash Roy. All rights reserved.
//

import SwiftUI

struct TestTimer: View {
    @State var miliSec = 0
    @State var isPaused = false
    @State var btnText = "Pause"
    @State var min = 0
    @State var sec = 0
    @State var duration = 1
    @State private var degree = 0.0
    @State private var text = "1"
    @State private var phase: CGFloat = 0
    //let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
     @State private var animationAmount: CGFloat = 1
    var body: some View {
        VStack{
            Button("Tap Me") {
                 self.animationAmount = 1
                self.duration=0
            }
            .padding(40)
            .background(Color.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            .overlay(
                Circle()
                    .stroke(Color.red)
                    .scaleEffect(animationAmount)
                    .opacity(Double(2 - animationAmount))
                    .animation(
                        Animation.easeOut(duration: Double(self.duration))
                            .repeatForever(autoreverses: false)
                    )
            )
            .onAppear {
                self.animationAmount = 2
            }
            Circle()
                    .strokeBorder(style: StrokeStyle(lineWidth: 3, dash: [5,6], dashPhase: phase))
                    .frame(width: 200, height: 200)
                    .onAppear { self.phase -= 10 }
                    .animation(Animation.linear.repeatForever(autoreverses: false))
            
            
        
        
        ZStack {
            Rectangle()
                .foregroundColor(.green)
                Text(text)

        }
        .frame(width: 120, height: 60)
        .rotation3DEffect(Angle(degrees: degree), axis: (x: 10, y: 0, z: 0), anchor: .bottom)

        .onTapGesture {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.text = ""
            }
            withAnimation(.linear(duration: 1)) {
                if self.degree == 0 {
                    self.degree += 180
                } else {
                    self.degree -= 180
                }
            }
            }
            
            //
            ZStack {
                Rectangle()
                    .foregroundColor(.green)
                    Text(text)

            }
            .frame(width: 120, height: 60)
            .rotation3DEffect(Angle(degrees: degree), axis: (x: 10, y: 0, z: 0), anchor: .bottom)

            .onTapGesture {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    self.text = ""
                }
                withAnimation(.linear(duration: 1)) {
                    if self.degree == 0 {
                        self.degree += 180
                    } else {
                        self.degree -= 180
                    }
                }
            }
            //
        }
    }
    func toggleTimer() {
        isPaused.toggle()
        btnText = isPaused ? "Start" : "Pause"
    }
    func reset() {
        
    }
}



struct TestTimer_Previews: PreviewProvider {
    static var previews: some View {
        TestTimer()
    }
}
