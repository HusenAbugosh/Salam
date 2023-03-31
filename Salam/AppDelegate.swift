//
//  AppDelegate.swift
//  Salam
//
//  Created by Husen Abughosh on 23/12/2021.
//


import UIKit
import Firebase



@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    
    var window: UIWindow?



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        FirebaseApp.configure()
        configureIntialViewController()
   
        return true
    }
    
    
    
    
    
    func configureIntialViewController() {
        
        
        var initialVC: UIViewController
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if Auth.auth().currentUser != nil {
            
            initialVC = storyboard.instantiateViewController(withIdentifier: "TapBarVC")
        }else{
            initialVC = storyboard.instantiateViewController(withIdentifier: "WelcomeVC")
        }
        
        window?.rootViewController = initialVC
        window?.makeKeyAndVisible()
        

    }



}

