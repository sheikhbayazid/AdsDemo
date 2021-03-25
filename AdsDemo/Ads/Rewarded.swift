import SwiftUI
import GoogleMobileAds

final class Rewarded: NSObject, GADRewardedAdDelegate {
    var rewardedAd: GADRewardedAd = GADRewardedAd(adUnitID: "ca-app-pub-5930517905337542/8877029070") // your pub id and unit id. ca-app-pub-0000000000000000/0000000000
    
    var rewardFunction: (() -> Void)? = nil
    
    override init() {
        super.init()
        LoadRewarded()
    }
    
    func LoadRewarded(){
        let request = GADRequest()
        self.rewardedAd.load(request)
    }
    
    func showAd(rewardFunction: @escaping () -> Void) {
        if self.rewardedAd.isReady{
            self.rewardFunction = rewardFunction
            let root = UIApplication.shared.windows.first?.rootViewController
            self.rewardedAd.present(fromRootViewController: root!, delegate: self)
        } else {
            print("Reward ad is not ready!")
        }
    }
    
    func rewardedAd(_ rewardedAd: GADRewardedAd, userDidEarn reward: GADAdReward) {
        if let rf = rewardFunction {
            rf()
        }
    }
    
    func rewardedAdDidDismiss(_ rewardedAd: GADRewardedAd) {
        self.rewardedAd = GADRewardedAd(adUnitID: "ca-app-pub-5930517905337542/8877029070") // your pub id and unit id. ca-app-pub-0000000000000000/0000000000
        LoadRewarded()
    }
}


