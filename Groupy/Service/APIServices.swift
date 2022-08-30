
//
//  APIServices.swift
//  Groupy
//
//  Created by Develop on 09/08/2022.
//  Copyright © 2022 Develop. All rights reserved.
//

import Foundation
import Alamofire
import UIKit

class APIServices : UIViewController {
    static let shared = APIServices()
    
    //MARK: Multipart Post Request
    
    func postRequest<T:Codable>(url:String,parameter:[String:String],method:HTTPMethod?,headers:HTTPHeaders?,completion :@escaping (T?,Error?) ->()){
        AF.upload(multipartFormData: { multipartFormData in
            for (key,value) in parameter {
                multipartFormData.append(value.data(using: .utf8)!, withName:key )
                
                
                
            }
            //            multipartFormData.append(Data("sayed1@gmail.com".utf8), withName: "email")
            //            multipartFormData.append(Data("123456".utf8), withName: "password")
            //            multipartFormData.append(Data("".utf8), withName: "ip_address")
        }, to: Constants.Baseurl + url)
        .validate().responseJSON{ response in
            switch response.result {
            case .success( _ ) :
                // debugPrint(response.result)
                guard let jsonData = response.data else {return}
                do {
                    let user = try JSONDecoder().decode(T?.self, from: jsonData)
                    completion(user,nil)
                }
                catch let error{
                    completion(nil,error)
                    
                }
            case .failure(let error):
                completion(nil,error)
            }
            
        }
        
    }
    
    
    //MARK: - login Request
    
    //    func loginRequest<T:Codable>(url:String,email:String,password:String,idAddress:String,completion :@escaping (T?,Error?) ->()){
    //        AF.upload(multipartFormData: { multipartFormData in
    //            multipartFormData.append(Data(email.utf8), withName: "email")
    //            multipartFormData.append(Data(password.utf8), withName: "password")
    //            multipartFormData.append(Data(idAddress.utf8), withName: "ip_address")
    //        }, to: Constants.Baseurl + url)
    //        .validate().responseJSON{ response in
    //            switch response.result {
    //            case .success( _ ) :
    //                // debugPrint(response.result)
    //                guard let jsonData = response.data else {return}
    //                do {
    //                    let user = try JSONDecoder().decode(T?.self, from: jsonData)
    //                    completion(user,nil)
    //                }
    //                catch let error{
    //                    print(error)
    //                }
    //            case .failure(let error):
    //                completion(nil,error)
    //                print(error)
    //            }
    //
    //        }
    //    }
    
    //MARK: - Register Request
    
    func registerRequest(url:String,parameters:[String:String] , compeletion: @escaping (String?, Bool)->()) {
        AF.upload(multipartFormData: { multipartFormData in
            for (key,value) in parameters {
                multipartFormData.append(value.data(using: .utf8)!, withName: key)
            }
        }, to: Constants.Baseurl + url)
        .validate().responseJSON{ response in
            debugPrint(response.result)
            
            switch response.result {
                
            case .success(let response):
                guard let response = response as? String else {return}
                if response  == "1" {
                    print("تم إنشاء حسابكم بنجاح ✅ ")
                    compeletion("تم إنشاء حسابكم بنجاح ✅ " , true)
                }else if response  == "2" {
                    print("رقم الموبايل مستخدم بالفعل ⚠️")
                    compeletion("رقم الموبايل مستخدم بالفعل ⚠️",false)
                }else {
                    print(" ⚠️البريد الإلكتروني مستخدم بالفعل")
                    compeletion("البريد الإلكتروني مستخدم بالفعل ⚠️",false)
                    
                }
            case .failure(let error):
                print(error)
                compeletion(error.localizedDescription,false)
            }
        }
    }
    
    
    //MARK: - post request return message
    
    func postMSGRequest(url:String,parameters:[String:String] , compeletion: @escaping (String?)->()) {
        AF.upload(multipartFormData: { multipartFormData in
            for (key,value) in parameters {
                multipartFormData.append(value.data(using: .utf8)!, withName: key)
            }
        }, to: Constants.Baseurl + url)
        .validate().responseJSON{ response in
            debugPrint(response.result)
            
            switch response.result {
                
            case .success(let response):
                guard let response = response as? String else {return}
                compeletion(response)
            case .failure(let error):
                print(error)
                compeletion(error.localizedDescription)
            }
            
            
            
            
            
        }
    }
    
    
    
    
    func postListVideos(url:String,parameters:[String:String] , compeletion: @escaping ([VideoListsModel]? , Error?)->()) {
        AF.upload(multipartFormData: { multipartFormData in
            for (key,value) in parameters {
                multipartFormData.append(value.data(using: .utf8)!, withName: key)
            }
        }, to: Constants.Baseurl + url)
        .validate().responseJSON{ response in
            debugPrint("APIService Class Print", response.result)
            
            switch response.result {
                
            case .success(_ :):
                guard let response = response as? [VideoListsModel] else {return}
                //
                //                    guard let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "VideosLists") as? VideosLists else {return}
                compeletion(response,nil)
            case .failure(let error):
                print(error)
                compeletion(nil,error)
            }
            
        }
    }
}
