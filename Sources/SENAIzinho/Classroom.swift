//
//  Classroom.swift
//  SENAIzinho
//
//  Created by Rafael Ferreira on 4/21/19.
//

final class Classroom: CustomStringConvertible {
    let classroomNumber: Int
    let totalCapacity: Int
    var students: [String]

    // MARK: Computed variables

    var currentCapacity: Int { return totalCapacity - students.count  }

    // MARK: Initializer

    init(classroomNumber: Int, totalCapacity: Int) {
        self.classroomNumber = classroomNumber
        self.totalCapacity = totalCapacity
        self.students = []
    }

    // MARK: CustomStringConvertible conforms

    var description: String {
        return "Número: \(classroomNumber); Capacidade Total: \(totalCapacity); Capacidade Atual: \(currentCapacity)"
    }

    // MARK: Static functions

    static func register() -> Classroom {
        Console.write("Número da sala: ")
        let classroomNumber: Int = Console.readLine()

        Console.write("Capacidade total: ")
        let totalCapacity: Int = Console.readLine()

        return Classroom(classroomNumber: classroomNumber, totalCapacity: totalCapacity)
    }

    static func addStudent(from school: inout School) {
        if school.students.isEmpty {
            return Console.writeLine("Não há alunos cadastrados ainda.")
        }

        if school.classrooms.isEmpty {
            return Console.writeLine("Não há salas cadastradas ainda.")
        }

        school.students.enumerated().forEach { (index, student) in
            Console.writeLine("\(index + 1). \(student.name)")
        }

        Console.writeLine("0. Sair")
        Console.write("Aluno a alocar (0 - \(school.students.count)): ")

        let studentIndex: Int = Console.readLine() - 1

        if school.students.indices.contains(studentIndex) {
            let student = school.students[studentIndex]

            school.classrooms.enumerated().forEach { (index, classroom) in
                Console.writeLine("\(index + 1). Há \(classroom.currentCapacity) vagas")
            }

            Console.writeLine("0. Sair")
            Console.write("Sala na qual alocará aluno (0 - \(school.classrooms.count)): ")

            let classroomIndex: Int = Console.readLine() - 1

            if school.classrooms.indices.contains(classroomIndex) {
                let classroom = school.classrooms[classroomIndex]

                if classroom.currentCapacity > 0 {
                    classroom.students.append(student.name)
                    student.classroomNumber = classroom.classroomNumber
                }
            }
        }
    }

    static func removeStudent(from school: inout School) {
        if school.students.isEmpty {
            return Console.writeLine("Não há alunos cadastrados ainda.")
        }

        if school.classrooms.isEmpty {
            return Console.writeLine("Não há salas cadastradas ainda.")
        }

        school.students.enumerated().forEach { (index, student) in
            Console.writeLine("\(index + 1). \(student.name)")
        }

        Console.writeLine("0. Sair")
        Console.write("Aluno a desalocar (0 - \(school.students.count)): ")

        let studentIndex: Int = Console.readLine() - 1

        if school.students.indices.contains(studentIndex) {
            let student = school.students[studentIndex]

            if let classroom = school.classrooms
                .first(where: { classroom in classroom.classroomNumber == student.classroomNumber }) {
                student.classroomNumber = -1
                classroom.students.remove(at: studentIndex)
            }
        }
    }
}
