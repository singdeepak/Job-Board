<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    @vite(['resources/css/app.css', 'resources/js/app.js'])
</head>
<body class="font-sans antialiased bg-gray-100 dark:bg-gray-900">
    @include('layouts.navigation')

    <div class="flex min-h-screen">
        @include('layouts.sidebar') 

        <div class="flex-1 p-6 overflow-y-auto">
            @yield('content') 
        </div>
    </div>
</body>
</html>
