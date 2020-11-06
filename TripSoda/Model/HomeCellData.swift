//
//  HomeCellData.swift
//  TripSoda
//
//  Created by sangheon on 2020/11/07.
//

import Foundation

struct HomeCellData:Codable {
    let tourTitle:String
    let tourTime:Int
    let remainingTime:String
    let spareTime:Int
    let tourImage:String
}
