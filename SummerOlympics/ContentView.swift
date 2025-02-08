//
//  ContentView.swift
//  SummerOlympics
//
//  Created by Richard Gagg on 8/2/2025.
//

import SwiftUI

struct ContentView: View {
  
  @State private var logoNumber: Int = 22
  
  private let logos: [String] = [
    "1924-Paris-France.jpg",
    "1932-los-angeles-usa.jpg",
    "1936-berlin-germany.png",
    "1948-london-england.jpg",
    "1952-helsinki-finland.jpg",
    "1956-melbourne-australia.jpg",
    "1960-rome-italy.jpg",
    "1964-tokyo-japan.jpg",
    "1968-mexico-city-mexico.jpg",
    "1972-munich-germany.png",
    "1976-montreal-canada.jpg",
    "1980-moscow-russia.jpg",
    "1984-los-angeles-usa.jpg",
    "1988-seoul-south-korea.jpg",
    "1992-barcelona-spain.jpg",
    "1996-atlanta-usa.jpg",
    "2000-sydney-australia.jpg",
    "2004-athens-greece.png",
    "2008-beijing-china.jpg",
    "2012-london-england.jpg",
    "2016-rio-brazil.jpg",
    "2020-tokyo-japan.jpeg",
    "2024-paris-france.png",
    "2028-los-angeles-usa.png",
    "2032-brisbane-australia"]
  
  var body: some View {
    VStack {
      Text("Olympic Logos")
        .font(.largeTitle)
        .fontWeight(.black)
        .foregroundStyle(.red)
      
      Spacer()
      
      Image(getImageName(logoName: logos[logoNumber]))
        .resizable()
        .scaledToFit()
      
      Spacer()
      
      Group {
        Text("\(getCountry(logoName: logos[logoNumber])), \( getCity(logoName: logos[logoNumber]))")
        Text(getYear(logoName: logos[logoNumber]))
      }
      .font(.largeTitle)
      .fontWeight(.thin)
      .multilineTextAlignment(.center)
      
      HStack {
        // Left Button
        Button {
          logoNumber -= 1
          
        } label: {
          Image(systemName: "chevron.backward.to.line")
        }
        .disabled(logoNumber == 0)
        
        Spacer()
        
        //Right Button
        Button {
          logoNumber += 1

        } label: {
          Image(systemName: "chevron.forward.to.line")
        }
        .disabled(logoNumber == logos.count - 1)
      }
      .font(.largeTitle)
      .fontWeight(.heavy)
      .tint(.black)
    }
    .padding(30)
  }
  
  func getImageName(logoName: String) -> String {
    // 3 extensions png, jpg, jpeg
    
    let componentsArray = logoName.components(separatedBy: ".")
    let logoName = componentsArray.first ?? ""
    
    return String(logoName)
  }


  func getYear(logoName: String) -> String {
    let componentArray = logoName.components(separatedBy: "-")
    let year = componentArray.first ?? ""
    return String(year)
  }


  func getCountry(logoName: String) -> String {
    
    let componentsArray = logoName.components(separatedBy: "-")
    var country = componentsArray.last ?? ""
    country = getImageName(logoName: country)
    
    if country.lowercased() == "usa" {
      country = country.uppercased()
    } else {
      country = country.capitalized
    }
    return country
  }


  func getCity(logoName: String) -> String {
    
    var componentsArray = logoName.components(separatedBy: "-")
    componentsArray.removeFirst()
    componentsArray.removeLast()
      
    if componentsArray.count > 1 {
      return componentsArray.joined(separator: " ").capitalized
    } else {
      return (componentsArray.first ?? "").capitalized
    }
  }
}

#Preview {
  ContentView()
}
