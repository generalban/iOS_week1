//
//  BanProfile.swift
//  baseProject
//
//  Created by 반성준 on 10/24/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            
            LinearGradient(gradient: Gradient(colors: [Color("MidnightBlue"), Color("SoftPurple")]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 40) {
                
                RotatingProfileView()
                
                ActionButtonsView()
              
                InfoCardView()
                
                Spacer()
            }
            .padding()
        }
    }
}

struct RotatingProfileView: View {
    @State private var isRotating = false
    
    var body: some View {
        VStack {
            
            Image("ban")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 140, height: 140)
                .clipShape(Circle())
                .overlay(
                    Circle().stroke(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 4)
                )
                .shadow(radius: 10)
                .rotationEffect(.degrees(isRotating ? 360 : 0)) // 360도 회전
                .animation(Animation.linear(duration: 10).repeatForever(autoreverses: false), value: isRotating)
                .onAppear {
                    isRotating = true
                }
            
           
            Text("반성준")
                .font(.system(size: 32, weight: .bold))
                .foregroundColor(.black)
                .padding(.top, 10)
            
           
            Text("iOS 개발자 | Swift 열정러")
                .font(.system(size: 18))
                .foregroundColor(.black.opacity(0.8))
                .multilineTextAlignment(.center)
                .padding(.horizontal, 20)
        }
    }
}

struct ActionButtonsView: View {
    var body: some View {
        HStack(spacing: 20) {
          
            ActionButtonView(title: "📱 프로젝트 보기", colors: [Color.blue, Color.purple])
            
          
            ActionButtonView(title: "📧 연락하기", colors: [Color.green, Color.yellow])
        }
    }
}

struct ActionButtonView: View {
    var title: String
    var colors: [Color]
    
    var body: some View {
        Button(action: {
         
        }) {
            Text(title)
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(.white)
                .frame(width: 160, height: 50)
                .background(LinearGradient(gradient: Gradient(colors: colors), startPoint: .topLeading, endPoint: .bottomTrailing))
                .cornerRadius(25)
                .shadow(radius: 10)
        }
    }
}

struct InfoCardView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.white)
                .frame(height: 180)
                .shadow(radius: 10)
            
            VStack(spacing: 12) {
                Text("안녕하세요, 반성준입니다.")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.black)
                
                Text("저는 iOS 개발을 사랑하며, 앱을 만드는 것을 즐깁니다. 함께 멋진 프로젝트를 만들어 나가고 싶어요!")
                    .font(.system(size: 16))
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 30)
            }
            .padding()
        }
        .padding(.top, 30)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
