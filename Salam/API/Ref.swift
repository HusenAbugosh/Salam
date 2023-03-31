//
//  Ref.swift
//  Salam
//
//  Created by Husen Abughosh on 06/02/2022.
//

import Foundation
import Firebase



let REF_USER = "users"
let URL_STORAGE_ROOT =  "gs://sallam-e9c2b.appspot.com"
let STORAGE_PROFILE = "profile"
let PROFILE_IMAGE_URL = "profileImageUrl"
let UID = "uid"
let EMAIL = "email"
let USERNAME = "username"
let PASSWORD = "password"
let STATUS = "status"


let IDENTIFIRE_CELL_USERS = "userCell"

 

class Ref {
    
    let databaseRoot: DatabaseReference = Database.database().reference()
    
    
    var databaseUsers: DatabaseReference{
        return databaseRoot.child(REF_USER)
    }
    
    func databaseSpecificUsers(uid: String) -> DatabaseReference {
        return databaseUsers.child(uid)
    }
    
    
    // Storage Ref:
    
    let storageRoot = Storage.storage().reference(forURL: URL_STORAGE_ROOT)
    
    var storageProfile: StorageReference {
    return storageRoot.child (STORAGE_PROFILE)
    }


    func storageSpecificProfile(uid: String) -> StorageReference {
        return storageProfile.child(uid)
    }

    
    
}
