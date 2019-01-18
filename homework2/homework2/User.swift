//
//  User.swift
//  homework2
//
//  Created by itisioslab on 26.09.2018.
//  Copyright © 2018 FirstGroupCompany. All rights reserved.
//

import UIKit

struct User {
    var name: String
    var surname: String
    var age: Int
    var status: String
    var mood: String
    var avatar: UIImage
    var date: String
    var familyStatus: String
    var languages: String
    var phone: String
    var city: String
    var companyName: String
    var position: String
    var university: String
    var faculty: String
    var timeInUni: Int
    var school: String
    let link: String = "www.vk.com"
}

let names = ["Владимир","Сергей", "Дмитрий", "Анатолий", "Артур", "Маша"]
let surnames = ["Алексеев", "Залялов", "Петров", "Морозов", "Поклонская"]
let ages = [12, 23, 5, 14, 59, 48, 3, 32, 30]
let cities = ["Москва", "Казань", "Набережные Челны", "Бугульма", "Нижнекамск"]
let statuses = ["online", "был в сети 5 минут назад", "был в сети 56 минут назад", "был в сети час назад"]
let avatars = [#imageLiteral(resourceName: "ava1"), #imageLiteral(resourceName: "ava2"),#imageLiteral(resourceName: "ava3")]
let phones = ["+79061235678", "+79625651896", "+34458248", "+795564123"]
let schools = ["Школа №1", "Школа №3", "Школа №2", "Школа №56"]
let dates = ["11.11.99", "11.1.92", "16.11.49", "21.5.79"]
let familyStutases = ["женат", "не женат", "в активном поиске"]
let languages = ["rus", "Eng", "Turkish", "Spanish"]
let companyNames = ["Flat", "Google", "Yandex", "Mail.ru"]
let positions = ["developer", "collector", "killer"]
let uni = ["Казанский Федеральный Универститет", "Московский Государственный Университет","ИТМО"]
let faculties = ["ВМК", "Юрфак","Физфак"]
let timeInUni = [12, 5, 2, 3]
let mood = ["Be happy", "smile))))"]
let asa = ["Trying to add in a background image that's randomly selected from an external array. The random function is working however it's not injecting the value into the background UIImage."," Hello Everyone. Hope you are having a nice day. Today I will show you how to implement simple Pull-to-Refresh in your tableview object.","Лента новостей:Лента новостей состоит из кастомной ячейки с аватором, названием, датой поста, картинкой, текстом над картинкой, и кнопками для лайка, комментария, шаринга с числами соотвественно для каждого (кроме последнего).","Общайтесь с комфортом в любое время суток — стильное тёмное оформление будет оберегать Ваше зрение. Чтобы сменить тему, нажмите на пункт «Внешний вид» в настройках приложения.","PRIVET KAK DELA , DA ETO YA - PUSTAYA NOVOST'"]

func getRandomUser() -> User {
    
    return User.init(
        name: names[Int(arc4random_uniform(UInt32(names.count)))],
        surname: surnames[Int(arc4random_uniform(UInt32(surnames.count)))],
        age: ages[Int(arc4random_uniform(UInt32(ages.count)))],
        status: statuses[Int(arc4random_uniform(UInt32(statuses.count)))],
        mood:mood[Int(arc4random_uniform(UInt32(mood.count)))],
        avatar:avatars[Int(arc4random_uniform(UInt32(avatars.count)))],
        date: dates[Int(arc4random_uniform(UInt32(dates.count)))],
        familyStatus: familyStutases[Int(arc4random_uniform(UInt32(familyStutases.count)))],
        languages: languages[Int(arc4random_uniform(UInt32(languages.count)))],
        phone: phones[Int(arc4random_uniform(UInt32(phones.count)))],
        city: cities[Int(arc4random_uniform(UInt32(cities.count)))],
        companyName: companyNames[Int(arc4random_uniform(UInt32(companyNames.count)))],
        position: positions[Int(arc4random_uniform(UInt32(positions.count)))],
        university: uni[Int(arc4random_uniform(UInt32(uni.count)))],
        faculty: faculties[Int(arc4random_uniform(UInt32(faculties.count)))],
        timeInUni: timeInUni[Int(arc4random_uniform(UInt32(timeInUni.count)))],
        school: schools[Int(arc4random_uniform(UInt32(schools.count)))]
    )
}


