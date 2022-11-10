pragma solidity ^0.8.13;


contract MakeTodos {

    // our todo var
    struct TODOLIST {
        string name;
        bool status;
    }

    TODOLIST[] public todo;

    function createDoList (string memory _text, bool _status) public {
        // ways of insertin into structs;
       
        todo.push(TODOLIST(_text, _status));
        // or
        // todo.push(TODOLIST({text:_text, status: _status}));
        // or
        // TODOLIST oneTODO;
        // oneTODO.text = _text;
        // todos.push(oneTODO);
    }

    // solidity automatically creates a getter
    // function
    
    function getTodByIndex(uint _index) public view returns (string memory text, bool status) {
        TODOLIST storage todoByIndex = todo[_index];
        return (todoByIndex.name, todoByIndex.status);
    }

    function updateTodoName(string memory _text, uint _indexTodo) public returns(bool) {
        TODOLIST storage currentTodo = todo[_indexTodo];
        currentTodo.name = _text;
        return true;
    }

    // updating the state of the todo
    function updateStatus(uint _index, bool _status) public returns(bool) {
        TODOLIST storage oneTodo = todo[_index];
        oneTodo.status = _status;
    }

    function deleteTodo(uint _index) public returns(bool) {
        delete todo[_index];
        return true;
    }
}