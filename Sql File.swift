//
//  Sql File.swift
//  SqliteDay1
//
//  Created by Sneh kalariya on 31/03/23.
//

import Foundation
import SQLite3

class sqlite {
    
    static var  file: OpaquePointer?
    
    static func createFile() {
        var x = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        x.appendPathComponent("My Sqlite File.db")
        sqlite3_open(x.path, &file)
        print(x.path)
        print("Create File")
        createTable()
    }
    
    static func createTable(){
        let quary = "Create Table if not exists Students (name text,id integer)"
        var table:  OpaquePointer?
        sqlite3_prepare(file, quary, -1, &table, nil)
        print("Create Table")
        sqlite3_step(table)
    }
    
    static func addData(name:String,id:Int){
        let quary = "insert into Students values ('\(name)',\(id))"
        var data: OpaquePointer?
        sqlite3_prepare(file, quary, -1, &data, nil)
        print("Add Data")
        sqlite3_step(data)
    }
    
    static func getData(){
        
    }
    
    static func deleteData(){
        
    }
   
}
