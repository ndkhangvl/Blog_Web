<template>
  <div class="flex lg:max-w-4xl max-w-3xl lg:flex-grow mx-auto">
  <div
    class="lg:bg-white lg:w-1/2 lg:p-8 lg:py-16 lg:px-12 space-y-7 marlene-rounded-l-lg shadow-sm w-max p-8 marlene-bg-glass-ex mx-auto">
    <div class="space-y-3.5">
      <p class="text-primary text-4xl mb-2 text-center">Đăng Ký</p>
    </div>
    <form>
      <div class="mb-6">
        <label for="email" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Tên tài khoản</label>
        <input type="email" id="email"
          class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
          placeholder="name@gmail.com" required>
      </div>
      <div class="mb-6">
        <label for="password" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Tên người
          dùng</label>
        <input type="password" id="password"
          class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
          required>
      </div>
      <div class="mb-6">
        <label for="password" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Mật khẩu</label>
        <input type="password" id="password"
          class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
          required>
      </div>
      <div class="mb-6">
        <label for="password" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Nhập lại mật
          khẩu</label>
        <input type="password" id="password"
          class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
          required>
      </div>
      <div class="block text-center ">
        <button
          class="tracking-widest bg-primary min-w-full h-12 focus:bg-secondary hover:bg-secondary text-white rounded-lg text-2xl marlene-btn"
          type="submit">Đăng Ký</button>
      </div>
    </form>
  </div>
</div>
</template> 
    
<script setup>

</script>
    
<style>

</style>