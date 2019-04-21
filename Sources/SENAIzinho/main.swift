var school = School()
var option = 0

repeat {
    Console.writeLine("1. Cadastrar Aluno")
    Console.writeLine("2. Cadastrar Sala")
    Console.writeLine("3. Alocar Aluno")
    Console.writeLine("4. Remover Aluno")
    Console.writeLine("5. Verificar Salas")
    Console.writeLine("6. Verificar Alunos")
    Console.writeLine("0. Sair")
    Console.write("Escolha a opção desejada (0 - 6): ")

    option = Console.readLine()

    Console.clear()

    switch option {
    case 1: school.students.append(Student.register())
    case 2: school.classrooms.append(Classroom.register())
    case 3: Classroom.addStudent(from: &school)
    case 4: Classroom.removeStudent(from: &school)
    case 5: school.listClassrooms()
    case 6: school.listStudents()
    default: break
    }

    Console.clear()
} while (option >= 1 && option <= 6)
