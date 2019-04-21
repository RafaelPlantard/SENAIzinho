//
//  Console.swift
//  SENAIzinho
//
//  Created by Rafael Ferreira on 4/21/19.
//

final class Console {
    static func readLine<T>() -> T {
        guard let line = Swift.readLine(), let castLine = line as? T else {
            fatalError()
        }

        return castLine
    }

    static func write(_ string: String) {
        print(string, separator: "", terminator: "")
    }

    static func writeLine(_ string: String) {
        print(string)
    }
}
