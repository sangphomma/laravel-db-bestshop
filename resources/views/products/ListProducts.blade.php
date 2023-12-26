<div class='flex flex-col h-auto w-[90%] md:max-w-4xl mx-auto' >
    @forelse ($products as $product )
        <div class='py-2 px-3 my-2 bg-red-100 border-2 border-red-800 text-light text-2xl'>{{ $product->name }}</div>

    @empty
        <div class='py-2 px-3 bg-red-100 border-2 border-red-800 text-light text-2xl'>No products</div>
    @endforelse
</div>
