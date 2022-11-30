<script>
import * as yup from 'yup';
import { Form, Field, ErrorMessage } from 'vee-validate';
import { blogService } from '@/services/blog.service';
import { useAuthStore } from '@/store/auth';
import { mapState } from 'pinia';
export default {
    components: {
        Form,
        Field,
        ErrorMessage,
    },
    props: {
        user: { type: Object, required: true }
    },
    // data() {
    //     return {
    //         // Props are supposed to be immutable, therefore create
    //         // a local variable contactLocal and bind it to the form
    //         userLocal: { ...this.user },
    //     };
    // },
    data() {
        const formSchema = yup.object().shape({
            password: yup
                .string()
                .required('Mật khẩu không thể bỏ trống'),
            repassword: yup
                .string()
                .required('Nhập lại mật khẩu không thể bỏ trống')
                .oneOf([yup.ref('password'), null], 'Mật khẩu không trùng khớp'),
        });
        const formSchemaDetail = yup.object().shape({
            name: yup
                .string()
                .required('Tên không thể bỏ trống'),
        });
        return {
            // Props are supposed to be immutable, therefore create
            // a local variable contactLocal and bind it to the form
            userLocal: { ...this.user },
            password: "",
            repassword: "",
            name: "",
            error: "",
            formSchema,
            formSchemaDetail,
        };
    },
    methods: {
        async updatepasswd() {
            try {
                await blogService.changepw(this.user.user_usname, {
                    user_passwd: this.password,
                });
                this.$router.push('/');
                this.$toast.success('Thay đổi mật khẩu thành công');
            } catch (error) {
                console.log(error);
                console.log("user id: ", this.user.user_usname);
            }

        },

        async updatedetail() {
            try {
                await blogService.changename(this.user.user_usname, {
                    user_name: this.name,
                });
                this.$router.push('/');
                this.$toast.success('Cập nhật thông tin thành công');
            } catch (error) {
                console.log(error);
            }
        },
        checkUser() {
            try {
                if (this.userAuth.data.user_usname == this.user.user_usname) {
                    return true;
                } else {
                    return;
                }
            } catch (error) {

            }
        },

    },
    computed: {
        isAuth() {
            return useAuthStore().userAuth != null;
        },
        ...mapState(useAuthStore, ["userAuth"]),
    }
};
</script>

<template>
    <div class="rounded-lg shadow-lg bg-white my-2 grid grid-flow-row">
        <div class="p-7">
            <div class="text-gray-900 text-base font-medium mb-2 text-center">
                {{ user.user_name }}
            </div>
            <div class="text-gray-700 text-sm text-center">
                @{{ user.user_usname }}
            </div>
        </div>
        <div class="p-2" v-if="isAuth && checkUser()">
            <Form :validation-schema="formSchemaDetail" @submit="updatedetail">
                <div class="mb-6">
                    <label for="text" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Tên hiển thị
                        mới</label>
                    <Field type="text" name="name"
                        class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                        placeholder="Nhập tên mới" v-model="name" />
                </div>
                <button
                    class="tracking-widest bg-primary min-w-full h-12 focus:bg-secondary hover:bg-secondary text-white rounded-lg text-2xl marlene-btn"
                    type="submit">Cập nhật</button>
            </Form>
            <hr class="my-4 mx-auto w-48 h-1 bg-gray-500 rounded border-0 md:my-10 dark:bg-gray-700">
            <Form :validation-schema="formSchema" @submit="updatepasswd">
                <div class="mb-6">
                    <label for="text" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Mật khẩu
                        mới</label>

                    <Field type="password" name="password"
                        class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                        placeholder="Nhập mật khẩu" v-model="password" />
                    <ErrorMessage name="password" class="text-sm text-red-800" />
                </div>
                <div class="mb-6">
                    <label for="text" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Nhập lại mật
                        khẩu mới</label>
                    <Field type="password" name="repassword"
                        class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                        placeholder="Nhập lại mật khẩu" v-model="repassword" />
                    <ErrorMessage name="repassword" class="text-sm text-red-800" />
                </div>
                <div class="block text-center ">
                    <button
                        class="tracking-widest bg-primary min-w-full h-12 focus:bg-secondary hover:bg-secondary text-white rounded-lg text-2xl marlene-btn"
                        type="submit">Đổi mật khẩu</button>
                </div>
            </Form>
        </div>
    </div>
</template>
<style>
.object {
    text-align: justify;
}
</style>