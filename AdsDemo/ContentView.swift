//
//  ContentView.swift
//  AdsDemo
//
//  Created by Sheikh Bayazid on 8/9/20.
//  Copyright © 2020 Sheikh Bayazid. All rights reserved.
//

import SwiftUI
import GoogleMobileAds


//Admob Google: sheikhbayazid@gmail.com
struct ContentView: View {
    var interstitial: Interstitial
    var rewardAd: Rewarded
    
    @Environment(\.colorScheme) var colorScheme
    
    var bgColor: Color {
        return colorScheme == .dark ? .white : .black
    }
    
    var fontColor: Color {
        return colorScheme == .dark ? .black : .white
    }
    
    @State private var isRewarded = false
    
    init(){
        self.interstitial = Interstitial()
        self.rewardAd = Rewarded()
    }
    
    var body : some View{
        NavigationView {
            VStack(spacing: 30) {
                Spacer()
                
                VStack {
                    BannerAd().frame(width: 320, height: 50, alignment: .top).padding()
                }.frame(maxWidth: .infinity, maxHeight: 80)
                .background(Color.gray.opacity(0.5))
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .padding(.horizontal, 10)
                
                
                VStack(spacing: 20) {
                    Button(action: {
                        self.interstitial.showAd()
                        
                    }) {
                        Text("Interstitial")
                            .foregroundColor(fontColor)
                            .frame(width: 120, height: 45)
                            .background(bgColor.opacity(0.9))
                            .clipShape(Capsule())
                    }
                    
                    Button(action:{
                        self.rewardAd.showAd {
                            // reward requirement fulfilled
                            self.isRewarded = true
                            print("Give Rewards")
                        }
                        
                    }) {
                        Text("Reward")
                            .foregroundColor(fontColor)
                            .frame(width: 120, height: 45)
                            .background(bgColor.opacity(0.9))
                            .clipShape(Capsule())
                    }
                }
                
                if isRewarded {
                    Button(action: {
                        withAnimation(.easeInOut) {
                            self.isRewarded.toggle()
                        }
                    }, label: {
                        Text("Reward is given 🎉")
                            .font(.system(size: 15))
                            .foregroundColor(.green)
                            .frame(width: 155, height: 50)
                            .background(Color.black.opacity(0.5))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .padding(.vertical).padding(.vertical)
                    })
                }
                
                Spacer()
                
            }.frame(height: 550)
            .background(Color.gray.opacity(0.25))
            .clipShape(RoundedRectangle(cornerRadius: 20))
            
            .navigationTitle("Google Ads")
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}

