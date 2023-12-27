<div class="flex  pt-1 px-2 " >
    <div class=" bg-sky-100 p-1 rounded-lg shadow-sm" >

        <span class="p-1 font-thin bg-sky-200 rounded-lg">Update</span>
        {{ \Carbon\Carbon::parse($product->created_at)->diffForhumans()  }}
    </div>
</div>
