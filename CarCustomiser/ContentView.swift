//
//  ContentView.swift
//  CarCustomiser
//
//  Created by Lysander Myrddin-Evans on 11/01/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var starterCars = StarterCars()
    @State private var selectedCar: Int = 0
    @State private var exhaustPackage = false
    @State private var tiresPackage = false
    @State private var gearboxPackage = false
    @State private var spoiler = false
    
    var body: some View {
        let exhaustPackageBinding = Binding<Bool> (
            get: { self.exhaustPackage },
            set: { newValue in
                self.exhaustPackage = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].topSpeed += 5
                } else {
                    starterCars.cars[selectedCar].topSpeed -= 5
                }
            }
        )
        let tiresPackageBinding = Binding<Bool> (
            get: { self.tiresPackage },
            set: { newValue in
                self.tiresPackage = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].handling += 2
                } else {
                    starterCars.cars[selectedCar].handling -= 2
                }
            }
        )
        let gearboxPackageBinding = Binding<Bool> (
            get: { self.gearboxPackage },
            set: { newValue in
                self.gearboxPackage = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].acceleration -= 1
                } else {
                    starterCars.cars[selectedCar].acceleration += 1
                }
            }
        )
        let spoilerBinding = Binding<Bool> (
            get: { self.spoiler },
            set: { newValue in
                self.spoiler = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].topSpeed += 5
                    starterCars.cars[selectedCar].handling += 1
                } else {
                    starterCars.cars[selectedCar].topSpeed -= 5
                    starterCars.cars[selectedCar].handling -= 1
                }
            }
        )
        
        Form {
            VStack(alignment: .leading, spacing: 20) {
                Text("\(starterCars.cars[selectedCar].displayStats())")
                Button("Next Car", action: {
                    if selectedCar == self.starterCars.cars.count - 1 {
                        selectedCar = 0
                    } else {
                        selectedCar += 1
                    }
                    exhaustPackage = false
                    tiresPackage = false
                    gearboxPackage = false
                    spoiler = false
                })
            }
            Section {
                Toggle("Exhaust Package", isOn: exhaustPackageBinding)
                Toggle("Tires package", isOn: tiresPackageBinding)
                Toggle("Gearbox package", isOn: gearboxPackageBinding)
                Toggle("Spoiler", isOn: spoilerBinding)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
