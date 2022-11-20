<template>
    <div class="flex lg:max-w-4xl max-w-3xl lg:flex-grow">
        <div
            class="lg:bg-white lg:w-1/2 lg:p-8 lg:py-16 lg:px-12 space-y-7 marlene-rounded-l-lg shadow-sm w-max p-8 marlene-bg-glass-ex">
            <div class="space-y-3.5">
                <p class="mb-2 text-primary text-4xl">Đăng Nhập</p>
            </div>
            <form class="space-y-8">
                <div class="space-y-6">
                    <div class="block ">
                        <input
                            class="border min-w-full border-gray focus:border-primary rounded-lg appearance-none p-1 pl-2 h-12 focus:outline-none focus:ring-1 focus:ring-primary"
                            placeholder="Nhập tên tài khoản" type="email">
                    </div>
                    <div class="block ">
                        <input
                            class="border min-w-full border-gray focus:border-primary rounded-lg appearance-none p-1 pl-2 h-12 focus:outline-none focus:ring-1 focus:ring-primary"
                            placeholder="Nhập mật khẩu" type="password">
                    </div>
                    <div class="grid grid-cols-7 gap-4">
                        <div class="col-start-1 col-end-4">
                            <label class="flex items-center space-x-3">
                                <input type="checkbox" name="checked-demo" value="1"
                                    class="form-tick appearance-none h-4 w-4 border border-gray rounded-md checked:bg-primary checked:border-transparent focus:outline-none bg-white">
                                <span class="text-blue-gray font-medium">nhớ mật khẩu</span>
                            </label>
                        </div>
                        <div class="col-end-8 col-span-3">
                            <a class="text-primary" href="">Đăng Nhập</a>
                            <a class=""> / </a>
                            <router-link to="/register" class="text-primary">Đăng Ký</router-link>
                        </div>
                    </div>
                </div>
                <div class="block text-center ">
                    <button
                        class="tracking-widest bg-primary min-w-full h-12 focus:bg-secondary hover:bg-secondary text-white rounded-lg text-2xl marlene-btn"
                        type="submit">Đăng Nhập</button>
                </div>

            </form>
        </div>
    </div>
</template>
  
<script setup>
</script>
  
<style>

</style>