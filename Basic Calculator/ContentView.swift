//
//  ContentView.swift
//  Basic Calculator
//
//  Created by Zach Gorino on 8/3/24.
//
// 488 778

import SwiftUI
import UIKit

struct ContentView: View {

    @State private var selectedOperatorIndex = 0
    
    @State private var wallRiseFeet = ""
    @State private var wallRiseInches = ""
    @State private var wallRiseFraction = ""
    
    @State private var wallHightPP = ""
    @State private var wallThickness = ""
    
    @State private var wallHightFrac = ""
    @State private var wallThicknessFrac = ""

    
    @State private var footerLengthFeet = ""
    @State private var footerLengthInches = ""
    @State private var footerLengthFraction = ""
    @State private var footerWidthFeet = ""
    @State private var footerWidthInches = ""
    @State private var footerWidthFraction = ""
    @State private var footerdepth = ""
    @State private var footerDepthFrac = ""
    
    @State private var pierDiamFeet = ""
    @State private var pierDiamInches = ""
    @State private var pierDiamFraction = ""
    
    @State private var pierLengthFeet = ""
    @State private var pierLengthInches = ""
    @State private var pierLengthFraction = ""
    
    @State private var pierXfeet = ""
    @State private var pierXinch = ""
    @State private var pierXfrac = ""
    
    @State private var pierYFeet = ""
    @State private var pierYInches = ""
    @State private var pierYFraction = ""
    
    @State private var numberOfPiers = ""
    @State private var numberOfPierPads = ""
    
    @State private var riseFeet = ""
    @State private var riseInches = ""
    @State private var riseFraction = ""
    
    @State private var runFeet = ""
    @State private var runInches = ""
    @State private var runFraction = ""
    
    @State private var ditchLength = ""
    @State private var ditchLengthIN = ""
    @State private var ditchLengthFrac = ""
    
    @State private var ditchWidth = ""
    @State private var ditchWidthFrac = ""
    
    @State private var ditchDepth = ""
    @State private var ditchDepthFrac = ""
    
    @State private var depth = ""
    @State private var depthFrac = ""
    @State private var pricePerYard = ""
    
    
    @State private var result = ""
    
    @State private var activeField: Field?
    
    @State private var showHelpView = false // Pop Up Help Page Controller
    @State private var showNumberPad = false  // State variable to control visibility of the number pad
    
    @State private var characterLimitFeet = 3
    @State private var characterLimitInches = 2
    
    @FocusState private var focusField: Field?
    
    let operators = ["⇱ Diagnal Measurment", "▢ Rectangle Slab Cubic Yard", "◯Round Pier/s Cubic Yard", "▢ Area(Sq-Ft)", "▦ Floor Rebar (20' Sticks)", "Mono-Pour Slab/Foundation", "⎢⎢ Stem Wall Cubic Yard", "⎦⎣ Steam Wall & Footer C/Y", "◯ Round Pier/s Rebar", "▢ Rectangle Pier/s Rebar"]

    enum Field: Hashable {
        case lengthFeetF, lengthInchesF, lengthFractionF,
             
             widthFeetF, widthInchesF, widthFractionF,
             
             depthF, depthFractionF,
             
             ditchLengthFtF, ditchLengthINF, ditchLengthFracF,
             
             ditchWidthF, ditchWidthFracF,
             
             ditchDepthINF, ditchDepthFracF,
             
             wallRiseFeetF, wallRiseInchesF, wallRiseFractionF,
             
             wallHightF, wallHightFractionF,
             
             wallThicknessF, wallThicknessFractionF,
             
             footerLengthFeetF, footerLengthInchesF, footerLengthFractionF,
             
             footerWidthFeetF, footerWidthInchesF, footerWidthFractionF,
             
             footerThicknessF, footerThicknessFractionF,
             
             pierLengthFeetF, pierLengthInchesF, pierLengthFractionF,
             
             pierDiamFeetF, pierDiamInchesF, pierDiamFractionF,
             
             pierXftF, pierXinF, pierXfracF,
             
             pierYftF, pierYinF, pierYfracF,
             
             numberOfPiersF, numberOfPierPadsF
    }
    
