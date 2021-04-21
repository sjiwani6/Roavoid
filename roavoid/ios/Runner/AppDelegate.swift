import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)

    //TODO: Insert API Key here!
    //GMSServices.provideAPIKey("YOUR API KEY HERE")

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
