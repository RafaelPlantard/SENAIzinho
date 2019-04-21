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
            return Console.writeLine("Não há alunos cadastrados ainda.")
        }

        students.forEach { student in
            Console.writeLine(student.description)
        }
    }

    func listClassrooms() {
        guard !classrooms.isEmpty else {
            return Console.writeLine("Não há salas cadastradas ainda.")
        }

        classrooms.forEach { classroom in
            Console.writeLine(classroom.description)
        }
    }
}
