//
//  ApiConstans.swift
//  RestAPIApp
//
//  Created by ульяна on 29.12.22.
//

import Foundation

class ApiConstans {
    
    static let serverPath = "http://localhost:3000/"
    
    static let postsPath = serverPath + "posts"
    static let postsPathURL = URL(string: postsPath)
    
//    static let adressPath = serverPath + "address"
//    static let adressPathURL = URL(string: geoPath)
    
    static let commentsPath = serverPath + "comments"
    static let commentsPathURL = URL(string: commentsPath)
    
    static let albumsPath = serverPath + "albums"
    static let albumsPathURL = URL(string: albumsPath)
    
    static let photosPath = serverPath + "photos"
    static let photosPathURL = URL(string: photosPath)
    
    
}
