<template>
    <Form :validation-schema="formSchema" @submit="createpost">
        <div class="mb-6">
            <label for="text" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Tiêu đề</label>
            <!-- <Field type="number" name="iduser"
                class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                placeholder="Nhập tiêu đề" v-model="iduser" /> -->
            <Field type="text" name="title"
                class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                placeholder="Nhập tiêu đề" v-model="title" />
            <ErrorMessage name="title" class="text-sm text-red-800" />
        </div>
        <div class="mb-6">
            <label for="text" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Bài viết</label>
            <Field type="text" name="post" as="textarea"
                class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                placeholder="Nhập bài viết" v-model="post" />
                <ErrorMessage name="post" class="text-sm text-red-800" />
        </div>
        <div class="block text-center ">
            <button
                class="tracking-widest bg-primary min-w-full h-12 focus:bg-secondary hover:bg-secondary text-white rounded-lg text-2xl marlene-btn"
                type="submit">Tạo bài viết</button>
        </div>
        <!-- <p>{{ message }}</p> -->
    </Form>
</template>
<script>
import * as yup from 'yup';
import { Form, Field, ErrorMessage } from 'vee-validate';
import { blogService } from '@/services/blog.service';
import { mapActions, mapState } from "pinia";
import { useAuthStore } from '@/store/auth';

export default {
    computed: {
    ...mapState(useAuthStore, ["userAuth"]),
    },

    mounted() {
        //const auth = useAuthStore();
        console.log("id in form: ",this.userAuth.data.user_id);

    },
    data() {
        const formSchema = yup.object().shape({
            // iduser: yup
            //     .string()
            //     .required('Tên tài khoản không thể bỏ trống.')
            //     .min(2, "Tiêu đề không thể ít hơn 2 kí tự")
            //     .max(50, "Tiêu đề không thể quá 50 kí tự"),
            title: yup
                .string()
                .required('Tên tiêu đề không thể bỏ trống.')
                .min(2, "Tiêu đề không thể ít hơn 2 kí tự")
                .max(50, "Tiêu đề không thể quá 50 kí tự"),
            post: yup
                .string()
                .required('Nội dung không thể bỏ trống.')
                .min(2, "Nội dung không thể ít hơn 2 kí tự"),
                //.max(50, "Tên không thể quá 50 kí tự"),
        });
        return {
            //iduser: "",
            title: "",
            post: "",
            error: "",
            formSchema,
        };
    },
    methods: {
        
        async createpost() {
            try {
                await blogService.createPost({
                    user_id: this.userAuth.data.user_id,
                    post_title: this.title,
                    post_content: this.post,
                });
                this.$toast.success('Thêm bài viết thành công');
                this.$router.push('/')
                this.message = 'Thêm bài viết thành công.';
            } catch (error) {
                console.log(error);
                //console.log("user id: ", user);
            }
            // let res = await axios.post(`/api/users/${this.user.id}/uploads/image`)
            
        },
    },
    
    

    components: { Form, Field, ErrorMessage }

};
</script>
<style>

</style>