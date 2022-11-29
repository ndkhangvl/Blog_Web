<template>
  <div class="flex lg:max-w-4xl max-w-3xl lg:flex-grow mx-auto">
  <div
    class="lg:bg-white lg:w-1/2 lg:p-8 lg:py-16 lg:px-12 space-y-7 marlene-rounded-l-lg shadow-sm w-max p-8 marlene-bg-glass-ex mx-auto">
    <div class="space-y-3.5">
      <p class="text-primary text-4xl mb-2 text-center">Đăng Ký</p>
    </div>
    <Form :validation-schema="formSchema" @submit="register">
      <div class="mb-6">
        <label for="text" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Họ và tên</label>
        <Field type="text" name="name"
          class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
          placeholder="Nhập họ và tên"  v-model= "name" />
          <ErrorMessage name="name" class="mt-2 text-xs text-red-600 dark:text-red-400" />
      </div>
      <div class="mb-6">
        <label for="text" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Tên tài khoản</label>
        <Field type="text" name="username"
          class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
          placeholder="Nhập tên tài khoản" v-model= "username" />
          <ErrorMessage name="username" class="mt-2 text-xs text-red-600 dark:text-red-400" />
      </div>
      <div class="mb-6">
        <label for="password" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Mật khẩu</label>
        <Field type="password" name="password"
          class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
          placeholder="Nhập mật khẩu" v-model= "password" />
          <ErrorMessage name="password" class="mt-2 text-xs text-red-600 dark:text-red-400" />
      </div>
      <div class="mb-6">
        <label for="password" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Nhập lại mật
          khẩu</label>
        <Field type="password" name="repassword"
          class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
          placeholder="Nhập lại mật khẩu" v-model= "repassword" />
          <ErrorMessage name="repassword" class="mt-2 text-xs text-red-600 dark:text-red-400" />
      </div>
      <div class="col-end-8 col-span-3">
                    <a class="">Có tài khoản?  </a>
                    <router-link to="/login" class="text-primary">Đăng nhập</router-link>
                </div>
      <div class="block text-center ">
        <button
          class="tracking-widest bg-primary min-w-full h-12 focus:bg-secondary hover:bg-secondary text-white rounded-lg text-2xl marlene-btn"
          type="submit">Đăng Ký</button>
      </div>
      <!-- <p>{{ message }}</p> -->
    </Form>
    <!-- <div v-if="error" class="text-red-600"> {{ error.message }}</div> -->
  </div>
</div>
</template> 
    
<script>
import * as yup from 'yup';
import { Form, Field, ErrorMessage } from 'vee-validate';
import { blogService } from '@/services/blog.service';
export default {
  data() {
    const formSchema = yup.object().shape({
      username: yup
        .string()
        .required('Tên tài khoản không thể bỏ trống.')
        .min(2, "Tên không thể ít hơn 2 kí tự")
        .matches(/^(\S+$)/g, 'Tên đăng nhập không bao gồm phím cách')
        .max(50, "Tên không thể quá 50 kí tự"),
      name: yup
        .string()
        .required('Tên không thể bỏ trống.')
        .min(2, "Tên không thể ít hơn 2 kí tự")
        .max(50, "Tên không thể quá 50 kí tự"),
      password: yup
        .string()
        .required('Mật khẩu không thể bỏ trống'),
      repassword: yup
        .string()
        .required('Nhập lại mật khẩu không thể bỏ trống')
        .oneOf([yup.ref('password'), null], 'Mật khẩu không trùng khớp'),
    });
    return {
      username: "",
      name: "",
      password: "",
      repassword: "",
      error: "",
      formSchema,
    };
  },
  methods: {
    async register() {
            try {
                await blogService.signUp({
                  user_name: this.name,
                  user_usname: this.username,
                  user_passwd: this.password,
                });
                this.$toast.success('Đăng kí tài khoản thành công');
                this.message = 'Tài khoản được thêm thành công.';
                this.$router.push('/login');
            } catch (error) {
                console.log(error);
                this.$toast.error("Tên tài khoản đã tồn tại");
            }
        },
  },

  components: { Form, Field, ErrorMessage }

};
</script>
    
<style>

</style>