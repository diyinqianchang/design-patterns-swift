
import Foundation

enum EngineeringLevel {
    case junior, middle, senior
}

protocol SoftwareEngineerCompetencyMatrix {}

class JuniorSECompetencyMatrix: SoftwareEngineerCompetencyMatrix {}
class MiddleSECompetencyMatrix: SoftwareEngineerCompetencyMatrix {}
class SeniorSECompetencyMatrix: SoftwareEngineerCompetencyMatrix {}

protocol QACompetencyMatrix {}

class JuniorQACompetencyMatrix: QACompetencyMatrix {}
class MiddleQACompetencyMatrix: QACompetencyMatrix {}
class SeniorQACompetencyMatrix: QACompetencyMatrix {}

protocol CompetencyMatrix {
    func softwareEngineerCompetencyMatrix() -> SoftwareEngineerCompetencyMatrix
    func qaEngineerCompetencyMatrix() -> QACompetencyMatrix
}

/* Abstract Factory */
protocol Company {
    func resources(_ level: EngineeringLevel) -> CompetencyMatrix
}

final class Facebook: Company {
    private let juniorMatrix = JuniorCompetencyMatrix()
    private let middleMatrix = MiddleCompetencyMatrix()
    private let seniorMatrix = SeniorCompetencyMatrix()
    
    /* Factory Method */
    func resources(_ level: EngineeringLevel) -> CompetencyMatrix {
        switch level {
        case .junior:
            return juniorMatrix
        case .middle:
            return middleMatrix
        case .senior:
            return seniorMatrix
        }
    }
}

final class JuniorCompetencyMatrix: CompetencyMatrix {
    func softwareEngineerCompetencyMatrix() -> SoftwareEngineerCompetencyMatrix {
        return JuniorSECompetencyMatrix()
    }
    
    func qaEngineerCompetencyMatrix() -> QACompetencyMatrix {
        return JuniorQACompetencyMatrix()
    }
}

final class MiddleCompetencyMatrix: CompetencyMatrix {
    func softwareEngineerCompetencyMatrix() -> SoftwareEngineerCompetencyMatrix {
        return MiddleSECompetencyMatrix()
    }
    
    func qaEngineerCompetencyMatrix() -> QACompetencyMatrix {
        return MiddleQACompetencyMatrix()
    }
}

final class SeniorCompetencyMatrix: CompetencyMatrix {
    func softwareEngineerCompetencyMatrix() -> SoftwareEngineerCompetencyMatrix {
        return SeniorSECompetencyMatrix()
    }
    
    func qaEngineerCompetencyMatrix() -> QACompetencyMatrix {
        return SeniorQACompetencyMatrix()
    }
}

/* Usage: */

let company: Company = Facebook()

let seniorQA = company.resources(.senior).qaEngineerCompetencyMatrix()
let middleSE = company.resources(.middle).softwareEngineerCompetencyMatrix()

