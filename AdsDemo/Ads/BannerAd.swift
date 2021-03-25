import SwiftUI
import GoogleMobileAds
import UIKit

struct BannerAd: UIViewControllerRepresentable  {
    
    func makeUIViewController(context: Context) -> UIViewController {
        let view = GADBannerView(adSize: kGADAdSizeBanner)
        
        let viewController = UIViewController()
        view.adUnitID = "ca-app-pub-5930517905337542/5734689242"    // your pub id and unit id
        view.rootViewController = viewController
        viewController.view.addSubview(view)
        viewController.view.frame = CGRect(origin: .zero, size: kGADAdSizeBanner.size)
        view.load(GADRequest())
        
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}


struct BannerAd_Previews: PreviewProvider {
    static var previews: some View {
        BannerAd()
    }
}
