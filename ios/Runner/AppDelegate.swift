import Flutter
import UIKit
import GoogleMaps 

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    GMSServices.provideAPIKey("YOUR_API_KEYAIzaSyCOMKT4FNrYXtAE1fndD5nlfdRJOJL1lJ4")
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
