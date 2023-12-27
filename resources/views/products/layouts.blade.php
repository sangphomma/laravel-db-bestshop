<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="shortcut icon" href="{{ asset('store_log.png') }}">

        <title>{{ env('APP_NAME') }}</title>
				@vite('resources/css/app.css')

    </head>
    <body >
        <div class='flex flex-col min-h-screen w-full bg-slate-100 m-auto ' >

				    @yield('content')
<div class="h-8 w-full shadow-inner bg-sky-700 flex justify-center items-center fixed bottom-0 right-0 text-white" ><h2>footer</h2></div>
        </div>
    </body>
</html>
