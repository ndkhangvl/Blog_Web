<template>

  <nav class="p-3 border-gray-200 rounded bg-gray-50 dark:bg-gray-800 dark:border-gray-700">
    <div class="container flex flex-wrap items-center justify-between mx-auto">
      <a v-on:click="moveToHome" class="flex items-center select-none">
        <img src="/blogweb.png" class="h-6 mr-3 sm:h-10" alt="Flowbite Logo" />
        <span class="self-center text-xl font-semibold whitespace-nowrap dark:text-white">Blog Site</span>
      </a>
      <a v-on:click="moveToPostList" class="">
        <span class="btn btn-outline-secondary text-white bg-blue-700">Bài viết</span>
      </a>
      <a v-on:click="moveToUserList" class="">
        <span class="btn btn-outline-secondary text-white bg-blue-700">Người dùng</span>
      </a>
      <div v-if="isAuth" class="hidden w-full md:block md:w-auto" id="navbar-solid-bg">
        <ul
          class="flex flex-col mt-4 rounded-lg bg-gray-50 md:flex-row md:space-x-8 md:mt-0 md:text-sm md:font-medium md:border-0 md:bg-transparent dark:bg-gray-800 md:dark:bg-transparent dark:border-gray-700">
          <li>
            <a v-on:click="moveToBlogCreate"
              class="select-none block py-2 pl-3 pr-4 text-gray-700 rounded hover:bg-gray-100 md:hover:bg-transparent md:border-0 md:hover:text-blue-700 md:p-0 dark:text-gray-400 md:dark:hover:text-white dark:hover:bg-gray-700 dark:hover:text-white md:dark:hover:bg-transparent">Thêm
              Bài Viết</a>
          </li>
          <li>
            <a v-on:click="logout"
              class="select-none block py-2 pl-3 pr-4 text-gray-700 rounded hover:bg-gray-100 md:hover:bg-transparent md:border-0 md:hover:text-blue-700 md:p-0 dark:text-gray-400 md:dark:hover:text-white dark:hover:bg-gray-700 dark:hover:text-white md:dark:hover:bg-transparent">Đăng
              Xuất</a>
          </li>
          <li>
            <a v-on:click="moveToUserPage"
              class="select-none block py-2 pl-3 pr-4 text-gray-700 rounded hover:bg-gray-100 md:hover:bg-transparent md:border-0 md:hover:text-blue-700 md:p-0 dark:text-gray-400 md:dark:hover:text-white dark:hover:bg-gray-700 dark:hover:text-white md:dark:hover:bg-transparent"> {{this.userAuth.data.user_usname}}</a>
          </li>
        </ul>
      </div>
      <div v-else class="hidden w-full md:block md:w-auto" id="navbar-solid-bg">
        <ul
          class="flex flex-col mt-4 rounded-lg bg-gray-50 md:flex-row md:space-x-8 md:mt-0 md:text-sm md:font-medium md:border-0 md:bg-transparent dark:bg-gray-800 md:dark:bg-transparent dark:border-gray-700">
          <li>
            <a href="/login"
              class="select-none block py-2 pl-3 pr-4 text-gray-700 rounded hover:bg-gray-100 md:hover:bg-transparent md:border-0 md:hover:text-blue-700 md:p-0 dark:text-gray-400 md:dark:hover:text-white dark:hover:bg-gray-700 dark:hover:text-white md:dark:hover:bg-transparent">Đăng
              Nhập</a>
          </li>
          <li>
            <a href="/register"
              class="select-none block py-2 pl-3 pr-4 text-gray-700 rounded hover:bg-gray-100 md:hover:bg-transparent md:border-0 md:hover:text-blue-700 md:p-0 dark:text-gray-400 md:dark:hover:text-white dark:hover:bg-gray-700 dark:hover:text-white md:dark:hover:bg-transparent">Đăng
              Ký</a>
          </li>
        </ul>
      </div>

    </div>
  </nav>

</template> 
  
<style>
.navbar-brand {
  font-family: 'Lato', sans-serif;
  color: grey;
  font-size: 50px;
  margin: 0px;
}
</style>
  
<script>
import { useAuthStore } from '@/store/auth';
import { mapActions, mapState } from 'pinia';
export default {
  methods: {
    ...mapActions(useAuthStore, { _logout: "logout" }),
    logout() {
      this._logout();
      this.$router.push("/");
    },
    moveToBlogCreate() {
      this.$router.push("/blogpost");
    },
    moveToHome() {
      this.$router.push("/");
    },
    moveToPostList() {
      this.$router.push("/posts");
    },
    moveToUserList() {
      this.$router.push("/users");
    },
    moveToUserPage() {
      this.$router.push(`/users/${this.userAuth.data.user_usname}`);
    }
  },
  computed: {
    ...mapState(useAuthStore, ["userAuth"]),
    isAuth() {
      return useAuthStore().userAuth != null;
    },
  },
}
</script>