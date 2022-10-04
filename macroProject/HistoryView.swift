//
//  TheoryView.swift
//  macroProject
//
//  Created by Jason Lauwrin on 30/09/22.
//

import SwiftUI

struct HistoryView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var btnBack : some View { Button(action: {
        self.presentationMode.wrappedValue.dismiss()
    }){
        HStack{
            Image(systemName: "chevron.left")
                .font(.system(size: 13, weight: .semibold))
                .foregroundColor(.white)
                .frame(width: 38, height: 38)
                .background(Color("backButtonColor"))
                .clipShape(Circle())
            
            Text("  History")
                .font(.system(size: 40, weight: .bold))
            }
        }
    }
    
    var body: some View {
        
        ScrollView(){
            
            ZStack{
                Color("backgroundColor").ignoresSafeArea()
                VStack(spacing: 20){
                        
                    VStack(alignment: .leading){
                        Text("Your History")
                            .font(.system(size: 25))
                            .fontWeight(.bold)
                            .kerning(0.3)
                            .frame(maxWidth: 360, maxHeight: 50, alignment: .bottomLeading)
                            
                        Text(" ")
                            .font(.system(size: 14))
                            .fontWeight(.medium)
                            .kerning(0.3)
                            .frame(maxWidth: 360, maxHeight: 35, alignment: .bottomLeading)
                            
                        VStack{
                            Button(action: {
                                    
                            }, label: {
                                Image(systemName: "arrow.left")
                                    .foregroundColor(.black)
                                    .cornerRadius(10)
                                    .frame(width: 360, height: 80)
                            })
                            .background(Color.blue)
                            .cornerRadius(20)
                                
                            Button(action: {
                                    
                            }, label: {
                                Image(systemName: "arrow.left")
                                    .foregroundColor(.black)
                                    .cornerRadius(10)
                                    .frame(width: 360, height: 80)
                            })
                            .background(Color.blue)
                            .cornerRadius(20)
                                
                                
                                
                        }
                        .frame(maxWidth: 360, maxHeight: 200, alignment: .bottomLeading)
                        .offset(x: 0, y: 10)

                    }.offset(x: 0, y: 40)
                        
                        //bagian button menu nih
                        
                        
                    VStack(alignment: .leading){
                        Text("Negotiation Knowledge")
                            .font(.system(size: 25))
                            .fontWeight(.bold)
                            .kerning(0.3)
                            .frame(maxWidth: 360, maxHeight: 50, alignment: .bottomLeading)
                                .offset(x: 0, y: 65)
                            
                        VStack{
                            Button(action: {
                                    
                            }, label: {
                                Image(systemName: "arrow.left")
                                    .foregroundColor(.black)
                                    .cornerRadius(10)
                                    .frame(width: 360, height: 80)
                            })
                            .background(Color.blue)
                            .cornerRadius(20)
                                
                            Button(action: {
                                    
                            }, label: {
                                Image(systemName: "arrow.left")
                                    .foregroundColor(.black)
                                    .cornerRadius(10)
                                    .frame(width: 360, height: 80)
                            })
                            .background(Color.blue)
                            .cornerRadius(20)
                            
                        }.offset(x: 0, y: 85)
                    }
                        
                    Spacer(minLength: 80)

                }
            }.ignoresSafeArea()
            .navigationBarTitleDisplayMode(.inline)

            //ini headernya
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: btnBack)
//            .shadow(color: .black, radius: 1)
            
        }
    }
}

struct HistoryView_Previews: PreviewProvider{
    static var previews: some View{
        HomeView()
    }
}

