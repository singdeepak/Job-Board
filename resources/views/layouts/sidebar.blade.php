<aside id="sidebar"
           class="fixed md:relative md:translate-x-0 transform -translate-x-full transition-transform duration-300 ease-in-out w-64 bg-white dark:bg-gray-800 shadow-lg z-30 h-full md:h-auto md:block">
      <div class="p-4 text-xl font-bold text-gray-800 dark:text-white">Admin</div>
      <nav class="mt-4 space-y-1">
        <a href="{{ route('dashboard') }}"
           class="block px-6 py-2 text-gray-700 dark:text-gray-200 hover:bg-gray-200 dark:hover:bg-gray-700 rounded">Dashboard</a>
        <a href="{{ route('job.index') }}"
           class="block px-6 py-2 text-gray-700 dark:text-gray-200 hover:bg-gray-200 dark:hover:bg-gray-700 rounded">Jobs</a>
      </nav>
</aside>