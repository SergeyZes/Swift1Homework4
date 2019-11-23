import UIKit

//Задание 3
enum EngineAction {
    case startEngine, stopEngine
}

enum WindowsAction {
    case openWindows, closeWindows
}



//Задание 1
class Car {
    let mark: String
    let trunkVolume: Double
    var isEngineOn: Bool = false
    var isWindowsOpened: Bool = false
    var filledTrunkVolume: Double = 0.0
    
    func changeEngine(state action: EngineAction){
        
    }
    
    func changeWindow(state action: WindowsAction){
    }

    init(mark: String, trunkVolume: Double) {
        self.mark = mark
        self.trunkVolume = trunkVolume
    }

}

//Задание 2
class TrunkCar: Car {
    let hasRailing: Bool
    var doorIsFixed: Bool = false
    init(hasRailing: Bool, mark: String, trunkVolume: Double) {
        self.hasRailing = hasRailing
        super.init(mark: mark, trunkVolume: trunkVolume)
    }
}

class SportCar: Car {
    let hasSpoiler: Bool
    var isSpoilerOn: Bool = false
    init(hasSpoiler: Bool, mark: String, trunkVolume: Double) {
        self.hasSpoiler = hasSpoiler
        super.init(mark: mark, trunkVolume: trunkVolume)
    }
}

//Задание 3 - в начале

//Задание 4

class TrunkCar4: Car {
    let hasRailing: Bool
    var doorIsFixed: Bool = false
    
    override func changeEngine(state action: EngineAction) {
        switch action {
        case .startEngine:
            isEngineOn = true
            doorIsFixed = true
        case .stopEngine:
            isEngineOn = false
            doorIsFixed = false
        }
    }
    
    override func changeWindow(state action: WindowsAction){
        switch action {
        case .openWindows:
            self.isWindowsOpened = true
        case .closeWindows:
            self.isWindowsOpened = false
        }
    }

    
    init(hasRailing: Bool, mark: String, trunkVolume: Double) {
        self.hasRailing = hasRailing
        super.init(mark: mark, trunkVolume: trunkVolume)
    }
    
    func toString() -> String {
        let s = "автомобиль: \(self.mark) объем багажника: \(self.trunkVolume) состояние двигателя: \(self.isEngineOn ? "запущен" : "не запущен") состояние окон: \(self.isWindowsOpened ? "открыты" : "закрыты") загруженность багажника: \(self.filledTrunkVolume) наличие рэйлинга: \(self.hasRailing ? "имеетя" : "отсутствует") заблокированы ли двери: \(self.doorIsFixed ? "да" : "нет")"
        return s
    }

}

class SportCar4: Car {
    let hasSpoiler: Bool
    var isSpoilerOn: Bool = false

    override func changeEngine(state action: EngineAction) {
        switch action {
        case .startEngine:
            isEngineOn = true
            if hasSpoiler {
                isSpoilerOn = true
            }
        case .stopEngine:
            isEngineOn = false
            isSpoilerOn = false
        }
    }

    override func changeWindow(state action: WindowsAction){
        switch action {
        case .openWindows:
            self.isWindowsOpened = true
        case .closeWindows:
            self.isWindowsOpened = false
        }
    }
    
    func toString() -> String {
        let s = "автомобиль: \(self.mark) объем багажника: \(self.trunkVolume) состояние двигателя: \(self.isEngineOn ? "запущен" : "не запущен") состояние окон: \(self.isWindowsOpened ? "открыты" : "закрыты") загруженность багажника: \(self.filledTrunkVolume) наличие антикрыла: \(self.hasSpoiler ? "имеетя" : "отсутствует") антикрыло поднято: \(self.isSpoilerOn ? "да" : "нет")"
        return s
    }


    init(hasSpoiler: Bool, mark: String, trunkVolume: Double) {
        self.hasSpoiler = hasSpoiler
        super.init(mark: mark, trunkVolume: trunkVolume)
    }
}

//Задание 5
let sc1 = SportCar4(hasSpoiler: true, mark: "Ferrari", trunkVolume: 10)
let sc2 = SportCar4(hasSpoiler: false, mark: "Bugatti Chiron", trunkVolume: 15)

let tc1 = TrunkCar4(hasRailing: true, mark: "Лада Ларгус", trunkVolume: 200)

sc1.changeEngine(state: .startEngine)
sc2.changeWindow(state: .openWindows)

tc1.changeEngine(state: .startEngine)

//Задание 6
print(sc1.toString())
print(sc2.toString())
print(tc1.toString())
