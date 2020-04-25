//
//  SceneDelegate.swift
//  FavouriteThings
//
//  Created by Sadeed Ahmed  on 22/4/20.
//  Copyright © 2020 Sadeed Ahmad. All rights reserved.
//

import UIKit
import SwiftUI

let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
let documentFolderURL = urls.first!
let fileURL = documentFolderURL.appendingPathComponent("FavouriteThinngsFile.json")//(dataFileName)


class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var thingsList = ThingsList()
    
    //var faveArray: FaveCatalogViewModel = FaveCatalogViewModel()
    
    //let dataFileName = "FavouriteThinngsFile.txt"
    

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        
        //var thingsArray: ThingsList = ThingsList()
        
        do {
        let t = try Data(contentsOf: fileURL)
        let decoder = JSONDecoder()
        let decodedModel = try decoder.decode(ThingsList.self, from: t)
        print(decodedModel.things.first?.name ?? "No proddsdss")
        thingsList = decodedModel
        
        }
        catch {
            print("Unable to write File \(fileURL.path) \(error)")
        }
        
        
//        print("App Starting")
//
//        do {
//            let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
//            let documentFolderURL = urls.first!
//            let fileURL = documentFolderURL.appendingPathComponent("FavouriteThinngsFile.json")//(dataFileName)
//            let json = JSONEncoder()
//            let data = try json.encode(thingsList)
//            try data.write(to: fileURL)
//
//            let t = try Data(contentsOf: fileURL)
//            let decoder = JSONDecoder()
//            let thingsArray = try decoder.decode(Things.self, from: t)
//
//
//        } catch {
//          print("Application has Got \(error)")
//        }


        

        // Get the managed object context from the shared persistent container
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

        // Create the SwiftUI view and set the context as the value for the managedObjectContext environment keyPath
        
        //let contentView = ContentView(groundList: ThingsList)
        let contentView = ContentView(groundList: thingsList).environment(\.managedObjectContext, context)

        // Use a UIHostingController as window root view controller.
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: contentView)
            self.window = window
            window.makeKeyAndVisible()
        }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.

        // Save changes in the application's managed object context when the application transitions to the background.
        
        
        do {
            
            let json = JSONEncoder()
            let data = try json.encode(thingsList)
            try data.write(to: fileURL)
            
            print("Successfully wrote file \(fileURL.path)")
            
        } catch {
            print("Unable to write File \(fileURL.path) \(error)")
        }
        
        
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }


}

