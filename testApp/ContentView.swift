//
//  ContentView.swift
//  testApp
//
//  Created by Johnathan on 30/06/2021.
//

import SwiftUI
import AlertToast

struct simpleView: View {
    
    @State var selectedTab = 0
    @State private var isPresented = false
    let icons = [
        "house",
        "doc.text.magnifyingglass",
        "doc.text.viewfinder",
        "bell",
        "person.crop.circle"
    ]
    
    var body: some View {
        VStack{
            
            //- content
            ZStack{
                switch selectedTab {
                case 0:
                    HomeView()
                
                case 1:
                    DocumentView()
                    
                case 2:
//                    NavigationView{
//                        VStack{
//                            Text("Add")
//                        }
//                        .navigationTitle("Plus")
//                    }
                    //- move to camera view
                    CameraView()
                    
                case 3:
                    NotificationView()
                    
                case 4:
                    UserProfileView()
                
                default:
                    NavigationView{
                        VStack{
                            Text("This is the default screen")
                        }.navigationTitle("Default")
                    }
                }
                
            }
            Spacer()
            Divider()
            
            //- our tab bar
            HStack{
                ForEach(0..<5, id: \.self) {num in
                    Spacer()
                    
                    Button(action: {
                        self.selectedTab = num
                    }, label: {
                        
                        if num == 2 {
                            Image(systemName: icons[2])
                                .font(.system(size: 25, weight: .regular, design: .default))
                                .foregroundColor(.white)
                                .frame(width: 60, height: 60, alignment: .center)
                                .background(Color.blue)
                                .cornerRadius(60)
                        }else{
                            Image(systemName: icons[num])
                                .font(.system(size: 25, weight: .regular, design: .default))
                                .foregroundColor(selectedTab == num ? .blue: Color(UIColor.lightGray))
                        }
                    })
                    
                    Spacer()
                }
            }
            
            
        }
    }
}

struct HomeView: View {
    var body: some View{
        NavigationView{
            VStack{
                Text("Home")
            }
            .navigationTitle("Home")
        }
    }
}

struct DocumentView: View {
    var body: some View{
        NavigationView{
            VStack{
                Text("Document")
            }
            .navigationTitle("Document")
        }
    }
}

struct NotificationView: View {
    @State private var showToast = false
    var body: some View{
        NavigationView{
            VStack{
                Text("Notification")
                Button(action: {
                    showToast.toggle()
                }, label: {
                    Text("show toast")
                })
                
            }
            .navigationTitle("Notification")
            .frame(width: 400, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .toast(isPresenting: $showToast, duration: 2) {
                AlertToast(type: .regular, title: "This is Notification view")
            }
            
        }
    }
}

struct UserProfileView: View {
    var body: some View{
        NavigationView{
            VStack{
                Text("Profile")
            }
            .navigationTitle("Profile")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
//        ContentView()
//        baoView()
//        sampleTabView()
//        sampleTabViewWithContentView()
//        CustomTabView()
        simpleView()
            .preferredColorScheme(.dark)
    }
}
