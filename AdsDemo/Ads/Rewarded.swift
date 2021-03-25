import SwiftUI
import GoogleMobileAds
import UIKit

final class Rewarded: NSObject, GADRewardedAdDelegate{
    
    var rewardedAd:GADRewardedAd = GADRewardedAd(adUnitID: "ca-app-pub-3940256099942544/1712485313")
    
    var rewardFunction: (() -> Void)? = nil
    
    override init() {
        super.init()
        LoadRewarded()
    }
    
    func LoadRewarded(){
        let request = GADRequest()
        self.rewardedAd.load(request)
    }
    
    func showAd(rewardFunction: @escaping () -> Void){
        if self.rewardedAd.isReady{
            self.rewardFunction = rewardFunction
            let root = UIApplication.shared.windows.first?.rootViewController
            self.rewardedAd.present(fromRootViewController: root!, delegate: self)
        }
        else{
            print("Not Ready")
        }
    }
    
    func rewardedAd(_ rewardedAd: GADRewardedAd, userDidEarn reward: GADAdReward) {
        if let rf = rewardFunction {
            rf()
        }
    }
    
    func rewardedAdDidDismiss(_ rewardedAd: GADRewardedAd) {
        self.rewardedAd = GADRewardedAd(adUnitID: "ca-app-pub-3940256099942544/1712485313")
        LoadRewarded()
    }
}


