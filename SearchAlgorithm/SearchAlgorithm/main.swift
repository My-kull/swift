//
//  main.swift
//  SearchAlgorithm
//
//  Created by Micael Raste on 15.1.2024.
//

import Foundation

func LinearSearch(searchTerm: String, List: [String]) -> Int {
    for (index, word) in List.enumerated() {
            if word.lowercased() == searchTerm.lowercased() {
                return index
            }
        }
        return -1
}



let wordList = ["Variable", "Function", "Method", "Class", "Object", "Interface", "Module", "Package", "Library", "Framework", "Algorithm", "Data structure", "Array", "List", "Tuple", "Dictionary", "Set", "Queue", "Stack", "Linked list", "Pointer", "Loop", "Conditional", "Statement", "Expression", "Operator", "Operand", "Assignment", "Comparison", "Concatenation", "Inheritance", "Polymorphism", "Encapsulation", "Abstraction", "Constructor", "Destructor", "Exception", "Error handling", "Debugging", "Comment", "Documentation", "Syntax", "Compiler", "Interpreter", "Runtime", "IDE (Integrated Development Environment)", "API (Application Programming Interface)", "Version control", "Repository", "Branch", "Merge", "Commit", "Pull request", "Git", "GitHub", "Bitbucket", "Docker", "Virtualization", "Deployment", "Continuous integration", "Unit testing", "Integration testing", "Regression testing", "Test case", "Agile", "Scrum", "Waterfall", "Kanban", "Bug", "Feature", "Refactoring", "Code review", "Design pattern", "Singleton", "Factory method", "Observer", "MVC (Model-View-Controller)", "REST (Representational State Transfer)", "API endpoint", "HTTP", "JSON", "XML", "Database", "SQL", "NoSQL", "CRUD (Create, Read, Update, Delete)", "ORM (Object-Relational Mapping)", "Middleware", "Frontend", "Backend", "Full-stack", "Responsive design", "Mobile-first", "Progressive web app", "Cross-platform", "Framework", "Library", "Dependency", "Package manager", "Documentation"]


let searchResult = LinearSearch(searchTerm: "Array", List: wordList)

if searchResult != -1 {
    print("The word \(wordList[searchResult]) is found at index \(searchResult) in the list.")
} else {
    print("The word is not found in the list.")
}


func binarySearch<T: Comparable>(_ array: [T], target: T) -> Int? {
    var low = 0
    var high = array.count - 1

    while low <= high {
        let mid = low + (high - low) / 2

        if array[mid] == target {
            return mid
        } else if array[mid] < target {
            low = mid + 1
        } else {
            high = mid - 1
        }
    }

    return nil
}


let numberList = [4, 6, 7, 9, 11, 13, 16, 23, 24, 32]

if let index = binarySearch(numberList, target: 23) {
    print("\(numberList[index]) found at index \(index + 1)")
} else {
    print("Element not found")
}
