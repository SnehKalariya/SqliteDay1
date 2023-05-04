//
//  data.swift
//  SqliteDay1
//
//  Created by Sneh kalariya on 01/04/23.
//

import Foundation
import SQLite3
struct Model {
    var id : Int
    var name : String
}
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
    static func getData()-> [Model]{
        var arr = [Model]()
        let quary = "select name,id from students"
        var get: OpaquePointer?
        sqlite3_prepare(file, quary, -1, &get, nil)
        
        while sqlite3_step(get) == SQLITE_ROW {
            let id = sqlite3_column_int64(get, 1)
            print("id = \(id);",terminator: "" )
            
            if let cString = sqlite3_column_text(get,0){
                let name = String(cString: cString)
                arr.append(Model(id: Int(id), name: name))
            }
        }
        print("Get data")
        return arr
    }
    static func deleteData(name:String,id:Int){
        let quary = "DELETE FROM Students WHERE id = \(id)"
        var table: OpaquePointer?
        sqlite3_prepare(file, quary, -1, &table, nil)
        sqlite3_step(table)
        print("Delete Data")
    }
}
