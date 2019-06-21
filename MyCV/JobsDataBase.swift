//
//  JobsDataBase.swift
//  MyCV
//
//  Created by Aleksandar Sajatovic on 6/18/19.
//  Copyright © 2019 Aleksandar Sajatovic. All rights reserved.
//

import Foundation


struct PersonalInformations {
    
    static let birthDay = "Aleksandar Šajatović was born on June 19th, 1985 year in Novi Sad"
    static let elementarySchool = "He finished elementary school \"Jovan Jovanović Zmaj\" in Sremska Kamenica"
    static let highSchool = "And after that Electrotechnical high school \"Mihajlo Pupin\" in Novi Sad"
    static let faculty = "Aleksandar has finished the Faculty of Sport and Physical Education at Novi Sad's University, with a specialization in Sport Management."
    
    static let motivation = [
        "Aleksandar is a highly motivated developer who is very passionate about his work.",
        "He tries to learn every day so he can convert ideas into new products.",
        "He is driven with enthusiasm and ambition to get better in his work on a daily bases.",
        "Aleksandar founded inspiration in building applications on iOS devices and fall in love with the concept and idea behind it.",
        "His work is his engine and fuel.",
    ]
    
    private let jobPosition = [
        2019:"Sport Manager",
        2018:"Sport Manager",
        2017:"Sport Manager",
        2016:"Lead Instructor",
        2015:"Lead Instructor",
        2014:"Instructor",
        2013:"Instructor",
        2012:"Instructor",
        2011:"Rope Access Worker",
        2010:"Rope Access Worker",
        2009:"Rope Access Worker",
        2008:"Rope Access Worker",
        2007:"Rope Access Worker",
    ]
    private let employer = [
        2019:"\"Adrenalin\" climbing club.",
        2018:"\"Adrenalin\" climbing club.",
        2017:"\"Adrenalin\" climbing club.",
        2016:"\"Adrenalin\" climbing club.",
        2015:"\"Adrenalin\" climbing club.",
        2014:"\"Adrenalin\" climbing club.",
        2013:"\"Adrenalin\" climbing club.",
        2012:"\"Adrenalin\" climbing club.",
        2011:"Freelace",
        2010:"Freelace",
        2009:"Freelace",
        2008:"Freelace",
        2007:"Freelace",
    ]
    
    func getJobPosition(atYear year:Int) -> String {
        
        if let position = jobPosition[year] {
            return "\(year): \(position)"
        }
        return "NO Jobs for that year"
    }
    func getEmployer(atYear year:Int) -> String {
        
        if let employer = employer[year] {
            return "at \(employer)"
        }
        return "NO Employers for \(year)"
    }
    
    func count() -> Int {
        return jobPosition.count
    }
}
