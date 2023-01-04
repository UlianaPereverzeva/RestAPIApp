//
//  NetworkService.swift
//  RestAPIApp
//
//  Created by ульяна on 3.01.23.
//

import Foundation
import Alamofire
import SwiftyJSON


class NetworkService {
    
    static func deleteComment(commentID: Int, callBack: @escaping (_ result: JSON?, _ error: Error?) -> Void) {
        
        let url = ApiConstans.commentsPath + "/" + "\(commentID)"
        
        AF.request(url, method: .delete, parameters: nil, encoding: JSONEncoding.default, headers: nil).response { response in
            
            var jsonValue: JSON?
            var err: Error?
            
            switch response.result {
            case.success(let data):
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
                jsonValue = JSON(data)
            case.failure(let error):
                err = error
            }
            callBack(jsonValue, err)
        }
    }
    
    static func fetchAlboms(userID: Int, callBack: @escaping (_ result: [JSON]?, _ error: Error?) -> Void) {
        
        let url = "\(ApiConstans.albumsPath)?userId=\(userID)"
        
        AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { response in
            
            var jsonValue: [JSON]?
            var err: Error?
            
            switch response.result {
            case.success(let data):
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
                jsonValue = JSON(data).arrayValue
            case.failure(let error):
                err = error
            }
            callBack(jsonValue, err)
            
        }
    }
}
