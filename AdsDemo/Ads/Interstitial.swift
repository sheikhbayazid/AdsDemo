import SwiftUI
import GoogleMobileAds
import UIKit

final class Interstitial:NSObject, GADInterstitialDelegate{
    var interstitial:GADInterstitial = GADInterstitial(adUnitID: "ca-app-pub-3940256099942544/4411468910")
    
    override init() {
        super.init()
        LoadInterstitial()
    }
    
    func LoadInterstitial(){
        let request = GADRequest()
        self.interstitial.load(request)
        self.interstitial.delegate = self
    }
    
    func showAd(){
        if self.interstitial.isReady{
            let root = UIApplication.shared.windows.first?.rootViewController
            self.interstitial.present(fromRootViewController: root!)
        }
        else{
            print("Not Ready")
        }
    }
    
    func interstitialDidDismissScreen(_ ad: GADInterstitial) {
        self.interstitial = GADInterstitial(adUnitID: "ca-app-pub-3940256099942544/4411468910")
        LoadInterstitial()
    }
}

