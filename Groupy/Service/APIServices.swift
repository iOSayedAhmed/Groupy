
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
//import XCTest

enum CustomError:Error {
    case NoData
    case BadURL
    case DecodingError
    case emailInvalid
    
}


class APIServices : UIViewController {
    static let shared = APIServices()
    //MARK: Multipart Post Request
    
    func postRequest<T:Codable>(url:String,parameter:[String:String],method:HTTPMethod?,headers:HTTPHeaders?,completion :@escaping (T?,Error?) ->()){
        AF.upload(multipartFormData: { multipartFormData in
            for (key,value) in parameter {
                multipartFormData.append(value.data(using: .utf8)!, withName:key )
            }
            
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
    
    func postMSGRequest(url:String,parameters:[String:String],compeletion: @escaping (String?)->()) {
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
                compeletion(response,nil)
            case .failure(let error):
                print(error)
                compeletion(nil,error)
            }
            
        }
    }
}




extension APIServices {
    func  postRequst(email:String, code:String , completion : @escaping (Any) -> ()){
             let params = [
                "code":code,
                   "email":email
               ]
        AF.request("https://eduelmester.site/elmester/student/send_code.php", method: .post, parameters: params, encoding: URLEncoding.default).responseJSON { response in
            switch response.result {
            case .success(let message):
                if message as! String == "emailSent" {
                    completion("success")
                }else {
                    completion(message)
                }
                completion(response.value)
            case .failure(let error):
                completion(error)
                print("error",error)
            }
        }

    }
}



//MARK: - Confirm SOLID
class Network {
    static let shared = Network()
    let aPIHandler = APIHandler()
    let responseHandler = ResponseHandler()
    
    
    func APIRequest<T:Codable>(type:T.Type ,parameters:[String:String],method:HTTPMethod?,headers:HTTPHeaders?, completion :@escaping (Result<T,CustomError >) ->()){
        guard let url = Constants.loginURL else {
            return completion(.failure(.BadURL))
        }
        
        aPIHandler.aPIHandler(url: url, parameter: parameters , method: method, headers: headers) { results in
            switch results {
            case.success(let data):
                self.responseHandler.responseHandler(type: type, data: data) { decodedResult in
                    switch decodedResult {
                    case.success(let model ):
                        completion(.success(model))
                    case.failure(let error ):
                        completion(.failure(error))
                    }
                }
            case.failure(let error):
                print(error)
                completion(.failure(error))
                
            }
        }
        
    }
}

    
    class APIHandler {
        func aPIHandler(url:URL,parameter:[String:String],method:HTTPMethod?,headers:HTTPHeaders?,completion :@escaping (Result<Data,CustomError>) ->()){
            AF.upload(multipartFormData: { multipartFormData in
                for (key,value) in parameter {
                    multipartFormData.append(value.data(using: .utf8)!, withName:key )
                }
            }, to: url)
            .validate().responseJSON{ response in
                guard let data = response.data else {
                    return completion(.failure(.NoData))
                }
                completion(.success(data))
            }
            
        }
    }
    
    class ResponseHandler {
        func responseHandler<T:Codable>(type:T.Type,data:Data,completion :@escaping (Result<T,CustomError >) ->()){
            let data = try?  JSONDecoder().decode(type.self, from: data)
            if let responseData = data {
                return completion(.success(responseData))
            }else {
                return completion(.failure(.DecodingError))
            }
             
            }
    }
    
