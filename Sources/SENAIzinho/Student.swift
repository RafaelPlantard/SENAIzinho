//
//  Student.swift
//  SENAIzinho
//
//  Created by Rafael Ferreira on 4/21/19.
//

import struct Foundation.Date
import class Foundation.DateFormatter

final class Student: CustomStringConvertible {
    let name: String
    let birthday: Date
    let course: String
    var classroomNumber: Int

    // MARK: Initializer

    init(name: String, birthday: String, course: String) {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"

        self.name = name
        self.birthday = formatter.date(from: birthday) ?? Date()
        self.course = course
        self.classroomNumber = -1
    }

    // MARK: CustomStringConvertible conforms

    var description: String {
        let classroomNumberString = classroomNumber == -1 ? "Sem sala" : "Número da Sala: \(classroomNumber)"

        return "Nome Completo: \(name); \(classroomNumberString)"
    }

    // MARK: Static functions

    static func register() -> Student {
        Console.write("Nome Completo: ")
        let name: String = Console.readLine()

        Console.write("Data de Nascimento (DD/MM/AAAA): ")
        let birthdayString: String = Console.readLine()

        Console.write("Curso: ")
        let course: String = Console.readLine()

        return Student(name: name, birthday: birthdayString, course: course)
    }
}
