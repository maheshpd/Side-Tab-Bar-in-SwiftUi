//
//  Home.swift
//  Side Tab Bar
//
//  Created by Mahesh Prasad on 29/12/20.
//

import SwiftUI

struct Home: View {
    
    @State var index = 0
    
    var body: some View {
        HStack(spacing: 0) {
            VStack {
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image("menu")
                        .renderingMode(.original)
                        .resizable()
                        .frame(width: 22, height: 22)
                }).padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                   Image("search")
                    .renderingMode(.original)
                    .resizable()
                    .frame(width: 22, height: 22)
                }).padding(.top, 30)
                
                //now going to create side tabbar...
                //follow me
                
                Group {
                    Button(action: {
                        self.index = 3
                    }, label: {
                        VStack{
                            Text("My Profile")
                            //Fixed width because we re going to rotate views....
                                .frame(width: 120, height: 35)
                            
                            //changing textcolor based on index...
                                .foregroundColor(self.index == 3 ? Color.white : Color.black)
                        }
                        //changing by color based on index...
                        .background(Color("Color1").opacity(self.index == 3 ? 1 : 0))
                        .clipShape(CShape1())
                    }).rotationEffect(.init(degrees: -90))
                    .padding(.top, 80)
                    
                    Spacer(minLength: 0)
                    
                    //adding remaining tabs...
                    
                    Button(action: {
                        self.index = 2
                    }, label: {
                        VStack{
                            Text("Notifications")
                            //Fixed width because we re going to rotate views....
                                .frame(width: 120, height: 35)
                            
                            //changing textcolor based on index...
                                .foregroundColor(self.index == 2 ? Color.white : Color.black)
                        }
                        //changing by color based on index....
                        .background(Color("Color1").opacity(self.index==2 ? 1: 0))
                        .clipShape(CShape1())
                    }).rotationEffect(.init(degrees: -90))
                    
                    Spacer(minLength: 0)
                    
                    Button(action: {
                        self.index = 1
                    }, label: {
                        VStack{
                            Text("Invoice")
                            //Fixed width because we re going to rotate views...
                                .frame(width: 120, height: 35)
                            
                            //changing textcolor based on index...
                                .foregroundColor(self.index == 1 ? Color.white : Color.black)
                        }
                        //changing bg color based on index...
                        .background(Color("Color1").opacity(self.index == 1 ? 1 : 0))
                        .clipShape(CShape1())
                    })
                    .rotationEffect(.init(degrees: -90))
                    
                    Spacer(minLength: 0)
                    
                    Button(action: {
                        self.index = 0
                    }, label: {
                        VStack {
                            Text("Home")
                            //Fixed width because we re going to rotate views...
                                .frame(width: 120, height: 35)
                            
                            //changing textcolor based on index...
                                .foregroundColor(self.index == 0 ? Color.white : Color.black)
                        }
                        //changing bg color based on index...
                        .background(Color("Color1").opacity(self.index == 0 ? 1 : 0))
                        .clipShape(CShape1())
                    })
                    .rotationEffect(.init(degrees: -90))
                    
                    Spacer(minLength: 0)
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Image("shop")
                            .renderingMode(.original)
                            .resizable()
                            .frame(width: 25, height: 30)
                    }).padding(.bottom)
                    .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom)
                    
                    //due to all edges is ignored we using this padding...
                }
                
                //due to this spacer there is space in bottom
            }
            .padding(.vertical)
            .frame(width: 85)
            .background(Color("Color"))
            .clipShape(CShape())
            
            //now we re going to create main view...
            GeometryReader { _ in
                VStack{
                    //changing tabs based on tabs...
                    if self.index == 0 {
                        MainView()
                    }
                    else if self.index == 1 {
                        Invoice()
                    }
                    else if self.index == 2 {
                        Notifications()
                    } else {
                        Profile()
                    }
                }.padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom)
                
                //due to all edges are ignored
            }
        }.edgesIgnoringSafeArea(.all)
    }
}


struct CShape : Shape {
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topRight, .bottomRight], cornerRadii: CGSize(width: 35, height: 35))
        
        return Path(path.cgPath)
    }
}


struct CShape1: Shape {
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft, .bottomRight], cornerRadii: CGSize(width: 15, height: 15))
        return Path(path.cgPath)
    }
}
