import UIKit
import Flutter

@main
@objc class AppDelegate: FlutterAppDelegate {
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        let controller: FlutterViewController = window?.rootViewController as! FlutterViewController
        let methodChannel = FlutterMethodChannel(name: "com.native.channel", binaryMessenger: controller.binaryMessenger)

        methodChannel.setMethodCallHandler { (call: FlutterMethodCall, result: @escaping FlutterResult) in
            if call.method == "getSum" {
                // Extract the double values
                if let args = call.arguments as? [String: Any],
                   let num1 = args["num1"] as? Double,
                   let num2 = args["num2"] as? Double {
                    // Calculate the sum
                    let sum = num1 + num2


                    result(sum)
                } else {
                    result(FlutterError(code: "ERROR", message: "Invalid arguments", details: nil))
                }
            }else if call.method == "getName" {
                if let args = call.arguments as? [String: Any],
                   let name = args["name"] as? String {
                    result(name)
                }else {
                     result(FlutterError(code: "ERROR", message: "Invalid arguments", details: nil))
                }

            }
             else {
                result(FlutterMethodNotImplemented)
            }
        }

        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
}