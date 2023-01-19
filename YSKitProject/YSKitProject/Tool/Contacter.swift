//
//  Contacter.swift
//  YSKitProject
//
//  Created by 姚帅 on 2023/1/19.
//

class Contacter{
    
    class func phone(_ phone: String?){
        guard let p = phone else {
            Printer.print("请检查电话号码是否正确")
            return
        }
        guard let url = Ctor.url(string: "tel:\(p)")else {
            Printer.print("请检查电话号码是否正确")
            return
        }
        if !UIApplication.shared.canOpenURL(url){
            Printer.print("请检查电话号码是否正确")
            return
        }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
}
