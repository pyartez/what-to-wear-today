//
//  ContentView.swift
//  what-to-wear-today
//
//  Created by Phil Yates on 19/05/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false, content: {
            VStack(alignment: .leading, spacing: 16) {
                Text("Rugeley")
                    .font(.title)
                    .bold()
                VStack(spacing: 16) {
                    HStack() {
                        Image("advicons.umbrella")
                            .renderingMode(.original)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: nil, alignment: .center)
                            
                        VStack(alignment: .leading) {
                            Text("Title")
                                .font(.headline)
                            Text("Sub Title")
                                .font(.subheadline)
                                .foregroundColor(Color("colors.subTitle"))
                        }
                        Spacer()
                    }
                    
                    HStack() {
                        Image("advicons.coat")
                            .renderingMode(.original)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: nil, alignment: .center)
                            
                        VStack(alignment: .leading) {
                            Text("Title")
                                .font(.headline)
                            Text("Sub Title")
                                .font(.subheadline)
                                .foregroundColor(Color("colors.subTitle"))
                        }
                        Spacer()
                    }
                    
                    HStack() {
                        Image("advicons.sunglasses")
                            .renderingMode(.original)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: nil, alignment: .center)
                            
                        VStack(alignment: .leading) {
                            Text("Title")
                                .font(.headline)
                            Text("Sub Title")
                                .font(.subheadline)
                                .foregroundColor(Color("colors.subTitle"))
                        }
                        Spacer()
                    }
                }
                .groupStyle()
                
                VStack(spacing: 0) {
                    VStack(spacing: 16) {
                        HStack(spacing: 16) {
                            Text("11:00")
                                .font(.title3)
                                .bold()
                            
                            Image(systemName: "cloud.sun.rain.fill")
                                .renderingMode(.original)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: nil, height: 30, alignment: .center)
                            
                            Text("10 c")
                                .font(.headline)
                                .bold()
                                .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
                                .background(Color.green)
                                .cornerRadius(50)
                            Spacer()
                        }
                    }.groupStyle()
                    
                    HStack {
                        Spacer()
                            .frame(maxWidth: 40)
                        Divider()
                            .frame(maxWidth: 5)
                            .background(Color.gray)
                        Spacer()
                    }.frame(maxHeight: 10)
                    
                    VStack(spacing: 16) {
                        HStack(spacing: 16) {
                            Text("12:00")
                                .font(.title3)
                                .bold()
                            
                            Image(systemName: "cloud.sun.rain.fill")
                                .renderingMode(.original)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: nil, height: 30, alignment: .center)
                            
                            Text("10 c")
                                .font(.headline)
                                .bold()
                                .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
                                .background(Color.green)
                                .cornerRadius(50)
                            Spacer()
                        }
                    }.groupStyle()
                    
                    HStack {
                        Spacer()
                            .frame(maxWidth: 40)
                        Divider()
                            .frame(maxWidth: 5)
                            .background(Color.gray)
                        Spacer()
                    }.frame(maxHeight: 10)
                    
                    VStack(spacing: 16) {
                        HStack(spacing: 16) {
                            Text("13:00")
                                .font(.title3)
                                .bold()
                            
                            Image(systemName: "cloud.sun.rain.fill")
                                .renderingMode(.original)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: nil, height: 30, alignment: .center)
                            
                            Text("10 c")
                                .font(.headline)
                                .bold()
                                .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
                                .background(Color.green)
                                .cornerRadius(50)
                            Spacer()
                        }
                    }.groupStyle()
                }
            }
            .frame(
              minWidth: 0,
              maxWidth: .infinity,
              minHeight: 0,
              maxHeight: .infinity,
              alignment: .topLeading
            )
            .padding()
        })
        .foregroundColor(Color.white)
        .background(Color("colors.background"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension View {
    func groupStyle() -> some View {
        self.padding()
            .background(Color("colors.groupBg"))
            .cornerRadius(9.0)
    }
}
