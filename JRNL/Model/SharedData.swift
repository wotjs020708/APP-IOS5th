//
//  SharedData.swift
//  JRNL
//
//  Created by 어재선 on 5/16/24.
//

import UIKit

class SharedData {
    static let shared = SharedData()
    private var journalEntrles: [JournalEntry]
    
    private init() {
        journalEntrles = []
    }
    
    func numberOfJournalEntries() -> Int {
        journalEntrles.count
    }
    
    func getJournalEntry(index: Int) -> JournalEntry {
        journalEntrles[index]
    }
    
    func getAllJournalEntries() -> [JournalEntry] {
        let readOnlyJournalEntries = journalEntrles
        return readOnlyJournalEntries
    }
    
    func addJournalEntry(newJournalEntry: JournalEntry) {
        journalEntrles.append(newJournalEntry)
    }
    
    func removeJournalEntry(index: Int) {
        journalEntrles.remove(at: index)
    }
    
    func getDocumentDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func loadJournalEntriesData() {
        let pathDirectory = getDocumentDirectory()
        let fileURL = pathDirectory.appendingPathComponent("journalEntriesData")
        do {
            let data = try Data(contentsOf: fileURL)
            let journalEntriesData = try JSONDecoder().decode([JournalEntry].self, from: data)
            journalEntrles = journalEntriesData
        } catch {
            print("Failed to read JSON data: \(error.localizedDescription)")
        }
    }
    
    func saveJournalEntriesData() {
        let pathDirectory = getDocumentDirectory()
        try? FileManager.default.createDirectory(at: pathDirectory, withIntermediateDirectories: true)
        let filePath = pathDirectory.appendingPathComponent("journalEntriesData")
        let json = try? JSONEncoder().encode(journalEntrles)
        do {
            try json!.write(to: filePath)
        } catch {
            print("Failed to write JSON data: \(error.localizedDescription)")
        }
    }
}
