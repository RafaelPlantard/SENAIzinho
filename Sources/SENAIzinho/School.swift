//
//  School.swift
//  SENAIzinho
//
//  Created by Rafael Ferreira on 4/21/19.
//

struct School {
    var students: [Student]
    var classrooms: [Classroom]

    // MARK: Initializer

    init() {
        students = []
        classrooms = []
    }

    // MARK: Functions

    func listStudents() {
        guard !students.isEmpty else {
            Console.writeLine("Não há alunos cadastrados ainda.")

            return Console.wait()
        }

        students.forEach { student in
            Console.writeLine(student.description)
        }

        Console.wait()
    }

    func listClassrooms() {
        guard !classrooms.isEmpty else {
            Console.writeLine("Não há salas cadastradas ainda.")

            return Console.wait()
        }

        classrooms.forEach { classroom in
            Console.writeLine(classroom.description)
        }

        Console.wait()
    }
}
