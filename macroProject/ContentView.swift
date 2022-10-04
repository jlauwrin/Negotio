//
//  ContentView.swift
//  macroProject
//
//  Created by Jason Lauwrin on 26/09/22.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @AppStorage("currentPage") var currentPage = 1
    
    var body: some View{
        
        if currentPage > totalPages{
            Home()
        }else{
            WalkthroughScreen()
        }
    }
}

struct ContentView_Previews: PreviewProvider{
    static var previews: some View{
        ContentView()
    }
}

struct Home: View{
    
    var body: some View{
        
        HomeView()
    }
}


// walkthrough screen....
struct WalkthroughScreen: View{
    
    @AppStorage("currentPage") var currentPage = 1
    
    var body: some View{
        
        //for slide animation
        
        ZStack{
            
            //changing between views
            if currentPage == 1{
                ScreenView(image: "apalu", title: "title 1", detail: "isi sendiri", bgColor: Color(.blue))
                    .transition(AnyTransition.opacity.animation(.easeInOut))
            }
            
            if currentPage == 2{
                ScreenView(image: "asu", title: "title 2", detail: "isi sendiri", bgColor: Color.white)
                    .transition(AnyTransition.opacity.animation(.easeInOut))
            }
            
            if currentPage == 3{
                ScreenView(image: "oi", title: "title 3", detail: "isi sendiri", bgColor: Color.white)
                    .transition(AnyTransition.opacity.animation(.easeInOut))
            }
//            .background(Color("isi sendiri colornya").ignoresSafeArea())
//            //ignore safe area biar semuanya ke fill
            
            
        }
        .overlay(
            
            //button
            Button(action: {
                //changing views
                withAnimation(.easeInOut){
                    
                    
                    //check
                    if currentPage <= totalPages{
                        currentPage += 1
                    }else{
                        //for app testing only
                        currentPage = 1
                    }
                }
            }, label: {
                
                Image(systemName: "chevron.right")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(.black)
                    .frame(width: 60, height: 60)
                    .background(Color.blue)
                    .clipShape(Circle())
                
                //circular slider
                    .overlay(
                        
                        ZStack{
                            
                            Circle()
                                .stroke(Color.black.opacity(0.04), lineWidth: 4)
                            
                            Circle()
                                .trim(from: 0, to: CGFloat(currentPage) / CGFloat(totalPages))
                                .stroke(Color.gray, lineWidth: 4)
                                .rotationEffect(.init(degrees: -90))
                        }
                        .padding(-15)
                    )
            })
            .padding(.bottom,20)
            
            ,alignment: .bottom
        )
    }
}

struct ScreenView: View {
    
    var image: String
    var title: String
    var detail: String
    var bgColor: Color
    
    @AppStorage("currentPage") var currentPage = 1
    
    var body: some View {
        VStack(spacing: 20){
            
            HStack{
                //showing it only for first page
                if currentPage == 1{
                    Text("Hello member")
                        .font(.title)
                        .fontWeight(.semibold)
                        .kerning(1.4)
                }else{
                    //back button...
                    Button(action: {
                        withAnimation(.easeInOut){
                            currentPage -= 1
                        }
                    }, label: {
                        
                        Image(systemName: "chevron.left")
                            .foregroundColor(.black)
                            .padding(.vertical,10)
                            .padding(.horizontal)
                            .background(Color.black.opacity(0.4))
                            .cornerRadius(10)
                    })
                }
                
                Spacer()
                
                Button(action: {
                    withAnimation(.easeInOut){
                        currentPage = 4
                    }
                }, label: {
                    Text("Skip")
                        .fontWeight(.semibold)
                        .kerning(1.2)
                })
            }
            .foregroundColor(.black)
            .padding()
            
            Spacer(minLength: 0)
            
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .padding(.top)
            
            Text("isi deskripsi")
                .fontWeight(.semibold)
                .kerning(1.3)
                .multilineTextAlignment(.center)
            
            
            //minimum spacing when phone is reducing...
            
            Spacer(minLength: 120)
        }
//        .background(bgColor.cornerRadius(10).ignoresSafeArea())
    }
}


//total page
var totalPages = 3
