//
//  UserApi.swift
//  Salam
//
//  Created by Husen Abughosh on 06/02/2022.
//

import Foundation
import FirebaseAuth
import Firebase
import FirebaseStorage
import ProgressHUD


class UserApi {
    
    
    // to sign IN method :
    func sigIn( email:  String, password: String, onSuccess: @escaping() -> Void, onError:  @escaping(_ errorMessage: String) -> Void){
        
        Auth.auth().signIn(withEmail: email, password: password) { authData , error in
            if error != nil {
                onError(error!.localizedDescription)
                return
            }
            print(authData?.user.uid)
            onSuccess()
        }

    }
    
    
    // to sign UP method :
    func  SignUp(withUserName username: String,  email:  String, password: String, image: UIImage?, onSuccess: @escaping() -> Void, onError:  @escaping(_ errorMessage: String) -> Void) {
   
        // to create user:
        Auth.auth().createUser(withEmail: email, password: password) { authDataResult, error in
            if error != nil {
 
                ProgressHUD.showError(error!.localizedDescription)
                return
                 
            }
            
            if let authData = authDataResult {
                
                var dict: Dictionary<String,Any> = [
                  
                   UID: authData.user.uid,
                   EMAIL: authData.user.email,
                   USERNAME: username,
                   PASSWORD: password,
                   PROFILE_IMAGE_URL: "",
                   STATUS: "Welcome to Salam"
        
                ]
                
                
                
                guard  let  imageSelected = image else {
                
                    ProgressHUD.showError("please choose your p rofile image")
                    return
                }
                
                guard let imageData = imageSelected.jpegData(compressionQuality: 0.4) else {return}
                
                 
                let storageProfile = Ref().storageSpecificProfile(uid: authData.user.uid )
                
                let metaData =  StorageMetadata()
                metaData.contentType =  "image/jpg"
                
                StorageService.SavePhoto(username: username, uid: authData.user.uid, data: imageData, metaData: metaData, storageProfileRef: storageProfile, dict: dict) {
                    onSuccess()
                } onError: { errorMessage in
                    onError(errorMessage)
                }

                
            }
        }
    }
    
    
    
    // to rest password mwthod
    func restPassword(email: String, onSuccess: @escaping() -> Void, onError:  @escaping(_ errorMessage: String) -> Void) {
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            if error == nil {
                onSuccess()
            }else{
                onError(error!.localizedDescription)
            }
        }
        
    }
    
    
    // logoutMethod:
    func logout() {
        do {
            try Auth.auth().signOut()
        }catch {
            ProgressHUD.showError(error.localizedDescription)
            return
        }
        (UIApplication.shared.delegate as! AppDelegate).configureIntialViewController()
  
    }
    
    
    func observeUsers(onSuccess: @escaping(UserCompletion)) {
        
        Ref().databaseUsers.observe(.childAdded) { snapshot in
            if let dict = snapshot.value as? Dictionary<String, Any> {
                if let user = User.transformUser(dict: dict){
                onSuccess(user)
                }
                
            }
        }
    }
    
    
}


typealias UserCompletion = (User) -> Void
