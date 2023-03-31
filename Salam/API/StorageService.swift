//
//  StorageServvice.swift
//  Salam
//
//  Created by Husen Abughosh on 06/02/2022.
//

import Foundation
import FirebaseStorage
import FirebaseDatabase
import FirebaseAuth
import ProgressHUD


class StorageService  {
    
    static func SavePhoto(username: String, uid: String, data: Data, metaData: StorageMetadata, storageProfileRef:  StorageReference, dict: Dictionary<String, Any> , onSuccess: @escaping() -> Void, onError:  @escaping(_ errorMessage: String) -> Void) {
        
        
        storageProfileRef.putData(data , metadata: metaData) { storageMetadata, error in
            if  error  != nil {
                onError(error!.localizedDescription )
                return
            }
            
            storageProfileRef.downloadURL { url, error in
                if let metaImageUrl = url?.absoluteString {
                    
                    if let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest() {
                        changeRequest.photoURL = url
                        changeRequest.displayName = username
                        changeRequest.commitChanges { error in
                            if let error = error {
                                ProgressHUD.showError(error.localizedDescription)
                            }
                        }
                    }
                    
                    
                    var dictTemp = dict
                    dictTemp [PROFILE_IMAGE_URL]  = metaImageUrl
                    
                    
                    Ref().databaseSpecificUsers(uid: uid).updateChildValues(dictTemp) { error, ref in
                            if error == nil {
                                onSuccess()
                            }else{
                                onError(error!.localizedDescription )
                            }
                        }
                }
            }
        }
        
        
        
        
        
        
    }
    
    
    
    
}
