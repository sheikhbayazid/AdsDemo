//
//  ContentView.swift
//  AdsDemo
//
//  Created by Sheikh Bayazid on 8/9/20.
//  Copyright © 2020 Sheikh Bayazid. All rights reserved.
//

import SwiftUI
import GoogleMobileAds


struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var isRewarded = false
    
    var interstitial: Interstitial
    var rewardAd: Rewarded
    let screen = UIScreen.main.bounds.size
    
    var bgColor: Color {
        return colorScheme == .dark ? .white : .black
    }
    
    var fontColor: Color {
        return colorScheme == .dark ? .black : .white
    }
    
    
    init() {
        self.interstitial = Interstitial()
        self.rewardAd = Rewarded()
    }
    
    var body : some View{
        NavigationView {
            VStack(spacing: 30) {
                Spacer()
                
                //MARK: - Banner Ad
                VStack {
                    BannerAd().frame(width: 320, height: 50, alignment: .top).padding()
                }.frame(maxWidth: screen.width - 50, maxHeight: 80)
                .background(Color.gray.opacity(0.5))
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                
                VStack(spacing: 20) {
                    //MARK: - Interstitial Ad Button
                    Button(action: {
                        self.interstitial.showAd()
                        
                    }) {
                        Text("Interstitial")
                            .foregroundColor(fontColor)
                            .frame(width: 120, height: 45)
                            .background(bgColor.opacity(0.9))
                            .clipShape(Capsule())
                    }
                    
                    //MARK: - Reward Ad Button
                    Button(action:{
                        self.rewardAd.showAd {
                            // reward requirement fulfilled, give rewards
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
                
                //MARK: - Rewarded Text
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
                
            }.frame(width: screen.width - 30, height: 550)
            .background(Color.gray.opacity(0.25))
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .padding(.vertical)
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

