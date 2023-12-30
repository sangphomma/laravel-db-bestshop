<?php

namespace App\Livewire\Todos;

use Livewire\Attributes\Layout;
use Livewire\Component;

class TodoCreate extends Component
{
    #[Layout('layouts.app')]
    public function render()
    {

        return view('livewire.todos.todo-create');
    }
}
