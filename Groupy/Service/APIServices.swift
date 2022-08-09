
//
//  APIServices.swift
//  Groupy
//
//  Created by Develop on 09/08/2022.
//  Copyright © 2022 Develop. All rights reserved.
//

import Foundation
import Alamofire

class APIServices {
    static let shared = APIServices()
    
    //MARK: Multipart Post Request
    
    func postRequest<T:Codable>(url:String,parameter:[String:Any]?,method:HTTPMethod?,headers:HTTPHeaders?,completion :@escaping (T?,Error?) ->()){
        AF.upload(multipartFormData: { multipartFormData in
            multipartFormData.append(Data("sayed@gmail.com".utf8), withName: "email")
            multipartFormData.append(Data("123456".utf8), withName: "password")
            multipartFormData.append(Data("".utf8), withName: "ip_address")
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
                    print(error)
                }
            case .failure(let error):
                completion(nil,error)
            }
            
        }
        
    }
    
    
    //MARK: - login Request
    
    func loginRequest<T:Codable>(url:String,email:String,password:String,idAddress:String,completion :@escaping (T?,Error?) ->()){
        AF.upload(multipartFormData: { multipartFormData in
            multipartFormData.append(Data(email.utf8), withName: "email")
            multipartFormData.append(Data(password.utf8), withName: "password")
            multipartFormData.append(Data(idAddress.utf8), withName: "ip_address")
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
                    print(error)
                }
            case .failure(let error):
                completion(nil,error)
            }
            
        }
        
        
        
    }
    
    //MARK: - Register Request
    
    func registerRequest(url:String,email:String,name:String,password:String,phone:String,phase:String , compeletion: @escaping (String?)->()) {
        AF.upload(multipartFormData: { multipartFormData in
            multipartFormData.append(Data(email.utf8), withName: "email")
            multipartFormData.append(Data(password.utf8), withName: "password")
            multipartFormData.append(Data(name.utf8), withName: "name")
            multipartFormData.append(Data(phone.utf8), withName: "phone")
            multipartFormData.append(Data(phase.utf8), withName: "phase")
        }, to: Constants.Baseurl + url)
        .validate().responseJSON{ response in
            debugPrint(response.result)
            
            switch response.result {
                
            case .success(let response):
                guard let response = response as? String else {return}
                if response  == "1" {
                    print("Success")
                    compeletion("Successfully")
                }else if response  == "2" {
                    print("رقم الموبايل مستخدم بالفعل")
                    compeletion("رقم الموبايل مستخدم بالفعل")
                }else {
                    print("البريد الإلكتروني مستخدم بالفعل")
                    compeletion("البريد الإلكتروني مستخدم بالفعل")
                    
                }
            case .failure(let error):
                print(error)
            }
            
            
            
            
            
        }
    }
    
}
