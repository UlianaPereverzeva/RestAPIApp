//
//  NetworkService.swift
//  RestAPIApp
//
//  Created by ульяна on 3.01.23.
//

import Alamofire
import SwiftyJSON
import UIKit
import AlamofireImage


class NetworkService {
    
    static func deleteComment(commentID: Int, callBack: @escaping (_ result: JSON?, _ error: Error?) -> Void) {
        
        let url = ApiConstans.commentsPath + "/" + "\(commentID)"
        
        AF.request(url, method: .delete, parameters: nil, encoding: JSONEncoding.default, headers: nil).response { response in
            
            var jsonValue: JSON?
            var err: Error?
            
            switch response.result {
            case.success(let data):
                guard let data = data else { return }
                jsonValue = JSON(data)
            case.failure(let error):
                err = error
            }
            callBack(jsonValue, err)
        }
    }
    
    static func deletePost(postID: Int, callBack: @escaping (_ result: JSON?, _ error: Error?) -> Void) {
        
        let url = ApiConstans.postsPath + "/" + "\(postID)"
        
        AF.request(url, method: .delete, parameters: nil, encoding: JSONEncoding.default, headers: nil).response { response in
            
            var jsonValue: JSON?
            var err: Error?
            
            switch response.result {
            case.success(let data):
                guard let data = data else { return }
                jsonValue = JSON(data)
            case.failure(let error):
                err = error
            }
            callBack(jsonValue, err)
        }
    }
    
    static func fetchAlboms(userID: Int, callBack: @escaping (_ result: [JSON]?, _ error: Error?) -> Void) {
        
        let url = "\(ApiConstans.albumsPath)?userId=\(userID)"
        
        AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).response { response in
            
            var jsonValue: [JSON]?
            var err: Error?
            
            switch response.result {
            case.success(let data):
                guard let data = data else { return }
                jsonValue = JSON(data).arrayValue
            case.failure(let error):
                err = error
            }
            callBack(jsonValue, err)
        }
    }
    
    static func fetchPhotos(albomID: Int, callBack: @escaping (_ result: [JSON]?, _ error: Error?) -> Void) {
        
        let url = "\(ApiConstans.photosPath)?albumId=\(albomID)"
        
        AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).response { response in
            
            var jsonValue: [JSON]?
            var err: Error?
            
            switch response.result {
            case.success(let data):
                guard let data = data else { return }
                jsonValue = JSON(data).arrayValue
            case.failure(let error):
                err = error
            }
            callBack(jsonValue, err)
        }
    }
    
    static func getPhoto(imageURL: String, callBack: @escaping (_ result: UIImage?, _ error: Error?) -> Void) {
        if let image = CacheManager.shared.imageCache.image(withIdentifier: imageURL) {
            callBack(image,nil)
        } else {
            AF.request(imageURL).responseImage { response in
                if case .success(let image) = response.result {
                    CacheManager.shared.imageCache.add(image, withIdentifier: imageURL)
                    callBack(image,nil)
                }
            }
        }
    }
    
    
    static func getLocation(userID: Int, callBack: @escaping (_ result: JSON?, _ error: Error?) -> Void) {
//        let addressLat = User.address?.geo?.lat
//        let addresslng = User.address?.geo?.lng
//        let url = ApiConstans.a
    }
}
