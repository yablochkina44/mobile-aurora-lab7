import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.Layouts 1.1
import QtQuick.LocalStorage 2.0

Item {
    property var db;

    Component.onCompleted: {
        db = LocalStorage.openDatabaseSync("notes3", "1.0");
        createNotesTable();
    }
    function createNotesTable() {
        db.transaction(function(tx) {
            tx.executeSql("CREATE TABLE IF NOT EXISTS notes (
                id INTEGER PRIMARY KEY AUTOINCREMENT,"
                + "note TEXT NOT NULL);");
        });
    }
    function getNotes(callback) {
        db.readTransaction(function(tx) {
            var result = tx.executeSql("SELECT * FROM notes;");
            callback(result.rows);
        });
    }

    function insertNote(note) {
        db.transaction(function(tx) {
           tx.executeSql("INSERT INTO notes (note) VALUES(?);", [note]);
        });
    }
    function deleteNote(id) {
        db.transaction(function(tx) {
            tx.executeSql("DELETE FROM notes WHERE id = ?;", [id]);
        });

}

}
