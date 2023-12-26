<div class='grid sm:grid-cols-2 md:grid-cols-3 xl:grid-cols-4 gap-2 h-auto w-[90%] md:max-w-4xl mx-auto' >
    @forelse ($products as $product )
        <div class='flex flex-col my-2 bg-gradient-to-br from-slate-100 to-slate-200
        overflow-hidden shadow-lg border-1 border-slate-200'>
            <div class="flex-1 sm:h-1/2 over-hidden  items-center justify-center " >
                @if ($product->cover)
                <img class="w-full h-full object-cover " src={{url('storage/'. $product->cover)}} alt="{{ $product->name }}" />
                @endif
            </div>
            <div class="flex-1 flex flex-col  " >
                <div class="flex-1  py-1 px-4 " >
                        <div class=" bg-sky-100 p-1 rounded-lg shadow-sm" >

                            <span class="p-1 font-thin bg-sky-200 rounded-lg">Update</span>
                            {{ \Carbon\Carbon::parse($product->created_at)->diffForhumans()  }}
                        </div>
                </div>
                <div class="py-1 px-4" > {{ $product->name }} </div>
            </div>


           {{-- <div class="py-2 px-6 flex flex-wrap " >
            {product.images && product.images.map((item, index)=>(<img src={{ item }} alt="product.name" /> }
           </div> --}}

        </div>




    @empty
        <div class='py-2 px-3 bg-red-100 border-2 border-red-800 text-light text-2xl'>No products</div>
    @endforelse
</div>
