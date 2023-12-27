<div class='grid sm:grid-cols-2 md:grid-cols-3 xl:grid-cols-4 gap-2 h-auto w-[90%] md:max-w-4xl mx-auto' >
    @forelse ($products as $product )
        <div class='flex flex-col my-2 border-4 border-sky-50 sm:border-4 bg-gradient-to-br from-slate-100 to-white
        overflow-hidden shadow-lg '>
            <div class="flex-1 sm:h-1/2 over-hidden  items-center justify-center border-b-8 border-sky-200 " >
                @if ($product->cover)
                <a href={{ route('product.show', $product->id) }} target='bank' >
                    <img class="w-full h-full object-cover " src={{url('storage/'. $product->cover)}} alt="{{ $product->name }}" />
                </a>
                @endif
            </div>

            <div class="flex-1 flex flex-col text-sm " >
                @include('products.elements.product-list-likes-views')

                @include('products.elements.product-list-created_at')
                @include('products.elements.product-list-price')
                <div class="py-3 px-2 mt-2 sm:mt-0 bg-sky-200 rounded-t-3xl shadow-md flex justify-center items-center" > {{ $product->name }} </div>
            </div>


           {{-- <div class="py-2 px-6 flex flex-wrap " >
            {product.images && product.images.map((item, index)=>(<img src={{ item }} alt="product.name" /> }
           </div> --}}

        </div>




    @empty
        <div class='py-2 px-3 bg-red-100 border-2 border-red-800 text-light text-2xl'>No products</div>
    @endforelse
</div>
