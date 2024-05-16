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
}
