<div class="rounded-md bg-pink-50 p-4 w-4/5 sm:w-2/5 mx-auto mb-4" wire:key="{{ $todo->id }}">
    <div class="flex">
        <div class="ml-3 mt-1 flex-1 md:flex md:justify-between">
            <p class="text-sm font-bold text-pink-700">
                {{ $todo->name }} -  {{ Carbon\Carbon::parse($todo->updated_at)->format('d-m-Y H:i')  }}
            </p>

            <p class="mt-2 text-md md:ml-6 md:mt-0 flex-shrink-0">
                <a href="/" class="whitespace-nowrap font-medium text-pink-700 hover:text-pink-600 pr-2">
                    <i class="fa-solid fa-pen-to-square"></i>
                </a>

                <button
                    wire:click="delete({{ $todo }})"
                    type="submit"
                    class="whitespace-nowrap font-medium text-pink-700 hover:text-pink-600">
                    <i class="fa-solid fa-trash"></i>
                </button>
            </p>
        </div>
    </div>
</div>
