<div class="flex-1 flex justify-between pt-1 px-2 " >
    <div class="  p-1 rounded-lg " >
        <span class="p-1 font-thin bg-sky-200 rounded-lg">Price </span>

    </div>
    <div class='flex gap-1 font-Prompt items-baseline' >

        {{-- {{ Number::currency($product->price, '')  }} --}}
        {{  number_format($product->price, 2) }}
        <span >
            {{-- <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
                <path stroke-linecap="round" stroke-linejoin="round" d="M12 6v12m-3-2.818.879.659c1.171.879 3.07.879 4.242 0 1.172-.879 1.172-2.303 0-3.182C13.536 12.219 12.768 12 12 12c-.725 0-1.45-.22-2.003-.659-1.106-.879-1.106-2.303 0-3.182s2.9-.879 4.006 0l.415.33M21 12a9 9 0 1 1-18 0 9 9 0 0 1 18 0Z" />
              </svg> --}}

              <img src={{ asset('bahtSymbol.png') }} class="h-6" />

        </span>
    </div>
</div>
