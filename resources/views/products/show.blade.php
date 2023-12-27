@extends('products.layouts')

@section('content')
    @include('products.Heads')
    @include('products.Hero')










    <div class='grid md:grid-cols-12 justify-between bg-gradient-to-b from-white to-blue-100 shadow-sm gap-2 h-auto w-full md:max-w-4xl mx-auto' >
        @if(!empty($product))



        <div class="md:col-span-8 col-span-12  flex justify-end content-end  " >
            <div class="py-2 px-4 flex flex-col min-h-screen w-full bg-gradient-to-b from-white to-slate-100" >

                <div class="w-full text-3xl font-semibold font-Prompt" ><h2>{{ $product->name }}</h2></div>
               <div class="flex gap-1 " >
                    @forelse ($product->tags as $tag )
                        <span class="badge mr-2" >{{ $tag }}</span>
                    @empty
                        " "
                    @endforelse
               </div>
                <div class='w-full my-2 shadow-sm'>
                    <img class="w-full h-full object-cover " src={{url('storage/'. $product->cover)}} alt="{{ $product->name }}" />
                </div>
                <div class="my-2 mx-1 px-1 py-3 text-justify leading-6 text-xs font-light text-gray-700" >
                    <p >{{  $product->desc }}</p>
                </div>
                <div class='w-full my-2'>
                    @forelse ($product->images as $image )


                        <img class="w-full object-cover " src={{url('storage/'. $image)}} alt="{{ $product->name }}" />

                    @empty
                        <h2 >no images show</h2>
                    @endforelse
                </div>
            </div>


        </div>
        <div class="md:col-span-3 col-span-12" >

            <div class="flex min-h-screen w-full bg-sky-50" ></div>
        </div>



        @else
            <div class='py-2 px-3 bg-red-100 border-2 border-red-800 text-light text-2xl'>No products</div>
        @endif
    </div>

@endsection
