//

//  Einstein.swift

//

//  Created by Christopher Di Bert

//  Created on 2024-2-27

//  Version 1.0

//  Copyright (c) 2024 Christopher Di Bert. All rights reserved.

//

//  Calculates the energy of an object using Einstein's equation.

import Foundation

// Enumerator for error messages.
enum ErrorMessages: Error {
    case InvalidMassType
}

// Function to cast the user's mass.
func castMass(massStr: String) throws -> Double {
    // Checks if mass is a number.
    guard let mass = Double(massStr) else {
        throw ErrorMessages.InvalidMassType
    }
    // Returns casted mass.
    return mass
}

func main() {
    // Sets speed of light.
    let speedOfLight : Double = 299792458
    // Instantiating number formatter.
    let decimalFormatter = NumberFormatter()
    // Specifies three decimal places for energy.
    decimalFormatter.minimumFractionDigits = 3
    decimalFormatter.maximumFractionDigits = 3

    print("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n")
    // Asks user for the mass of their object
    print("Enter the mass of your object (kg): ", terminator: "")
    let userMass = readLine() ?? ""

    // Try catch to find errors in user's choice'
    do {
        // Gets the chosen log length
        let mass = try castMass(massStr: userMass)
        // Calculates the maximum logs that can fit in the truck
        let energy = mass * pow(speedOfLight, 2.0)
        let formattedEnergy : String = decimalFormatter.string(from: NSNumber(value: energy)) ?? ""

        if (energy <= 0) {
            print("Your mass must be greater than 0!")
        } else {
            // Tells user how many logs can fit in the truck
            print("\(formattedEnergy)J of energy can be released by the object.")
        }

    // Catches invalid user input
    } catch ErrorMessages.InvalidMassType {
        print("You must enter a numeric mass")
        // This catch is needed to compile
    } catch {
        print("An error occurred: \(error)")
    }
}

main()