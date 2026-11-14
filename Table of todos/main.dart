Text('Done', style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white))),
            ],
            rows: _todos.map((todo) {
              return DataRow(
                cells: [
                  DataCell(Text(todo['id'].toString())),
                  DataCell(Text(todo['title'])),
                  DataCell(Text(todo['description'])),
                  DataCell(Text(todo['date'])),
                  DataCell(Text(todo['done'] == true ? '✔️' : '✖️')),
                ],
              );
            }).toList(), // <-- Added .toList() here
          ),
        )
        ),
        floatingActionButton: IconButton(
          onPressed: () {},
          icon: Icon(Icons.edit, color: Colors.red.shade900),
        ),
      ),
    );
  }
}
