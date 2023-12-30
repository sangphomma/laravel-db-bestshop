<div>
    <div class="text-center pb-10">
        {{-- <x-alert /> --}}

        <input
            class="rounded-md w-1/5 border-0 py-2 text-gray-900 placeholder:text-gray-400 sm:text-sm sm:leading-6"
            type="text"
            wire:model="name"
        />
        <x-button
            :click="'save'"
            :text="$button"
        />
        {{-- <div class="text-red-500">
            @error('name') <span class="error">{{ $todo->name }}</span> @enderror
        </div> --}}
    </div>
    @foreach($todos as $todo)
        <x-todo-item :todo="$todo"  />
        {{-- <div class='text-white' >{{ $todo->name }}</div> --}}
    @endforeach
</div>
