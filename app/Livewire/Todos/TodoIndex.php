<?php

namespace App\Livewire\Todos;

use App\Models\Todo;
use Livewire\Attributes\Title;
use Livewire\Component;

class TodoIndex extends Component
{
    #[Title('Korn-Hostinger')]

    public $todos ;
    public function mount(){

        $this->todos =Todo::with('user')->get() ;

    }
    public function render()
    {
        return view('livewire.todos.todo-index')->with(['button'=>'todo-task']);
    }
}
