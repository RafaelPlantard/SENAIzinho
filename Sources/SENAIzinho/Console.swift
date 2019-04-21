//
//  Console.swift
//  SENAIzinho
//
//  Created by Rafael Ferreira on 4/21/19.
//

import class Foundation.NSString
import class Foundation.Process

enum Console {
    static func clear() {
        let clearScreen = Process()
        clearScreen.launchPath = "/usr/bin/clear"
        clearScreen.launch()
        clearScreen.waitUntilExit()
    }

    static func readLine<T>() -> T {
        guard let line = Swift.readLine() else {
            fatalError("Fail to read line")
        }

        guard let castLine = line as? T else {
            fatalError("Fail to cast to \(T.self)")
        }

        return castLine
    }

    static func readLine() -> Int {
        let line: NSString = readLine()

        return line.integerValue
    }

    static func wait() {
        write("Pressione qualquer tecla para continuar...")

        _ = readLine() as String
    }

    static func write(_ string: String) {
        print(string, separator: "", terminator: "")
    }

    static func writeLine(_ string: String) {
        print(string)
    }
}
