
import Foundation

/* Implementation */

enum EngineeringLevel {
    case junior, middle, senior
}

protocol SoftwareEngineerCompetencyMatrix {}

struct JuniorSECompetencyMatrix: SoftwareEngineerCompetencyMatrix {}
struct MiddleSECompetencyMatrix: SoftwareEngineerCompetencyMatrix {}
struct SeniorSECompetencyMatrix: SoftwareEngineerCompetencyMatrix {}

protocol QACompetencyMatrix {}

struct JuniorQACompetencyMatrix: QACompetencyMatrix {}
struct MiddleQACompetencyMatrix: QACompetencyMatrix {}
struct SeniorQACompetencyMatrix: QACompetencyMatrix {}

protocol CompetencyMatrix {
    func softwareEngineerCompetencyMatrix() -> SoftwareEngineerCompetencyMatrix
    func qaEngineerCompetencyMatrix() -> QACompetencyMatrix
}

/* Abstract Factory */
protocol Company {
    func resources(_ level: EngineeringLevel) -> CompetencyMatrix
}

struct Facebook: Company {
    /* Factory Method */
    func resources(_ level: EngineeringLevel) -> CompetencyMatrix {
        switch level {
        case .junior:
            return JuniorCompetencyMatrix()
        case .middle:
            return MiddleCompetencyMatrix()
        case .senior:
            return SeniorCompetencyMatrix()
        }
    }
}

struct JuniorCompetencyMatrix: CompetencyMatrix {
    func softwareEngineerCompetencyMatrix() -> SoftwareEngineerCompetencyMatrix {
        return JuniorSECompetencyMatrix()
    }
    
    func qaEngineerCompetencyMatrix() -> QACompetencyMatrix {
        return JuniorQACompetencyMatrix()
    }
}

struct MiddleCompetencyMatrix: CompetencyMatrix {
    func softwareEngineerCompetencyMatrix() -> SoftwareEngineerCompetencyMatrix {
        return MiddleSECompetencyMatrix()
    }
    
    func qaEngineerCompetencyMatrix() -> QACompetencyMatrix {
        return MiddleQACompetencyMatrix()
    }
}

struct SeniorCompetencyMatrix: CompetencyMatrix {
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

