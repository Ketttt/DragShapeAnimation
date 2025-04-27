//
//  ContentView.swift
//  DragShapeAnimation
//
//  Created by Katerina Dev on 22.09.24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ResetHeart()
    }
}

struct Heart: Shape, Hashable {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.midX, y: rect.maxY ))
        
        path.addCurve(to: CGPoint(x: rect.minX, y: rect.height/4),
                      control1:CGPoint(x: rect.midX, y: rect.height*3/4),
                      control2: CGPoint(x: rect.minX, y: rect.midY))
        path.addArc(center: CGPoint( x: rect.width/4,y: rect.height/4),
                    radius: (rect.width/4),
                    startAngle: Angle(radians: Double.pi),
                    endAngle: Angle(radians: 0),
                    clockwise: false)
        path.addArc(center: CGPoint( x: rect.width * 3/4,y: rect.height/4),
                    radius: (rect.width/4),
                    startAngle: Angle(radians: Double.pi),
                    endAngle: Angle(radians: 0),
                    clockwise: false)
        
        path.addCurve(to: CGPoint(x: rect.midX, y: rect.height),
                      control1: CGPoint(x: rect.width, y: rect.midY),
                      control2: CGPoint(x: rect.midX, y: rect.height*3/4))
        return path
    }
}

struct ResetHeart: View {
    
    @State private var position = CGPoint(x : 100 , y : 200)
    let bgColor = #colorLiteral(red: 1, green: 0.9756330848, blue: 0.9458593726, alpha: 1)
    
    var body: some View {
        ZStack{
            
            Color(bgColor)
                .edgesIgnoringSafeArea(.all)
            
            ZStack {
                Heart()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.brown)
                    .shadow(color: .brown.opacity(0.3), radius: 10)
                    .animation(Animation.easeInOut(duration: 4).delay(0.9), value: position)
                
                Heart()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.poppy)
                    .shadow(color: .poppy.opacity(0.3), radius: 10)
                    .animation(Animation.easeInOut(duration: 4).delay(0.8), value: position)
                
                Heart()
                    .foregroundColor(.babyPink)
                    .shadow(color: .babyPink.opacity(0.3), radius: 10)
                    .frame(width: 40, height: 40)
                    .animation(Animation.easeInOut(duration: 4).delay(0.7), value: position)
                
                Heart()
                    .foregroundColor(.black)
                    .shadow(color: .black.opacity(0.3), radius: 10)
                    .frame(width: 50, height: 50)
                    .animation(Animation.easeInOut(duration: 4).delay(0.6), value: position)
                
                Heart()
                    .foregroundColor(.dragonfruit)
                    .shadow(color: .dragonfruit.opacity(0.3), radius: 10)
                    .frame(width: 60, height: 60)
                    .animation(Animation.easeInOut(duration: 4).delay(0.5), value: position)
                
                Heart()
                    .foregroundColor(.lavender)
                    .shadow(color: .lavender.opacity(0.3), radius: 10)
                    .frame(width: 70, height: 70)
                    .animation(Animation.easeInOut(duration: 4).delay(0.4), value: position)
                
                Heart()
                    .foregroundColor(.beeYellow)
                    .shadow(color: .beeYellow.opacity(0.3), radius: 10)
                    .frame(width: 80, height: 80)
                    .animation(Animation.easeInOut(duration: 4).delay(0.3), value: position)
                
                Heart()
                    .foregroundColor(.teaGreen)
                    .shadow(color: .teaGreen.opacity(0.3), radius: 10)
                    .frame(width: 90, height: 90)
                    .animation(Animation.easeInOut(duration: 4).delay(0.2), value: position)
                
                Heart()
                    .foregroundColor(.darkGreen)
                    .shadow(color: .darkGreen.opacity(0.3), radius: 10)
                    .frame(width: 100, height: 100)
                    .animation(Animation.easeInOut(duration: 4).delay(0.1), value: position)
                
            }
            .position(x : self.position.x ,y: self.position.y)
            .gesture(DragGesture()
                .onChanged({ value in
                    self.position.x = value.location.x
                    self.position.y = value.location.y
                })
            )
        }
        
    }
}
