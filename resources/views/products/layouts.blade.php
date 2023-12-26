<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="shortcut icon" href="{{ asset('store_log.png') }}">

        <title>Laravel</title>
				@vite('resources/css/app.css')

    </head>
    <body >
        <div class='flex flex-col min-h-screen w-full bg-slate-100 m-auto ' >

				    @yield('content')

        </div>
    </body>
</html>
