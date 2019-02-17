//
//  Model.swift
//  tableViewDisplayingJSON
//
//  Created by West Kraemer on 2/16/19.
//  Copyright © 2019 West Kraemer. All rights reserved.
//

import Foundation



struct Alert : Codable {
    
    let descriptionField : String?
    let expires : Int?
    let regions : [String]?
    let severity : String?
    let time : Int?
    let title : String?
    let uri : String?
    
    enum CodingKeys: String, CodingKey {
        case descriptionField = "description"
        case expires = "expires"
        case regions = "regions"
        case severity = "severity"
        case time = "time"
        case title = "title"
        case uri = "uri"
    }
}

struct Currently : Codable {
    
    let apparentTemperature : Float?
    let cloudCover : Float?
    let dewPoint : Float?
    let humidity : Float?
    let icon : String?
    let nearestStormDistance : Int?
    let ozone : Float?
    let precipIntensity : Int?
    let precipProbability : Int?
    let pressure : Float?
    let summary : String?
    let temperature : Float?
    let time : Int?
    let uvIndex : Int?
    let visibility : Float?
    let windBearing : Int?
    let windGust : Float?
    let windSpeed : Float?
    
    enum CodingKeys: String, CodingKey {
        case apparentTemperature = "apparentTemperature"
        case cloudCover = "cloudCover"
        case dewPoint = "dewPoint"
        case humidity = "humidity"
        case icon = "icon"
        case nearestStormDistance = "nearestStormDistance"
        case ozone = "ozone"
        case precipIntensity = "precipIntensity"
        case precipProbability = "precipProbability"
        case pressure = "pressure"
        case summary = "summary"
        case temperature = "temperature"
        case time = "time"
        case uvIndex = "uvIndex"
        case visibility = "visibility"
        case windBearing = "windBearing"
        case windGust = "windGust"
        case windSpeed = "windSpeed"
    }
}

struct Daily : Codable {
    
    let data : [Data]?
    let icon : String?
    let summary : String?
    
    enum CodingKeys: String, CodingKey {
        case data = "data"
        case icon = "icon"
        case summary = "summary"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        data = try values.decodeIfPresent([Data].self, forKey: .data)
        icon = try values.decodeIfPresent(String.self, forKey: .icon)
        summary = try values.decodeIfPresent(String.self, forKey: .summary)
    }
    
}

struct Flag : Codable {
    
    let nearestStation : Float?
    let sources : [String]?
    let units : String?
    
    enum CodingKeys: String, CodingKey {
        case nearestStation = "nearest-station"
        case sources = "sources"
        case units = "units"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        nearestStation = try values.decodeIfPresent(Float.self, forKey: .nearestStation)
        sources = try values.decodeIfPresent([String].self, forKey: .sources)
        units = try values.decodeIfPresent(String.self, forKey: .units)
    }
    
}

struct Hourly : Codable {
    
    let data : [Data]?
    let icon : String?
    let summary : String?
    
    enum CodingKeys: String, CodingKey {
        case data = "data"
        case icon = "icon"
        case summary = "summary"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        data = try values.decodeIfPresent([Data].self, forKey: .data)
        icon = try values.decodeIfPresent(String.self, forKey: .icon)
        summary = try values.decodeIfPresent(String.self, forKey: .summary)
    }
    
}

struct Minutely : Codable {
    
    let data : [Data]?
    let icon : String?
    let summary : String?
    
    enum CodingKeys: String, CodingKey {
        case data = "data"
        case icon = "icon"
        case summary = "summary"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        data = try values.decodeIfPresent([Data].self, forKey: .data)
        icon = try values.decodeIfPresent(String.self, forKey: .icon)
        summary = try values.decodeIfPresent(String.self, forKey: .summary)
    }
    
}




//Root of JSON Data
struct weatherJSON : Decodable {
    
    let alerts : [Alert]?
    let currently : Currently?
    let daily : Daily?
    let flags : Flag?
    let hourly : Hourly?
    let latitude : Float?
    let longitude : Float?
    let minutely : Minutely?
    let offset : Int?
    let timezone : String?
    
    enum CodingKeys: String, CodingKey {
        case alerts = "alerts"
        case currently = "currently"
        case daily = "daily"
        case flags = "flags"
        case hourly = "hourly"
        case latitude = "latitude"
        case longitude = "longitude"
        case minutely = "minutely"
        case offset = "offset"
        case timezone = "timezone"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        alerts = try values.decodeIfPresent([Alert].self, forKey: .alerts)
        currently = try Currently(from: decoder)
        daily = try Daily(from: decoder)
        flags = try Flag(from: decoder)
        hourly = try Hourly(from: decoder)
        latitude = try values.decodeIfPresent(Float.self, forKey: .latitude)
        longitude = try values.decodeIfPresent(Float.self, forKey: .longitude)
        minutely = try Minutely(from: decoder)
        offset = try values.decodeIfPresent(Int.self, forKey: .offset)
        timezone = try values.decodeIfPresent(String.self, forKey: .timezone)
    }
    
}

