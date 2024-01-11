//
//  main.swift
//  Algorithm
//
//  Created by Micael Raste on 8.1.2024.
//

import Foundation

func createListUpToN(_ n: Int) -> [Int] {
    guard n > 0 else {
        print("Invalid input. Please provide a positive integer.")
        return []
    }
    
    var myList: [Int] = []

    for i in 1...n {
        myList.append(i)
    }
    
    return myList
}


func randomizeList<T>(_ list: [T]) -> [T] {
    var randomizedList = list
    let count = list.count

    for i in 0..<(count - 1) {
        let randomIndex = Int.random(in: i..<count)
        if i != randomIndex {
            randomizedList.swapAt(i, randomIndex)
        }
    }

    return randomizedList
}


func selectionSort<T: Comparable>(_ list: [T]) -> [T] {
    guard list.count > 1 else {
        return list
    }

    var sortedList = list

    for currentIndex in 0..<sortedList.count - 1 {
        var minIndex = currentIndex

        for searchIndex in currentIndex + 1..<sortedList.count {
            if sortedList[searchIndex] < sortedList[minIndex] {
                minIndex = searchIndex
            }
        }

        if currentIndex != minIndex {
            sortedList.swapAt(currentIndex, minIndex)
        }
    }

    return sortedList
}


func IsSorted<T: Comparable>(_ array: [T]) -> Bool {
    return array == array.sorted() //sorts the list
}

func bogoSort<T: Comparable>(_ array: [T]) -> [T] {
    var shuffledArray = array
    
    while !IsSorted(shuffledArray) {
        shuffledArray.shuffle() //shuffles until the list matches the sorted list
    }
    
    return shuffledArray
}


func bubbleSort<T: Comparable>(_ array: [T]) -> [T] {
    var sortedArray = array // Create a mutable copy of the constant array

    let n = sortedArray.count

    for i in 0..<n {
        // Last i elements are already sorted, so we don't need to check them
        for j in 0..<n-i-1 {
            if sortedArray[j] > sortedArray[j+1] {
                // Swap the elements if they are in the wrong order
                let temp = sortedArray[j]
                sortedArray[j] = sortedArray[j+1]
                sortedArray[j+1] = temp
            }
        }
    }

    return sortedArray
}


func insertionSort<T: Comparable>(_ array: [T]) -> [T] {
    var mutableList = array // Create a mutable copy of the constant array
    
    let n = mutableList.count

    for i in 1..<n {
        var j = i
        // Swap the elements if they are in the wrong order
        while j > 0 && mutableList[j] < mutableList[j - 1] {
            mutableList.swapAt(j, j - 1)
            j -= 1
        }
    }
    
    return mutableList
}


func quicksort<T: Comparable>(_ array: [T]) -> [T] {
    guard array.count > 1 else { return array }
    
    let pivot = array[array.count / 2]
    let less = array.filter { $0 < pivot }
    let equal = array.filter { $0 == pivot }
    let greater = array.filter { $0 > pivot }
    
    return quicksort(less) + equal + quicksort(greater)
}


let n=10
let listUpToN = createListUpToN(n)
let randomizedList = randomizeList(listUpToN)
let sortedNumbers = selectionSort(randomizedList)
let BogoSortedList = bogoSort(randomizedList)
let BubbleSortedList = bubbleSort(randomizedList)
let InsertionSortedList = insertionSort(randomizedList)
let QuickSortedList = quicksort(randomizedList)
print("Original List: \(listUpToN)")
print("Randomized List: \(randomizedList)")
print("Sorted List: \(sortedNumbers)")
print("BogoSorted List: \(BogoSortedList)")
print("BubbleSorted List: \(BubbleSortedList)")
print("InsertionSorted List: \(InsertionSortedList)")
print("QuickSorted List: \(QuickSortedList)")