    func DoNothing() {
        /// Does Nothing
        return
    }
    func calculateResult() -> String {
        /// Making Place Holder Value to Substitute for : '    and :     "
        let FT = String("'")
        let IN = String("''")
        // Implement your calculation logic here
        
        /// Pier Diameter ROUND
        let PieValue = Double(3.141592653589793)
        
        let pierDiamFt = pierDiamFeet
        let pierDiamFtDub = Double(pierDiamFt) ?? 0
        
        let pierDiamIn = pierDiamInches
        let pierDiamInDub = Double(pierDiamIn) ?? 0
        
        let pierDiamFrac = pierDiamFraction
        let pierDiamFracDub = Double(pierDiamFrac) ?? 0
        let pierDiameter = Double(pierDiamFtDub +  pierDiamInDub + pierDiamFracDub)
        
        let pierRadius = Double(pierDiameter / 2)
        let RadiusOperand = Double(pierRadius * pierRadius)
        
        // Pier Length
        let pierLengthFT = pierLengthFeet
        let dubRiseFtDub = Double(pierLengthFT) ?? 0
        
        let pierLengthIn = pierLengthInches
        let pierLengthInDub = Double(pierLengthIn) ?? 0
        
        let pierLengthInchDubAsInch = Double(pierDiamInDub / 12)
        
        let pierLengthFrac = pierLengthFraction
        let pierLengthFracDub = Double(pierLengthFrac) ?? 0
        
        let PierXaxisFT = pierXfeet
        let PierAxisXFeet = Double(PierXaxisFT) ?? 0
        
        let pierXaxisIN = pierXinch
        let PierAxisXIn = Double(pierXaxisIN) ?? 0
        
        let pierXAxisfraction = pierXfrac
        let pierAxisXFrac = Double(pierXAxisfraction) ?? 0
        
        let pierYAxisFT = pierYFeet
        let pierAxisYFeet = Double(pierYAxisFT) ?? 0
        
        let pierYAxisIN = pierYInches
        let pierAxisYINch = Double(pierYAxisIN) ?? 0
        
        let pierAxixYFraction = pierYFraction
        let pierAxisYFrac = Double(pierXAxisfraction) ?? 0
        
        /// Foundation perimiter
        let wallAxisYFT = wallRiseFeet
        let wallYAxisft = Double(wallAxisYFT) ?? 0
        
        let wallYAxisIN = wallRiseInches
        let wallYAxisYin = Double(wallYAxisIN) ?? 0
        
        let wallaxisYfrac = wallRiseFraction
        let wallYAxisfrac = Double(wallaxisYfrac) ?? 0
        
        /// Foundation Height
        let wallAxisZinch = wallHightPP
        let wallZaxis = Double(wallAxisZinch) ?? 0
        
        let wallAxisZ = wallHightFrac
        let wallAxisZfrac = Double(wallAxisZ) ?? 0
        
        /// Foundation Thickness
        let wallThicknessFraction = wallThicknessFrac
        let wallXAxis = Double(wallThicknessFraction) ?? 8
        
        /// Foundation Conversions
        let foundatonPerimiterX = Double(wallYAxisft + wallYAxisYin + wallYAxisfrac)
        
        let foundationHeightY = Double(wallZaxis + wallAxisZfrac)
        
        let foundationThicknessZ = Double(wallXAxis / 12)
        
        let footerXFT = footerLengthFeet
        let footerXft = Double(footerXFT) ?? 0
        
        let footerXIN = footerLengthInches
        let footerXin = Double(footerXIN) ?? 0
        
        let footerXFR = footerLengthFraction
        let footerXfrac = Double(footerXFR) ?? 0
        
        let footerYFT = footerWidthFeet
        let footerYft = Double(footerYFT) ?? 0
        
        let footerYIN = footerWidthInches
        let footerYin = Double(footerYIN) ?? 0
        
        let footerYFR = footerWidthFraction
        let footerYfrac = Double(footerYFR) ?? 0
        
        let footerZIN = footerdepth
        let footerZin = Double(footerZIN) ?? 8
        
        let footerZFR = footerDepthFrac
        let footerZfrac = Double(footerZFR) ?? 0
        
        /// pier Conversions
        let pierZ = Double(dubRiseFtDub + pierLengthInchDubAsInch + pierLengthFracDub)
        
        /// Round Pier
        let PIE = Double(PieValue)
        let pierRoundXY = Double(pierDiamFtDub + pierDiamInDub + pierDiamFracDub)
        
        /// Recatngle Pier
        let pierX = Double(PierAxisXFeet + PierAxisXIn + pierAxisXFrac)
        let pierY = Double(pierAxisYFeet + pierAxisYINch + pierAxisYFrac)
        
        let riseFT = riseFeet
        let dubRiseFt = Double(riseFT) ?? 0
        
        let riseIN = riseInches
        let dubRiseIn = Double(riseIN) ?? 0
        
        let riseFrac = riseFraction
        let dubRiseFraction = Double(riseFrac) ?? 0
        
        
        let runFT = runFeet
        let dubRunFt = Double(runFT) ?? 0
        
        let runIN = runInches
        let dubRunIn = Double(runIN) ?? 0
        
        let runFrac = runFraction
        let dubRunFraction = Double(runFrac) ?? 0
        
        /// Ditch Conversions
        
        let ditchLengthX = ditchLength
        let ditchXPP = Double(ditchLengthX) ?? 0
        
        let ditchLengthInch = ditchLengthIN
        let ditchLengthInX = Double(ditchLengthInch) ?? 0
        
        let ditchLengthFrac = ditchLengthFrac
        let ditchfracX = Double(ditchLengthFrac) ?? 0
        
        
        let ditchYWidth = ditchWidth
        let ditchYPP = Double(ditchYWidth) ?? 14
        
        let DitchY = Double(ditchYPP / 12)
        
        let ditchHeight = ditchDepth
        let ditchZPP = Double(ditchHeight) ?? 30
        
        let DitchZ = Double(ditchZPP / 12)
        
        let depthCon = depth
        let dubDepth = Double(depthCon) ?? 0

        ///Footer Lengths Added Together
        let footingXPP = Double(footerXft + footerXin + footerXfrac)
        let footingYPP = Double(footerYft + footerYin + footerYfrac)
        let footingZPP = Double(footerZin + footerZfrac)
        
        guard let footingX = Optional(footingXPP) else {
            let footingX = String(0)
            return footingX
        }
        guard let footingY = Optional(footingYPP / 12) else {
            let footingY = String(0)
            return footingY
        }
        guard let footingZ = Optional(footingZPP / 12) else {
            let footingZ = String(0)
            return footingZ
        }
        
        /// Floor Lengths Added Together
        let riseLength = Double( dubRiseFt + (dubRiseIn / 12) + dubRiseFraction)
        let runLength = Double( dubRunFt + (dubRunIn / 12) + dubRunFraction)
        let depthAsDeci = Double(dubDepth / 12)
        
        /// Ditch Length Added
        
        let monoArea = Double(riseLength * runLength)
        let fourSide = Double(sqrt(monoArea) * 4)
        
        let One = Double((riseLength * 2) + (runLength * 2))
   ///     var DitchLengthTotal = Double(ditchXPP + ditchLengthInX + ditchfracX)
        var DitchLengthTotal = Double(fourSide)
        
        
        let aAndB = Double((riseLength * riseLength) + (runLength*runLength))
        
        let C = Double(sqrt(aAndB))
        
        let wholeSq = Int(C)
        let wholeSq2 = Double(wholeSq)
        let remainderSq = Double(C - wholeSq2)
        
        let sqInch = Double(12 * remainderSq)
        let Inch = Int(sqInch)
        let inchDub = Double(Inch)
        let Inch2 = Double(sqInch - inchDub)
        
        let wholeNumberFeet = Int( wholeSq)
        let wholeNumberInches = Int(Inch)
        
        let feet = String(wholeNumberFeet)
        
        
        /// Other Stuff
        let concretePrice = pricePerYard
        let concretePriceDub = Double(concretePrice) ??  0
        
        
        let measurementDecimals: [Double] = [0.0, 0.062, 0.125, 0.187, 0.25, 0.312, 0.375, 0.437, 0.5, 0.562, 0.625, 0.687, 0.75, 0.812, 0.875, 0.9375]

        /// impliment Diagnal Measurement Calculator
        func nearestFraction(to value: Double) -> Double? {
            guard !measurementDecimals.isEmpty else { return nil }
            
            // Use reduce to find the closest value
            
            return measurementDecimals.reduce(measurementDecimals[0]) { (closest, current) -> Double in
                // Compare the absolute difference between the current closest and the current fraction value
                return abs(current - value) < abs(closest - value) ? current : closest
            }
        }
        
        func SquareUp(a: Double) -> String {
            let nearest = nearestFraction(to: a)
            let stringN = String(reflecting: nearest)
            let N = Double(nearest!)
            let H1 = String(N)
            // let ANS = String("The nearest fraction to \(Inch2) is \(nearest)")
            sendHelpPlz(H1)
            
            func sendHelpPlz(_ input: String?) -> String {
                let Zero = String(0.0)
                let oneSixteenth = String(0.062)
                let oneEighth = String(0.125)
                let threeSisteenths = String(0.187)
                let oneQuarter = String(0.25)
                let fiveSixteenths = String(0.312)
                let threeEighths = String(0.375)
                let sevenSixteenths = String(0.437)
                let oneHalf = String(0.5)
                let nineSixteenths = String(0.562)
                let fiveEighths = String(0.625)
                let elevenSixteenths = String(0.6870000000000001024)
                let threeQuarters = String(0.75)
                let thirteenSizteenths = String(0.812)
                let sevenEighths = String(0.875)
                let fifteenSixteenths = String(0.9375)
                
                if input == Zero {
                    let finalAnswer = "0"
                    let diag = String("\(feet)\(FT)   \(Inch)  &  \(finalAnswer)\(IN)")
                    
                    result = diag
                }
                else if input == oneSixteenth {
                    let finalAnswer = "1/16"
                    let diag = String("\(feet)\(FT)   \(Inch)  &  \(finalAnswer)\(IN)")
                    
                    result = diag
                }
                else if input == oneEighth {
                    let finalAnswer = "1/8"
                    let diag = String("\(feet)\(FT)   \(Inch)  &  \(finalAnswer)\(IN)")
                    
                    result = diag
                }
                else if input == threeSisteenths {
                    let finalAnswer = "3/16"
                    let diag = String("\(feet)\(FT)   \(Inch)  &  \(finalAnswer)\(IN)")
                    
                    result = diag
                }
                else if input == oneQuarter {
                    let finalAnswer = "1/4"
                    let diag = String("Feet   Inch   Fraction\n \(feet)\(FT)      \(Inch)    &    \(finalAnswer)\(IN)")
                    
                    result = diag
                }
                else if input == fiveSixteenths {
                    let finalAnswer = "5/16"
                    let diag = String("\(feet)\(FT)   \(Inch)  &  \(finalAnswer)\(IN)")
                    
                    result = diag
                }
                else if input == threeEighths {
                    let finalAnswer = "3/8"
                    let diag = String("\(feet)\(FT)   \(Inch)  &  \(finalAnswer)\(IN)")
                    
                    result = diag
                }
                else if input == sevenSixteenths {
                    let finalAnswer = "7/16"
                    let diag = String("\(feet)\(FT)   \(Inch)  &  \(finalAnswer)\(IN)")
                    
                    result = diag
                }
                else if input == oneHalf {
                    let finalAnswer = "1/2"
                    let diag = String("\(feet)\(FT)   \(Inch)  &  \(finalAnswer)\(IN)")
                    
                    result = diag
                }
                else if input == nineSixteenths {
                    let finalAnswer = "9/16"
                    let diag = String("\(feet)\(FT)   \(Inch)  &  \(finalAnswer)\(IN)")
                    
                    result = diag
                }
                else if input == fiveEighths {
                    let finalAnswer = "5/8"
                    let diag = String("\(feet)\(FT)   \(Inch)  &  \(finalAnswer)\(IN)")
                    
                    result = diag
                }
                else if input == elevenSixteenths {
                    let finalAnswer = "11/16"
                    let diag = String("\(feet)\(FT)   \(Inch)  &  \(finalAnswer)\(IN)")
                    print("Hello World!")
                    
                    result = diag
                    
                }
                else if input == threeQuarters {
                    let finalAnswer = "3/4"
                    let diag = String("\(feet)\(FT)   \(Inch)  &  \(finalAnswer)\(IN)")
                    
                    result = diag
                }
                else if input == thirteenSizteenths {
                    let finalAnswer = "13/16"
                    let diag = String("\(feet)\(FT)   \(Inch)  &  \(finalAnswer)\(IN)")
                    
                    result = diag
                }
                else if input == sevenEighths {
                    let finalAnswer = "7/8"
                    let diag = String("\(feet)\(FT)   \(Inch)  &  \(finalAnswer)\(IN)")
                    
                    result = diag
                }
                else if input == fifteenSixteenths {
                    let finalAnswer = "15/16"
                    let diag = String("\(feet)\(FT)   \(Inch)  &  \(finalAnswer)\(IN)\nFeet      Inch   Fraction")
                    result = diag
                }
                else {
                    let diag = String("\(feet) \(Inch) \(input)Aluah Akbar")
                    result = diag
                }
                return result
            }
            return result
        }
        
        func MonoFloorFoundation(X: Double, Y: Double, Z: Double, DX: Double, DY: Double, DZ: Double) -> String {
                let SqFt = Double(X * Y)
                let Volume = Double(SqFt * Z)
            
                let CubicYards = Double(Volume / 27)
                let formatterFloor = String(format: "%.2f", CubicYards)
                let formattedFloorCubicYards = String("\(formatterFloor) in Floor")
            
            if DX != 0, DY != 0 {
                let DitchArea = Double(DX * DY)
                let DitchVolume = Double(DitchArea * DZ)
            
                let DitchCubicYards = Double(DitchVolume / 27)
                let ans = Double(DitchCubicYards)
                let formattedYardageDitch = String(format: "%.2f", ans)
                
                
                let formaTed2 = String("\(formattedFloorCubicYards)\n\(formattedYardageDitch) In Ditch")
                
                result = formaTed2
                
            }
            else if DX == 0, DY == 0 {
                let DitchX = Double(sqrt(SqFt))
                let DepthY = Double(30 / 12)
                let DitchArea = Double(DitchX * DepthY)
                let DitchVolume = Double(DitchArea * DZ)
            
                let DitchCubicYards = Double(DitchVolume / 27)
                
                let ans = Double(DitchCubicYards)
                let formattedYardageditch = String(format: "%.2f", ans)
                let formaTed2 = String("\(formattedYardageditch) System defualt measurement dontt trust this")
                
                result = formaTed2
            }
                return result
            }
        
        func CubicYards(X: Double, Y: Double, Z: Double) -> String {
                /// Wall, or Floor, or Pier,
                let SqFt = Double(X * Y)
                let Volume = Double(SqFt * Z)
                let VolumeCubicYards = Double(Volume / 27)
                
                /// format results for Users
                let ans = Double(VolumeCubicYards)
                let formattedYardage = String(format: "%.2f", ans)
                let formaTed1 = String("\(formattedYardage) P")
                
                result = formaTed1
            return result
        }

            ///Impliment Area Calculator
            let SquareFt = riseLength * runLength
            let area = String(SquareFt)
            

            /// Impliment Rebar Calculator
            let rebarCount = Double(SquareFt / 17.6470588)
            let rebarAns = String(rebarCount)
            
        
            /// Call Cubic Yards Algorithm and Insert Variables
            
            let FloorCubicYards = CubicYards(X: riseLength, Y: runLength, Z:depthAsDeci)
            let FloorYards = String(FloorCubicYards)
            
            let FloorYardsDouble = Double(FloorYards)
        
            let BackToString = String("\(FloorYardsDouble)")
        
            let diagMes = SquareUp(a: Inch2)
            let DiagnalMeasurement = String(diagMes)
            
            let wallYardage = CubicYards(X: footingX, Y: footingY, Z: footingZ)
            let wallCubicYards = String(wallYardage)
        
            let footingYards = CubicYards(X: foundatonPerimiterX, Y: foundationHeightY, Z: foundationThicknessZ)
            let footingCoubicYards = String(footingYards)
        
            let ditchvVolume = CubicYards(X: DitchLengthTotal, Y: DitchY, Z: DitchZ)
            let DitchCubicYards = String(ditchvVolume)
        
        
            /// Impliment Additions to make differrent Cubic Yard Results
            
            let MonoPourCubicYards = MonoFloorFoundation(X: riseLength, Y: runLength, Z: depthAsDeci, DX: DitchLengthTotal,DY: DitchY, DZ: DitchZ)
            let MonoFoundationCubicYards = String(MonoPourCubicYards)
        
            switch selectedOperatorIndex {
            case 0:
                result = DiagnalMeasurement
            case 1:
                result = FloorYards
            case 2:
                result = area
            case 3:
                result = area
            case 4:
                result = rebarAns
            case 5:
                result = MonoFoundationCubicYards
            case 6:
                result = wallCubicYards

            default:
                result = "Invalid Measurments"
            }
            return result
    }
        var body: some View {
            VStack {
                HStack {
                    Button(action: { showHelpView.toggle()})
                    {
                        Label("Result", systemImage: "arrowshape.down.fill")
                            .font(.system(size:26))
                            .foregroundColor(.blue)
                            .padding(.top, 3)
                            .bold()
                            .padding(.trailing, -20)
                            .lineSpacing(12)
                        
                        Label("Help", systemImage: "info.bubble.fill.rtl")
                            .padding(6)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .padding(.leading, 50)
                    }
                }
                
                HStack {
                    Text("\(result)")
                        .font(.system(size:22))
                        .foregroundColor(.blue)
                        .padding(.top, 8)
                        .padding(.bottom, 8)
                        .bold()
                        .padding(.trailing, 150)
                        .lineSpacing(20)
                    
                }
                .padding(.top, 10)
            }
            List{
                
                Picker("Select operator", selection: $selectedOperatorIndex) {
                    ForEach(0..<operators.count, id: \.self) { index in
                        Text(operators[index])
                            .foregroundStyle(.blue)
                            .bold()
                        
                    }
                }
                .pickerStyle(WheelPickerStyle())
                .padding(.top, -100)
                
                HStack {
                    Label("Slabs(Rectangle)   &\nDiagnal Measurements", systemImage: "arrowshape.down.fill")
                        .font(.system(size:22))
                        .foregroundColor(.blue)
                        .padding(.top, 5)
                    
                }
                
                HStack {
                    Text("Length")
                        .font(.system(size:22))
                        .foregroundColor(.blue)
                        .padding(.top, 0)
                    
                    CustomTextField(text: $riseFeet, placeholder: "Ft")
                        .padding()
                        .padding(.top, 5)
                        .padding(.horizontal, 5)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.blue)
                        )
                        .focused($focusField, equals: .lengthFeetF)
                        .onAppear {
                            self.focusField = .lengthFeetF
                        }
                        .onChange(of: riseFeet, perform: { _ in
                            //  Every time a character is typed, onChange is triggered and the last character is removed from the
                            if riseFeet.count > characterLimitFeet {
                                let limitedText = riseFeet.dropLast()
                                riseFeet = String(limitedText)
                            }
                            else {
                                return
                            }
                        })
                    
                    CustomTextField(text: $riseInches, placeholder: "In")
                        .padding(.top, 5)
                        .keyboardType(.numberPad)
                        .padding(.leading, 15)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.blue)
                        )
                        .focused($focusField, equals: .lengthInchesF)
                        .onChange(of: riseInches, perform: { _ in
                            //  Every time a character is typed, onChange is triggered and the last character is removed from the
                            if riseInches.count > characterLimitInches {
                                let limitedText = riseInches.dropLast()
                                riseInches = String(limitedText)
                            }
                            else {
                                return
                            }
                        })
                    
                    CustomTextField(text: $riseFraction, placeholder: "Fraction")
                        .padding(.leading, 5)
                        .padding(.top, 5)
                        .keyboardType(.decimalPad)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.blue)
                        )
                        .focused($focusField, equals: .lengthFractionF)
                        .onChange(of: riseFraction, perform: { _ in
                            //  Every time a character is typed, onChange is triggered and the last character is removed from the
                            if riseFraction.count > characterLimitFeet {
                                let limitedText = riseFraction.dropLast()
                                riseFraction = String(limitedText)
                            }
                            else {
                                return
                            }
                        })
                    
                }
                
                HStack {
                    Text("Width")
                        .font(.system(size:22))
                        .foregroundColor(.blue)
                        .padding(.top, 5)
                    
                    CustomTextField(text: $runFeet, placeholder: "Ft")
                        .padding(.leading, 33)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.blue)
                        )
                        .focused($focusField, equals: .widthFeetF)
                        .onChange(of: runFeet, perform: { _ in
                            //  Every time a character is typed, onChange is triggered and the last character is removed from the
                            if runFeet.count > characterLimitFeet {
                                let limitedText = riseFeet.dropLast()
                                runFeet = String(limitedText)
                            }
                            else {
                                return
                            }
                        })
                    
                    CustomTextField(text: $runInches, placeholder: "In")
                        .padding(.leading, 23)
                        .keyboardType(.numberPad)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.blue)
                        )
                        .focused($focusField, equals: .widthInchesF)
                        .onChange(of: runInches, perform: { _ in
                            //  Every time a character is typed, onChange is triggered and the last character is removed from the
                            if runInches.count > characterLimitInches {
                                let limitedText = runInches.dropLast()
                                runInches = String(limitedText)
                            }
                            else {
                                return
                            }
                        })
                    
                    
                    CustomTextField(text: $runFraction, placeholder: "Fraction")
                        .padding(.leading, 7)
                        .keyboardType(.decimalPad)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.blue)
                        )
                        .focused($focusField, equals: .widthFractionF)
                        .onChange(of: runFraction, perform: { _ in
                            //  Every time a character is typed, onChange is triggered and the last character is removed from the
                            if runFraction.count > characterLimitFeet {
                                let limitedText = runFraction.dropLast()
                                runFraction = String(limitedText)
                            }
                            else {
                                return
                            }
                        })
                    
                }
                
                HStack {
                    Text("Thickness")
                        .font(.system(size:22))
                        .foregroundColor(.blue)
                        .padding(.top, 5)
                    
                    CustomTextField(text: $depth, placeholder: "Inches")
                        .padding(.leading, 27)
                        .padding(.top, 5)
                        .keyboardType(.numberPad)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.blue)
                        )
                        .focused($focusField, equals: .depthF)
                    
                        .onChange(of: depth, perform: { _ in
                            //  Every time a character is typed, onChange is triggered and the last character is removed from the
                            if depth.count > characterLimitInches {
                                let limitedText = depth.dropLast()
                                depth = String(limitedText)
                            }
                            else {
                                return
                            }
                        })
                    CustomTextField(text: $depthFrac, placeholder: "Fraction")
                        .padding(.leading, 30)
                        .padding(.top, 5)
                        .focused($focusField, equals: .depthFractionF)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.blue)
                        )
                        .onChange(of: depthFrac, perform: { _ in
                            //  Every time a character is typed, onChange is triggered and the last character is removed from the
                            if depthFrac.count > characterLimitInches {
                                let limitedText = depthFrac.dropLast()
                                depthFrac = String(limitedText)
                            }
                            else {
                                return
                            }
                        })
                    
                }
                HStack {
                    Label("Ditch entry is for Mono Slab/Foundation Not A Thickened Edge", systemImage: "arrowshape.down.fill")
                        .font(.system(size:22))
                        .foregroundColor(.blue)
                        .padding(.top, 5)
                    
                }
                HStack {
                    Text("Ditch Length")
                        .font(.system(size:22))
                        .foregroundColor(.blue)
                        .padding(.top, 5)
                    
                    CustomTextField(text: $ditchLength, placeholder: "Ft")
                        .padding(.leading, 33)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.blue)
                        )
                        .focused($focusField, equals: .ditchLengthFtF)
                        .onChange(of: ditchLength, perform: { _ in
                            //  Every time a character is typed, onChange is triggered and the last character is removed from the
                            if ditchLength.count > characterLimitFeet {
                                let limitedText = ditchLength.dropLast()
                                ditchLength = String(limitedText)
                            }
                            else {
                                return
                            }
                        })
                    
                    CustomTextField(text: $ditchLengthIN, placeholder: "In")
                        .padding(.leading, 23)
                        .keyboardType(.numberPad)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.blue)
                        )
                        .focused($focusField, equals: .ditchLengthINF)
                        .onChange(of: ditchLengthIN, perform: { _ in
                            //  Every time a character is typed, onChange is triggered and the last character is removed from the
                            if runInches.count > characterLimitInches {
                                let limitedText = ditchLengthIN.dropLast()
                                ditchLengthIN = String(limitedText)
                            }
                            else {
                                return
                            }
                        })
                    
                    
                    CustomTextField(text: $ditchLengthFrac, placeholder: "Fraction")
                        .padding(.leading, 7)
                        .keyboardType(.decimalPad)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.blue)
                        )
                        .focused($focusField, equals: .ditchLengthFracF)
                        .onChange(of: ditchLengthFrac, perform: { _ in
                            //  Every time a character is typed, onChange is triggered and the last character is removed from the
                            if ditchLengthFrac.count > characterLimitFeet {
                                let limitedText = ditchLengthFrac.dropLast()
                                ditchLengthFrac = String(limitedText)
                            }
                            else {
                                return
                            }
                        })
                }
                HStack {
                    Text("Ditch Width")
                        .font(.system(size:22))
                        .foregroundColor(.blue)
                        .padding(.top, 5)
                    
                    CustomTextField(text: $ditchWidth, placeholder: "Inches")
                        .padding(.leading, 27)
                        .padding(.top, 5)
                        .keyboardType(.numberPad)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.blue)
                        )
                        .focused($focusField, equals: .ditchWidthF)
                    
                        .onChange(of: ditchWidth, perform: { _ in
                            //  Every time a character is typed, onChange is triggered and the last character is removed from the
                            if ditchWidth.count > characterLimitInches {
                                let limitedText = ditchWidth.dropLast()
                                ditchWidth = String(limitedText)
                            }
                            else {
                                return
                            }
                        })
                    CustomTextField(text: $ditchWidthFrac, placeholder: "Fraction")
                        .padding(.leading, 30)
                        .padding(.top, 5)
                        .focused($focusField, equals: .ditchDepthFracF)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.blue)
                        )
                        .onChange(of: ditchDepthFrac, perform: { _ in
                            //  Every time a character is typed, onChange is triggered and the last character is removed from the
                            if ditchWidthFrac.count > characterLimitInches {
                                let limitedText = ditchWidthFrac.dropLast()
                                ditchWidthFrac = String(limitedText)
                            }
                            else {
                                return
                            }
                        })
                    
                }

                HStack {
                    Text("Ditch Depth\n(from Sub-Grade)")
                        .bold()
                        .foregroundColor(.blue)
                        .padding(.top, 5)

                    CustomTextField(text: $ditchDepth, placeholder: "Inches")
                        .padding(.leading, 27)
                        .padding(.top, 5)
                        .keyboardType(.numberPad)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.blue)
                        )
                        .focused($focusField, equals: .ditchDepthINF)
                    
                        .onChange(of: ditchDepth, perform: { _ in
                            //  Every time a character is typed, onChange is triggered and the last character is removed from the
                            if ditchDepth.count > characterLimitInches {
                                let limitedText = ditchDepth.dropLast()
                                ditchDepth = String(limitedText)
                            }
                            else {
                                return
                            }
                        })
                    CustomTextField(text: $ditchDepthFrac, placeholder: "Fraction")
                        .padding(.leading, 30)
                        .padding(.top, 5)
                        .focused($focusField, equals: .depthFractionF)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.blue)
                        )
                        .onChange(of: depthFrac, perform: { _ in
                            //  Every time a character is typed, onChange is triggered and the last character is removed from the
                            if ditchDepthFrac.count > characterLimitInches {
                                let limitedText = ditchDepthFrac.dropLast()
                                ditchDepthFrac = String(limitedText)
                            }
                            else {
                                return
                            }
                        })
                    
                }
                
                /// Stem wall section Below
                
                HStack {
                    Label("Stem Wall", systemImage: "arrowshape.down.fill")
                        .font(.system(size:22))
                        .foregroundColor(.blue)
                        .padding(.top, 5)
                }
                HStack {
                    Text("Total Ft of Wall")
                        .bold()
                        .foregroundColor(.blue)
                        .padding(.top, 5)
                    
                    CustomTextField(text: $wallRiseFeet, placeholder: "Ft")
                        .padding(.leading, 15)
                        .padding(.top, 5)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.blue)
                        )
                        .focused($focusField, equals: .wallRiseFeetF)
                        .scrollDismissesKeyboard(.interactively)
                        .inputAccessoryView {
                            NumberPadView(onButtonTap: handleButtonTap, focusedField: Binding(projectedValue: $activeField))
                        }
                        .onChange(of: wallRiseFeet, perform: { _ in
                            //  Every time a character is typed, onChange is triggered and the last character is removed from the
                            if wallRiseFeet.count > characterLimitInches {
                                let limitedText = wallRiseFeet.dropLast()
                                wallRiseFeet = String(limitedText)
                            }
                            else {
                                return
                            }
                        })
                    
                    CustomTextField(text: $wallRiseInches, placeholder: "In")
                        .padding(.leading, 15)
                        .padding(.top, 5)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.blue)
                        )
                        .focused($focusField, equals: .wallRiseInchesF)
                        .scrollDismissesKeyboard(.interactively)
                        .inputAccessoryView {
                            NumberPadView(onButtonTap: handleButtonTap, focusedField: Binding(projectedValue: $activeField))
                        }
                        .onChange(of: wallRiseInches, perform: { _ in
                            //  Every time a character is typed, onChange is triggered and the last character is removed from the
                            if wallRiseInches.count > characterLimitInches {
                                let limitedText = wallRiseInches.dropLast()
                                wallRiseInches = String(limitedText)
                            }
                            else {
                                return
                            }
                        })
                    
                    CustomTextField(text: $wallRiseFraction, placeholder: "Fraction")
                        .padding(.leading, 5)
                        .padding(.top, 5)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.blue)
                        )
                        .focused($focusField, equals: .wallRiseFractionF)
                        .scrollDismissesKeyboard(.interactively)
                        .inputAccessoryView {
                            NumberPadView(onButtonTap: handleButtonTap, focusedField: Binding(projectedValue: $activeField))
                        }
                        .onChange(of: wallRiseFraction, perform: { _ in
                            //  Every time a character is typed, onChange is triggered and the last character is removed from the
                            if wallRiseFraction.count > characterLimitInches {
                                let limitedText = wallRiseFraction.dropLast()
                                wallRiseFraction = String(limitedText)
                            }
                            else {
                                return
                            }
                        })
                }
                
                HStack {
                    Text("Wall Hight")
                        .bold()
                        .foregroundColor(.blue)
                        .padding(.top, 5)
                    
                    CustomTextField(text: $wallHightPP, placeholder: "Inches")
                        .padding(.leading, 24)
                        .padding(.top, 5)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.blue)
                        )
                        .focused($focusField, equals: .wallHightF)
                        .scrollDismissesKeyboard(.interactively)
                        .inputAccessoryView {
                            NumberPadView(onButtonTap: handleButtonTap, focusedField: Binding(projectedValue: $activeField))
                        }
                        .onChange(of: wallHightPP, perform: { _ in
                            //  Every time a character is typed, onChange is triggered and the last character is removed from the
                            if wallHightPP.count > characterLimitInches {
                                let limitedText = wallHightPP.dropLast()
                                wallHightPP = String(limitedText)
                            }
                            else {
                                return
                            }
                        })
                    CustomTextField(text: $wallHightFrac, placeholder: "Fraction")
                        .padding(.leading, 22)
                        .padding(.top, 5)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.blue)
                        )
                        .focused($focusField, equals: .wallHightFractionF)
                        .scrollDismissesKeyboard(.interactively)
                        .inputAccessoryView {
                            NumberPadView(onButtonTap: handleButtonTap, focusedField: Binding(projectedValue: $activeField))
                        }
                        .onChange(of: wallHightPP, perform: { _ in
                            //  Every time a character is typed, onChange is triggered and the last character is removed from the
                            if wallHightFrac.count > characterLimitInches {
                                let limitedText = wallHightFrac.dropLast()
                                wallHightFrac = String(limitedText)
                            }
                            else {
                                return
                            }
                        })
                }
                HStack {
                    Text("Wall\nThickness")
                        .bold()
                        .foregroundColor(.blue)
                        .padding(.top, 5)
                    
                    CustomTextField(text: $wallThickness, placeholder: "Inches")
                        .padding(.leading, 25)
                        .padding(.top, 5)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.blue)
                        )
                        .focused($focusField, equals: .wallThicknessF)
                        .scrollDismissesKeyboard(.interactively)
                        .inputAccessoryView {
                            NumberPadView(onButtonTap: handleButtonTap, focusedField: Binding(projectedValue: $activeField))
                        }
                        .onChange(of: wallThickness, perform: { _ in
                            //  Every time a character is typed, onChange is triggered and the last character is removed from the
                            if wallThickness.count > characterLimitInches {
                                let limitedText = wallThickness.dropLast()
                                wallThickness = String(limitedText)
                            }
                            else {
                                return
                            }
                        })
                    
                    CustomTextField(text: $wallThicknessFrac, placeholder: "Fraction")
                        .padding(.leading, 20)
                        .padding(.top, 5)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.blue)
                        )
                        .focused($focusField, equals: .wallThicknessFractionF)
                        .scrollDismissesKeyboard(.interactively)
                        .inputAccessoryView {
                            NumberPadView(onButtonTap: handleButtonTap, focusedField: Binding(projectedValue: $activeField))
                        }
                        .onChange(of: wallThickness, perform: { _ in
                            //  Every time a character is typed, onChange is triggered and the last character is removed from the
                            if wallThicknessFrac.count > characterLimitInches {
                                let limitedText = wallThicknessFrac.dropLast()
                                wallThicknessFrac = String(limitedText)
                            }
                            else {
                                return
                            }
                        })
                }
                
                HStack {
                    Label("Footers or Pier Pads", systemImage: "arrowshape.down.fill")
                        .font(.system(size:22))
                        .foregroundColor(.blue)
                        .padding(.top, 5)
                        .padding(.trailing, 5)
                }
                
                HStack {
                    Text("Footer Length")
                        .bold()
                        .foregroundColor(.blue)
                        .padding(.top, 5)
                    
                    CustomTextField(text: $footerLengthFeet, placeholder: "Ft")
                        .padding(.leading, 30)
                        .padding(.top, 5)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.blue)
                        )
                        .focused($focusField, equals: .footerLengthFeetF)
                        .scrollDismissesKeyboard(.interactively)
                        .inputAccessoryView {
                            NumberPadView(onButtonTap: handleButtonTap, focusedField: Binding(projectedValue: $activeField))
                        }
                        .onChange(of: footerLengthFeet, perform: { _ in
                            //  Every time a character is typed, onChange is triggered and the last character is removed from the
                            if footerLengthFeet.count > characterLimitInches {
                                let limitedText = footerLengthFeet.dropLast()
                                footerLengthFeet = String(limitedText)
                            }
                            else {
                                return
                            }
                        })
                    CustomTextField(text: $footerLengthInches, placeholder: "In")
                        .padding(.leading, 30)
                        .padding(.top, 5)
                        .focused($focusField, equals: .footerLengthInchesF)
                        .scrollDismissesKeyboard(.interactively)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.blue)
                        )
                        .inputAccessoryView {
                            NumberPadView(onButtonTap: handleButtonTap, focusedField: Binding(projectedValue: $activeField))
                        }
                        .onChange(of: footerLengthInches, perform: { _ in
                            //  Every time a character is typed, onChange is triggered and the last character is removed from the
                            if wallThickness.count > characterLimitInches {
                                let limitedText = footerLengthInches.dropLast()
                                footerLengthInches = String(limitedText)
                            }
                            else {
                                return
                            }
                        })
                    CustomTextField(text: $footerLengthFraction, placeholder: "Fraction")
                        .padding(.leading, 5)
                        .padding(.top, 5)
                        .focused($focusField, equals: .footerLengthFractionF)
                        .scrollDismissesKeyboard(.interactively)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.blue)
                        )
                        .inputAccessoryView {
                            NumberPadView(onButtonTap: handleButtonTap, focusedField: Binding(projectedValue: $activeField))
                        }
                        .onChange(of: footerLengthFraction, perform: { _ in
                            //  Every time a character is typed, onChange is triggered and the last character is removed from the
                            if footerLengthFraction.count > characterLimitFeet {
                                let limitedText = footerLengthFraction.dropLast()
                                footerLengthFraction = String(limitedText)
                            }
                            else {
                                return
                            }
                        })
                }
                HStack {
                    Text("Footer Width")
                        .bold()
                        .foregroundColor(.blue)
                        .padding(.top, 5)
                    
                    CustomTextField(text: $footerWidthFeet, placeholder: "Ft")
                        .padding(.leading, 30)
                        .padding(.top, 5)
                        .focused($focusField, equals: .footerWidthFeetF)
                        .scrollDismissesKeyboard(.interactively)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.blue)
                        )
                        .inputAccessoryView {
                            NumberPadView(onButtonTap: handleButtonTap, focusedField: Binding(projectedValue: $activeField))
                        }
                        .onChange(of: footerWidthFeet, perform: { _ in
                            //  Every time a character is typed, onChange is triggered and the last character is removed from the
                            if footerWidthFeet.count > characterLimitFeet {
                                let limitedText = footerWidthFeet.dropLast()
                                footerWidthFeet = String(limitedText)
                            }
                            else {
                                return
                            }
                        })
                    CustomTextField(text: $footerWidthInches, placeholder: "In")
                        .padding(.leading, 30)
                        .padding(.top, 5)
                        .focused($focusField, equals: .footerWidthInchesF)
                        .scrollDismissesKeyboard(.interactively)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.blue)
                        )
                        .inputAccessoryView {
                            NumberPadView(onButtonTap: handleButtonTap, focusedField: Binding(projectedValue: $activeField))
                        }
                        .onChange(of: footerWidthInches, perform: { _ in
                            //  Every time a character is typed, onChange is triggered and the last character is removed from the
                            if footerWidthInches.count > characterLimitInches {
                                let limitedText = footerWidthInches.dropLast()
                                footerWidthInches = String(limitedText)
                            }
                            else {
                                return
                            }
                        })
                    CustomTextField(text: $footerWidthFraction, placeholder: "Fraction")
                        .padding(.leading, 5)
                        .padding(.top, 5)
                        .focused($focusField, equals: .footerWidthFractionF)
                        .scrollDismissesKeyboard(.interactively)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.blue)
                        )
                        .inputAccessoryView {
                            NumberPadView(onButtonTap: handleButtonTap, focusedField: Binding(projectedValue: $activeField))
                        }
                        .onChange(of: footerWidthFraction, perform: { _ in
                            //  Every time a character is typed, onChange is triggered and the last character is removed from the
                            if footerWidthFraction.count > characterLimitFeet {
                                let limitedText = footerWidthFraction.dropLast()
                                footerWidthFraction = String(limitedText)
                            }
                            else {
                                return
                            }
                        })
                }
                
                HStack {
                    Text("Footer\nThickness")
                        .bold()
                        .foregroundColor(.blue)
                        .padding(.top, 5)
                    
                    CustomTextField(text: $footerdepth, placeholder: "Inches")
                        .padding(.leading, 15)
                        .padding(.top, 5)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.blue)
                        )
                        .focused($focusField, equals: .footerThicknessF)
                        .scrollDismissesKeyboard(.interactively)
                        .inputAccessoryView {
                            NumberPadView(onButtonTap: handleButtonTap, focusedField: Binding(projectedValue: $activeField))
                        }
                        .onChange(of: footerdepth, perform: { _ in
                            //  Every time a character is typed, onChange is triggered and the last character is removed from the
                            if footerdepth.count > characterLimitInches {
                                let limitedText = footerdepth.dropLast()
                                footerdepth = String(limitedText)
                            }
                            else {
                                return
                            }
                        })
                    
                    CustomTextField(text: $footerDepthFrac, placeholder: "Fraction")
                        .padding(.leading, 15)
                        .padding(.top, 5)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.blue)
                        )
                        .focused($focusField, equals: .footerThicknessFractionF)
                        .scrollDismissesKeyboard(.interactively)
                        .inputAccessoryView {
                            NumberPadView(onButtonTap: handleButtonTap, focusedField: Binding(projectedValue: $activeField))
                        }
                        .onChange(of: footerDepthFrac, perform: { _ in
                            //  Every time a character is typed, onChange is triggered and the last character is removed from the
                            if footerDepthFrac.count > characterLimitInches {
                                let limitedText = footerDepthFrac.dropLast()
                                footerDepthFrac = String(limitedText)
                            }
                            else {
                                return
                            }
                        })

                }
                Spacer()
                HStack {
                    Label("Piers (Round or Rectangle)", systemImage: "arrowshape.down.fill")
                        .font(.system(size:22))
                        .foregroundColor(.blue)
                        .padding(.top, 5)
                        .padding(.trailing, 5)
                }
                HStack {
                    Text("Pier Hight(Z)")
                        .bold()
                        .foregroundColor(.blue)
                        .padding(.top, 5)
                    
                    CustomTextField(text: $pierLengthFeet, placeholder: "Ft")
                        .padding(.leading, 15)
                        .padding(.top, 5)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.blue)
                        )
                        .focused($focusField, equals: .pierLengthFeetF)
                        .inputAccessoryView {
                            NumberPadView(onButtonTap: handleButtonTap, focusedField: Binding(projectedValue: $activeField))
                        }
                        .onChange(of: pierLengthFeet, perform: { _ in
                            //  Every time a character is typed, onChange is triggered and the last character is removed from the
                            if pierLengthFeet.count > characterLimitFeet {
                                let limitedText = pierLengthFeet.dropLast()
                                pierLengthFeet = String(limitedText)
                            }
                            else {
                                return
                            }
                        })
                    
                    CustomTextField(text: $pierLengthInches, placeholder: "In")
                        .padding(.leading, 15)
                        .padding(.top, 5)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.blue)
                        )
                        .keyboardType(.numberPad)
                        .focused($focusField, equals: .pierLengthInchesF)
                        .inputAccessoryView {
                            NumberPadView(onButtonTap: handleButtonTap, focusedField: Binding(projectedValue: $activeField))
                        }
                        .onChange(of: pierLengthInches, perform: { _ in
                            //  Every time a character is typed, onChange is triggered and the last character is removed from the
                            if pierLengthInches.count > characterLimitInches {
                                let limitedText = pierLengthInches.dropLast()
                                pierLengthInches = String(limitedText)
                            }
                            else {
                                return
                            }
                        })
                    
                    CustomTextField(text: $pierLengthFraction, placeholder: "Fraction")
                        .padding(.leading, 6)
                        .padding(.top, 5)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.blue)
                        )
                        .keyboardType(.decimalPad)
                        .focused($focusField, equals: .pierLengthFractionF)
                        .inputAccessoryView {
                            NumberPadView(onButtonTap: handleButtonTap, focusedField: Binding(projectedValue: $activeField))
                        }
                        .onChange(of: pierLengthFraction, perform: { _ in
                            //  Every time a character is typed, onChange is triggered and the last character is removed from the
                            if pierLengthFraction.count > characterLimitFeet {
                                let limitedText = pierLengthFraction.dropLast()
                                pierLengthFraction = String(limitedText)
                            }
                            else {
                                return
                            }
                        })
                    
                }
                HStack {
                    Text("↓ Round")
                        .bold()
                        .foregroundColor(.blue)
                        .padding(.top, 5)
                        .padding(.leading, 15)
                }
                HStack {
                    Text("Pier Diameter\n(Y Round)")
                        .bold()
                        .foregroundColor(.blue)
                        .padding(.top, 5)
                        .padding(.leading, -10)
                    
                    CustomTextField(text: $pierDiamFeet, placeholder: "Ft")
                        .padding(.leading, 15)
                        .padding(.top, 5)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.blue)
                        )
                        .focused($focusField, equals: .pierDiamFeetF)
                        .inputAccessoryView {
                            NumberPadView(onButtonTap: handleButtonTap, focusedField: Binding(projectedValue: $activeField))
                        }
                        .onChange(of: pierDiamFeet, perform: { _ in
                            //  Every time a character is typed, onChange is triggered and the last character is removed from the
                            if pierDiamFeet.count > characterLimitFeet {
                                let limitedText = pierDiamFeet.dropLast()
                                pierDiamFeet = String(limitedText)
                            }
                            else {
                                return
                            }
                        })
                    
                    
                    CustomTextField(text: $pierDiamInches, placeholder: "In")
                        .padding(.leading, 15)
                        .padding(.top, 5)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.blue)
                        )
                        .keyboardType(.numberPad)
                        .focused($focusField, equals: .pierDiamInchesF)
                        .inputAccessoryView {
                            NumberPadView(onButtonTap: handleButtonTap, focusedField: Binding(projectedValue: $activeField))
                        }
                        .onChange(of: pierDiamInches, perform: { _ in
                            //  Every time a character is typed, onChange is triggered and the last character is removed from the
                            if pierDiamInches.count > characterLimitInches {
                                let limitedText = pierDiamInches.dropLast()
                                pierDiamInches = String(limitedText)
                            }
                            else {
                                return
                            }
                        })
                    
                    CustomTextField(text: $pierDiamFraction, placeholder: "Fraction")
                        .padding(.leading, 6)
                        .padding(.top, 5)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.blue)
                        )
                        .keyboardType(.decimalPad)
                        .focused($focusField, equals: .pierDiamFractionF)
                        .inputAccessoryView {
                            NumberPadView(onButtonTap: handleButtonTap, focusedField: Binding(projectedValue: $activeField))
                        }
                        .onChange(of: pierDiamFraction, perform: { _ in
                            //  Every time a character is typed, onChange is triggered and the last character is removed from the
                            if pierDiamFraction.count > characterLimitFeet {
                                let limitedText = pierDiamFraction.dropLast()
                                pierDiamFraction = String(limitedText)
                            }
                            else {
                                return
                            }
                        })
                }
                HStack {
                    Text("↓ OR Rectangle")
                        .bold()
                        .foregroundColor(.blue)
                        .padding(.top, 5)
                        .padding(.leading, 15)
                }
                
                HStack {
                    Text("Length(X)")
                        .bold()
                        .foregroundColor(.blue)
                        .padding(.top, 5)
                        .padding(.trailing, -9)
                    CustomTextField(text: $pierXfeet, placeholder: "Ft")
                        .padding(.leading, 15)
                        .padding(.top, 5)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.blue)
                        )
                        .focused($focusField, equals: .pierXftF)
                        .inputAccessoryView {
                            NumberPadView(onButtonTap: handleButtonTap, focusedField: Binding(projectedValue: $activeField))
                        }
                        .onChange(of: pierDiamFeet, perform: { _ in
                            //  Every time a character is typed, onChange is triggered and the last character is removed from the
                            if pierXfeet.count > characterLimitFeet {
                                let limitedText = pierXfeet.dropLast()
                                pierXfeet = String(limitedText)
                            }
                            else {
                                return
                            }
                        })
                    
                    
                    CustomTextField(text: $pierXinch, placeholder: "In")
                        .padding(.leading, 15)
                        .padding(.top, 5)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.blue)
                        )
                        .keyboardType(.numberPad)
                        .focused($focusField, equals: .pierXinF)
                        .inputAccessoryView {
                            NumberPadView(onButtonTap: handleButtonTap, focusedField: Binding(projectedValue: $activeField))
                        }
                        .onChange(of: pierXinch, perform: { _ in
                            //  Every time a character is typed, onChange is triggered and the last character is removed from the
                            if pierXinch.count > characterLimitInches {
                                let limitedText = pierXinch.dropLast()
                                pierXinch = String(limitedText)
                            }
                            else {
                                return
                            }
                        })
                    
                    CustomTextField(text: $pierXfrac, placeholder: "Fraction")
                        .padding(.leading, 6)
                        .padding(.top, 5)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.blue)
                        )
                        .keyboardType(.decimalPad)
                        .focused($focusField, equals: .pierXfracF)
                        .inputAccessoryView {
                            NumberPadView(onButtonTap: handleButtonTap, focusedField: Binding(projectedValue: $activeField))
                        }
                        .onChange(of: pierXfrac, perform: { _ in
                            //  Every time a character is typed, onChange is triggered and the last character is removed from the
                            if pierXfrac.count > characterLimitFeet {
                                let limitedText = pierXfrac.dropLast()
                                pierXfrac = String(limitedText)
                            }
                            else {
                                return
                            }
                        })
                }
                HStack {
                    Text("Width(Y)")
                        .bold()
                        .foregroundColor(.blue)
                        .padding(.top, 7)
                        .padding(.trailing, -7)
                    
                    CustomTextField(text: $pierYFeet, placeholder: "Ft")
                        .padding(.leading, 22)
                        .padding(.top, 5)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.blue)
                        )
                        .focused($focusField, equals: .pierYftF)
                        .inputAccessoryView {
                            NumberPadView(onButtonTap: handleButtonTap, focusedField: Binding(projectedValue: $activeField))
                        }
                        .onChange(of: pierYFeet, perform: { _ in
                            //  Every time a character is typed, onChange is triggered and the last character is removed from the
                            if pierYFeet.count > characterLimitFeet {
                                let limitedText = pierYFeet.dropLast()
                                pierYFeet = String(limitedText)
                            }
                            else {
                                return
                            }
                        })
                    
                    
                    CustomTextField(text: $pierYInches, placeholder: "In")
                        .padding(.leading, 21)
                        .padding(.top, 5)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.blue)
                        )
                        .keyboardType(.numberPad)
                        .focused($focusField, equals: .pierYinF)
                        .inputAccessoryView {
                            NumberPadView(onButtonTap: handleButtonTap, focusedField: Binding(projectedValue: $activeField))
                        }
                        .onChange(of: pierDiamInches, perform: { _ in
                            //  Every time a character is typed, onChange is triggered and the last character is removed from the
                            if pierYInches.count > characterLimitInches {
                                let limitedText = pierYInches.dropLast()
                                pierYInches = String(limitedText)
                            }
                            else {
                                return
                            }
                        })
                    
                    CustomTextField(text: $pierYFraction, placeholder: "Fraction")
                        .padding(.leading, 7)
                        .padding(.top, 5)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.blue)
                        )
                        .keyboardType(.decimalPad)
                        .focused($focusField, equals: .pierYfracF)
                        .inputAccessoryView {
                            NumberPadView(onButtonTap: handleButtonTap, focusedField: Binding(projectedValue: $activeField))
                        }
                        .onChange(of: pierDiamFraction, perform: { _ in
                            //  Every time a character is typed, onChange is triggered and the last character is removed from the
                            if pierYFraction.count > characterLimitFeet {
                                let limitedText = pierYFraction.dropLast()
                                pierYFraction = String(limitedText)
                            }
                            else {
                                return
                            }
                        })
                }
                
                HStack {
                    Label("If you have multiple Pier of Different Hights,\nAdd their lengths and enter it as one", systemImage: "arrowshape.down.fill")
                        .font(.system(size:22))
                        .foregroundColor(.blue)
                        .padding(.top, 5)
                        .padding(.trailing, 5)
                }
                
                HStack {
                    Text("Number of Piers")
                        .bold()
                        .foregroundColor(.blue)
                        .padding(.top, 5)
                    
                    CustomTextField(text: $numberOfPiers, placeholder: "Number of Piers")
                        .padding(.leading, 15)
                        .padding(.top, 5)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.blue)
                        )
                        .keyboardType(.numberPad)
                        .focused($focusField, equals: .numberOfPiersF)
                        .inputAccessoryView {
                            NumberPadView(onButtonTap: handleButtonTap, focusedField: Binding(projectedValue: $activeField))
                        }
                        .onChange(of: numberOfPiers, perform: { _ in
                            //  Every time a character is typed, onChange is triggered and the last character is removed from the
                            if numberOfPiers.count > characterLimitFeet {
                                let limitedText = numberOfPiers.dropLast()
                                numberOfPiers = String(limitedText)
                            }
                            else {
                                return
                            }
                        })
                }
                HStack {
                    Text("Number of\nPier Pads")
                        .bold()
                        .foregroundColor(.blue)
                        .padding(.top, 5)
                    
                    CustomTextField(text: $numberOfPierPads, placeholder: "Number of Pads")
                        .padding(.leading, 15)
                        .padding(.top, 5)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.blue)
                        )
                        .keyboardType(.numberPad)
                        .focused($focusField, equals: .numberOfPierPadsF)
                        .inputAccessoryView {
                            NumberPadView(onButtonTap: handleButtonTap, focusedField: Binding(projectedValue: $activeField))
                        }
                        .onChange(of: numberOfPierPads, perform: { _ in
                            //  Every time a character is typed, onChange is triggered and the last character is removed from the
                            if numberOfPierPads.count > characterLimitFeet {
                                let limitedText = numberOfPierPads.dropLast()
                                numberOfPierPads = String(limitedText)
                            }
                            else {
                                return
                            }
                        })
                }
            }
            
            
            if showNumberPad == false {
                ButtonSpaceView(onButtonTap: handleButtonTap, focusedField: Binding(projectedValue: $activeField))
            }
            else {
                NumberPadView(onButtonTap: handleButtonTap, focusedField: Binding(projectedValue: $activeField))
            }
            
            
        }

    func deleteAll() {
        if !riseFeet.isEmpty { riseFeet.removeAll()}
        if !riseInches.isEmpty { riseInches.removeAll() }
        if !riseFraction.isEmpty { riseFraction.removeAll() }
        if !runFeet.isEmpty { runFeet.removeAll() }
        if !runInches.isEmpty { runInches.removeAll()}
        if !runFraction.isEmpty { runFraction.removeAll()}
        if !depth.isEmpty { depth.removeAll()}
        if !depthFrac.isEmpty { depthFrac.removeAll()}
        
        if !pierLengthFeet.isEmpty { pierLengthFeet.removeAll()}
        if !pierLengthInches.isEmpty { pierLengthInches.removeAll()}
        if !pierLengthFraction.isEmpty { pierLengthFraction.removeAll()}
        
        if !pierDiamFeet.isEmpty { pierDiamFeet.removeAll()}
        if !pierDiamInches.isEmpty { pierDiamInches.removeAll()}
        if !pierDiamFraction.isEmpty { pierDiamFraction.removeAll()}
        
        if !pierXfeet.isEmpty { pierXfeet.removeAll()}
        if !pierXinch.isEmpty { pierXinch.removeAll()}
        if !pierXfrac.isEmpty { pierXfrac.removeAll()}
        
        if !pierYFeet.isEmpty { pierYFeet.removeAll()}
        if !pierYInches.isEmpty { pierYInches.removeAll()}
        if !pierYFraction.isEmpty { pierYFraction.removeAll()}
        
        if !numberOfPiers.isEmpty { numberOfPiers.removeAll()}
        if !numberOfPierPads.isEmpty { numberOfPierPads.removeAll()}
        
        if !wallRiseFeet.isEmpty { wallRiseFeet.removeAll()}
        if !wallRiseInches.isEmpty { wallRiseInches.removeAll()}
        if !wallRiseFraction.isEmpty { wallRiseFraction.removeAll()}
        
        if !wallHightPP.isEmpty { wallHightPP.removeAll()}
        if !wallHightFrac.isEmpty { wallHightFrac.removeAll()}
        
        if !wallThickness.isEmpty { wallThickness.removeAll()}
        
        if !footerLengthFeet.isEmpty { footerLengthFeet.removeAll()}
        if !footerLengthInches.isEmpty { footerLengthInches.removeAll()}
        if !footerLengthFraction.isEmpty { footerLengthFraction.removeAll()}
        
        if !footerWidthFeet.isEmpty { footerWidthFeet.removeAll()}
        if !footerWidthInches.isEmpty { footerWidthInches.removeAll()}
        if !footerWidthFraction.isEmpty { footerWidthFraction.removeAll()}
        
        if !footerdepth.isEmpty { footerdepth.removeAll()}
        if !footerDepthFrac.isEmpty { footerDepthFrac.removeAll()}
        else {
            return
        }
    }
        func handleButtonTap(_ button: String) {

            guard let focusedField = focusField else { return }
            
            switch button {
            case "⤒":
                showNumberPad.toggle()
            case "C/A":
                deleteAll()
            case "⌫":
                switch focusedField {
                case .lengthFeetF:
                    if !riseFeet.isEmpty { riseFeet.removeLast() }
                    
                case .lengthInchesF:
                    if !riseInches.isEmpty { riseInches.removeLast() }

                case .lengthFractionF:
                    if !riseFraction.isEmpty { riseFraction.removeLast() }

                case .widthFeetF:
                    if !runFeet.isEmpty { runFeet.removeLast() }

                case .widthInchesF:
                    if !runInches.isEmpty { runInches.removeLast() }

                case .widthFractionF:
                    if !runFraction.isEmpty { runFraction.removeLast() }

                case .depthF:
                    if !depth.isEmpty { depth.removeLast() }
                    
                case .depthFractionF:
                    if !depthFrac.isEmpty { depthFrac.removeLast()}
                
                case .ditchDepthFracF:
                    if !ditchDepthFrac.isEmpty { ditchDepthFrac.removeLast()}
                    
                case .ditchDepthINF:
                    if !ditchDepth.isEmpty { ditchDepth.removeLast()}
                    
                case .ditchWidthF:
                    if !ditchWidth.isEmpty { ditchWidth.removeLast()}
                    
                case .ditchWidthFracF:
                    if !ditchWidthFrac.isEmpty { ditchWidthFrac.removeLast()}
                    
                case .pierLengthFeetF:
                    if !pierLengthFeet.isEmpty { pierLengthFeet.removeLast() }

                case .pierLengthInchesF:
                    if !pierLengthInches.isEmpty { pierLengthInches.removeLast() }

                case .pierLengthFractionF:
                    if !pierLengthFraction.isEmpty { pierLengthFraction.removeLast() }

                case .pierDiamFeetF:
                    if !pierDiamFeet.isEmpty { pierDiamFeet.removeLast() }

                case .pierDiamInchesF:
                    if !pierDiamInches.isEmpty { pierDiamInches.removeLast() }

                case .pierDiamFractionF:
                    if !pierDiamFraction.isEmpty { pierDiamFraction.removeLast() }

                case .numberOfPiersF:
                    if !numberOfPiers.isEmpty { numberOfPiers.removeLast() }

                case .numberOfPierPadsF:
                    if !numberOfPierPads.isEmpty { numberOfPierPads.removeLast() }

                case .wallRiseFeetF:
                    if !wallRiseFeet.isEmpty { wallRiseFeet.removeLast()}

                case .wallRiseInchesF:
                    if !wallRiseInches.isEmpty { wallRiseFeet.removeLast()}

                case .wallRiseFractionF:
                    if !wallRiseFraction.isEmpty { wallRiseFraction.removeLast()}

                case .wallHightF:
                    if !wallHightPP.isEmpty { wallHightPP.removeLast()}

                case .wallThicknessF:
                    if !wallThickness.isEmpty { wallThickness.removeLast()}

                case .wallThicknessFractionF:
                    if wallThicknessFrac.isEmpty { wallThicknessFrac.removeLast()}
                    
                case .footerLengthFeetF:
                    if !footerLengthFeet.isEmpty { footerLengthFeet.removeLast()}

                case .footerLengthInchesF:
                    if !footerLengthInches.isEmpty { footerLengthInches.removeLast()}

                case .footerLengthFractionF:
                    if !footerLengthFraction.isEmpty { footerLengthFraction.removeLast()}

                case .footerWidthFeetF:
                    if !footerWidthFeet.isEmpty { footerWidthFeet.removeLast()}

                case .footerWidthInchesF:
                    if !footerWidthInches.isEmpty { footerWidthInches.removeLast()}

                case .footerWidthFractionF:
                    if !footerWidthFraction.isEmpty { footerWidthFraction.removeLast()}

                case .footerThicknessF:
                    if !footerdepth.isEmpty { footerdepth.removeLast()}

                case .wallHightFractionF:
                    if !wallHightFrac.isEmpty { wallHightFrac.removeLast()}
                    
                case .footerThicknessFractionF:
                    if !footerDepthFrac.isEmpty { footerdepth.removeLast()}
                    
                case .pierXftF:
                    if !pierXfeet.isEmpty { pierXfeet.removeLast()}
                    
                case .pierXinF:
                    if !pierXinch.isEmpty { pierXinch.removeLast()}
                    
                case .pierXfracF:
                    if !pierXfrac.isEmpty { pierXfrac.removeLast()}
                    
                case .pierYftF:
                    if !pierYFeet.isEmpty { pierYFeet.removeLast()}
                    
                case .pierYinF:
                    if !pierYInches.isEmpty { pierYInches.removeLast()}
                    
                case .pierYfracF:
                    if !pierYFraction.isEmpty { pierYFraction.removeLast()}
                case .ditchLengthFtF:
                    if !ditchLength.isEmpty { ditchLength.removeLast()}
                    
                case .ditchLengthINF:
                    if !ditchLengthIN.isEmpty { ditchLengthIN.removeLast()}

                case .ditchLengthFracF:
                    if !ditchLengthFrac.isEmpty { ditchLengthFrac.removeLast()}
                }
            case "→":
                moveFocus(next: true)
            case "=":
                self.calculateResult()
            case "⤓":
                showNumberPad.toggle()
            default:
                
                switch focusedField {
                case .lengthFeetF:
                    riseFeet.append(button)
                    
                case .lengthInchesF:
                    riseInches.append(button)
                    
                case .lengthFractionF:
                    riseFraction.append(button)
                    
                case .widthFeetF:
                    runFeet.append(button)
                    
                case .widthInchesF:
                    runInches.append(button)
                    
                case .widthFractionF:
                    runFraction.append(button)
                    
                case .depthF:
                    depth.append(button)

                case .depthFractionF:
                    depth.append(button)
                    
                case .ditchWidthF:
                    ditchWidth.append(button)
                    
                case .ditchWidthFracF:
                    ditchWidthFrac.append(button)
                    
                case .ditchDepthINF:
                    ditchDepth.append(button)
                    
                case .ditchDepthFracF:
                    ditchDepthFrac.append(button)
                    
                case .pierLengthFeetF:
                    pierLengthFeet.append(button)
                    
                case .pierLengthInchesF:
                    pierLengthInches.append(button)
                    
                case .pierLengthFractionF:
                    pierLengthFraction.append(button)
                    
                case .pierDiamFeetF:
                    pierDiamFeet.append(button)
                    
                case .pierDiamInchesF:
                    pierDiamInches.append(button)
                    
                case .pierDiamFractionF:
                    pierDiamFraction.append(button)
                    
                case .numberOfPiersF:
                    numberOfPiers.append(button)
                    
                case .numberOfPierPadsF:
                    numberOfPierPads.append(button)
                    
                case .wallRiseFeetF:
                    wallRiseFeet.append(button)
                    
                case .wallRiseInchesF:
                    wallRiseInches.append(button)
                    
                case .wallRiseFractionF:
                    wallRiseFraction.append(button)
                    
                case .wallHightF:
                    wallHightPP.append(button)
                    
                case .wallHightFractionF:
                    wallHightFrac.append(button)

                case .wallThicknessF:
                    wallThickness.append(button)
                
                case .wallThicknessFractionF:
                    wallThicknessFrac.append(button)
                    
                case .footerLengthFeetF:
                    footerLengthFeet.append(button)
                    
                case .footerLengthInchesF:
                    footerLengthInches.append(button)
                    
                case .footerLengthFractionF:
                    footerLengthFraction.append(button)
                    
                case .footerWidthFeetF:
                    footerWidthFeet.append(button)
                    
                case .footerWidthInchesF:
                    footerWidthInches.append(button)
                    
                case .footerWidthFractionF:
                    footerWidthFraction.append(button)
                    
                case .footerThicknessF:
                    footerdepth.append(button)
                    
                case .footerThicknessFractionF:
                    footerDepthFrac.append(button)
                    
                case .pierXftF:
                    pierXfeet.append(button)
                    
                case .pierXinF:
                    pierXinch.append(button)
                    
                case .pierXfracF:
                    pierXfrac.append(button)
                    
                case .pierYftF:
                    pierYFeet.append(button)
                    
                case .pierYinF:
                    pierYInches.append(button)
                    
                case .pierYfracF:
                    pierYFraction.append(button)
                    
                case .ditchLengthFtF:
                    ditchLength.append(button)
                    
                case .ditchLengthINF:
                    ditchLengthIN.append(button)
                    
                case .ditchLengthFracF:
                    ditchLengthFrac.append(button)
                }
            }
        }
        private func moveFocus(next: Bool) {
            guard let currentField = focusField else { return }
            
            let fields: [Field] = [
                .lengthFeetF, .lengthInchesF, .lengthFractionF,
                .widthFeetF, .widthInchesF, .widthFractionF,
                .depthF, .depthFractionF, 
                .wallRiseFeetF, .wallRiseInchesF, .wallRiseFractionF,
                .wallHightF, .wallHightFractionF,
                .wallThicknessF, .wallThicknessFractionF,
                .footerLengthFeetF, .footerLengthInchesF, .footerLengthFractionF,
                .footerWidthFeetF, .footerWidthInchesF, .footerWidthFractionF,
                .footerThicknessF, .footerThicknessFractionF,
                .pierLengthFeetF, .pierLengthInchesF, .pierLengthFractionF,
                .pierDiamFeetF, .pierDiamInchesF, .pierDiamFractionF,
                .pierXftF, .pierXinF, .pierXfracF,
                .pierYftF, .pierYinF, .pierYfracF,
                .numberOfPiersF,
                .numberOfPierPadsF,

            ]
            
            if let currentIndex = fields.firstIndex(of: currentField) {
                let nextIndex = (currentIndex + (next ? 1 : 2)) % fields.count
                focusField = fields[nextIndex]
            }
        }
    }


// Extend View to provide input accessory view
extension View {
    func inputAccessoryView<AccessoryView: View>(@ViewBuilder accessoryView: @escaping () -> AccessoryView) -> some View {
        overlay(
            accessoryView()
                .frame(maxWidth: .infinity)
                .background(Color(UIColor.systemBackground))
                .edgesIgnoringSafeArea(.bottom)
                .offset(y: 300)
        )
    }
}
#Preview {
    ContentView()
}
