import SwiftUI
import GoogleMobileAds

final class Interstitial: NSObject, GADInterstitialDelegate {
    var interstitial:GADInterstitial = GADInterstitial(adUnitID: "ca-app-pub-5930517905337542/3651239662") // your pub id and unit id.
    
    override init() {
        super.init()
        LoadInterstitial()
    }
    
    func LoadInterstitial() {
        let request = GADRequest()
        self.interstitial.load(request)
        self.interstitial.delegate = self
    }
    
    func showAd() {
        if self.interstitial.isReady{
            let root = UIApplication.shared.windows.first?.rootViewController
            self.interstitial.present(fromRootViewController: root!)
        } else {
            print("Interstitial ad is not ready!")
        }
    }
    
    func interstitialDidDismissScreen(_ ad: GADInterstitial) {
        self.interstitial = GADInterstitial(adUnitID: "ca-app-pub-5930517905337542/3651239662") //// your pub id and unit id.
        LoadInterstitial()
    }
}

