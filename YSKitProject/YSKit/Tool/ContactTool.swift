//
//  ContactTool.swift
//  YSKit
//
//  Created by 姚帅 on 2023/1/20.
//

public class ContactTool{
    
    public class func phone(_ phone: String?) -> (Bool, String?){
        guard let p = phone, let url = URL(string: "tel:\(p)") else {
            return (false, "请检查电话号码是否正确")
        }
        if !UIApplication.shared.canOpenURL(url){
            return (false, "请检查电话号码是否正确")
        }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
        return (true, nil)
    }
}
