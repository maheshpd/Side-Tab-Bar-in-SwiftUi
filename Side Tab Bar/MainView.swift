//
//  MainView.swift
//  Side Tab Bar
//
//  Created by Mahesh Prasad on 29/12/20.
//

import SwiftUI

struct MainView: View {
    
    @State var index = 0
    
    var body: some View {
        VStack {
            HStack {
                Text("Food & Delivery")
                    .font(.title)
                    .fontWeight(.bold)
                
                Spacer()
            }.padding(.top, 20)
            .padding(.horizontal, 20)
            
            ScrollView(.horizontal, showsIndicators: false, content: {
                //Swipe Menu...
                HStack {
                    Button(action: {
                        self.index = 0
                    }, label: {
                        Text("Asian")
                        //changing color based on index....
                            .foregroundColor(self.index == 0 ? Color("Color1") : Color.black.opacity(0.7))
                            .padding(.horizontal, 30)
                            .padding(.vertical, 12)
                    }).background(self.index == 0 ? Color.black.opacity(0.06): Color.clear)
                    .clipShape(CShape1())
                    
                    Button(action: {
                        self.index = 1
                    }, label: {
                        Text("American")
                        //changing color based on index...
                            .foregroundColor(self.index == 1 ? Color("Color1") : Color.black.opacity(0.7))
                            .padding(.horizontal, 30)
                            .padding(.vertical, 12)
                    })
                    .background(self.index == 1 ? Color.black.opacity(0.06): Color.clear)
                    .clipShape(CShape1())
                    
                    Button(action: {
                        self.index = 2
                    }, label: {
                        Text("Mexican")
                        //changing color based on index....
                            .foregroundColor(self.index == 2 ? Color("Color1"): Color.black.opacity(0.7))
                            .padding(.horizontal, 30)
                            .padding(.vertical, 12)
                    }).background(self.index == 2 ? Color.black.opacity(0.06) : Color.clear)
                    .clipShape(CShape1())
                    
                    Button(action: {
                        self.index = 3
                    }, label: {
                        Text("Mexicon")
                        //changing color based on index...
                            .foregroundColor(self.index == 3 ? Color("Color1") : Color.black.opacity(0.7))
                            .padding(.horizontal, 30)
                            .padding(.vertical, 12)
                    })
                    .background(self.index == 3 ? Color.black.opacity(0.06) : Color.clear)
                    .clipShape(CShape1())
                    
                    Button(action: {
                        self.index = 4
                    }, label: {
                        Text("Chinese")
                        //changing color based on index...
                            .foregroundColor(self.index == 4 ? Color("Color1") : Color.black.opacity(0.7))
                            .padding(.horizontal, 30)
                            .padding(.vertical, 12)
                    })
                    .background(self.index == 4 ? Color.black.opacity(0.06): Color.clear)
                    .clipShape(CShape1())
                }.padding(.horizontal, 20)
            }).padding(.top, 25)
            
            ScrollView(.horizontal, showsIndicators: false, content: {
                HStack(spacing: 20) {
                    ForEach(data){ i in
                        VStack{
                            Image(i.image)
                                .resizable()
                                .frame(width: 125, height: 125)
                                .clipShape(Circle())
                            
                            Text(i.price)
                                .fontWeight(.bold)
                                .font(.title)
                                .foregroundColor(Color("Color1"))
                                .padding(.top)
                            
                            Text(i.name)
                                .padding(.vertical, 20)
                            
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                Text("Add")
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .padding(.vertical)
                                    .padding(.horizontal, 35)
                            }).background(Color("Color1"))
                            .clipShape(CShape1())
                        }
                        .padding(.vertical)
                        .padding(.horizontal, 40)
                        .background(Color.black.opacity(0.05))
                        .clipShape(CShape1())
                    }
                }.padding(.horizontal, 20)
            }).padding(.top, 25)
            
            Spacer()
            
            HStack{
                Spacer()
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("View All")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.horizontal, 35)
                        .padding(.vertical)
                        
                }).background(Color("Color1"))
                .clipShape(CShape1())
            }.padding(.horizontal, 20)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

//sample data type and data...
struct Type: Identifiable {
    var id : Int
    var name : String
    var cName : String
    var price : String
    var image : String
}

var data = [
    Type(id: 0, name: "Rice Stick Noodles", cName: "Italian", price: "$18", image: "rice"),
    Type(id: 1, name: "Mung Bean Noodles", cName: "Chinese", price: "$29", image: "bean")
]
