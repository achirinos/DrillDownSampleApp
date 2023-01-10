//
//  ContentView.swift
//  DrillDownSampleApp
//
//  Created by Asdrubal Chirinos on 10/01/23.
//

import SwiftUI

struct Make: Identifiable {
    var id = UUID()
    var name: String
    var models: [Model]
}

struct Model: Identifiable {
    var id = UUID()
    var name: String
    var years: [Year]
}

struct Year: Identifiable, Hashable {
    var id = UUID()
    var value: String
}


let makeData = [
    Make(name: "Tesla", models: [
        Model(name: "Model S", years: [
            Year(value: "2015"),Year(value: "2016"),Year(value: "2017")
        ]),
        Model(name: "Model X", years: [
            Year(value: "2015"),Year(value: "2016"),Year(value: "2017")
        ]),
        Model(name: "Model 3", years: [
            Year(value: "2016"),Year(value: "2017"),Year(value: "2018")
        ]),
    ])
]


struct ContentView: View {
    var body: some View {
        NavigationView {
            List(makeData) { make in
                NavigationLink(destination: ModelView(make: make)) {
                    Text(make.name)
                }
            }
            .navigationBarTitle("Make")
        }
    }
}

struct ModelView: View {
    var make: Make
    var body: some View {
        
            List(make.models) { model in
                NavigationLink(destination: YearView(make: make, model: model)) {
                    Text(model.name)
                }
            }
            .navigationBarTitle("Model")
        
    }
}

struct YearView: View {
    var make: Make
    var model: Model
    var body: some View {
        
            List(model.years, id: \.self) { year in
                NavigationLink(destination: Detail2View(make: make, model: model, year: year.value)) {
                    Text("\(year.value)")
                }
            }
            .navigationBarTitle("Year")
        
    }
}

struct Detail2View: View {
    var make: Make
    var model: Model
    var year: String
    var body: some View {
        Text("\(make.name) \(model.name) \(year)")
            .navigationBarTitle("Detail")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
