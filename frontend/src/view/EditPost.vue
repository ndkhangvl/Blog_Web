<template>
    <div class="container mx-auto w-1/2 p-5" v-if="isAuth">
        <Form :validation-schema="formSchema" @submit="updatepost">
        <div class="mb-6">
            <label for="text" class="block mb-2 text-sm font- text-gray-900 dark:text-white">Tiêu
                đề</label>

            <Field type="text" name="title"
                class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                placeholder="Nhập tiêu đề" v-model="post.post_title" />
            <ErrorMessage name="title" class="text-sm text-red-800" />
        </div>
        <div class="mb-6">
            <label for="text" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Bài
                viết</label>
            <Field type="text" name="content" as="textarea"
                class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                placeholder="Nhập bài viết" v-model="post.post_content" />
            <ErrorMessage name="content" class="text-sm text-red-800" />
        </div>
        <div class="block text-center ">
            <button
                class="tracking-widest bg-primary min-w-full h-12 focus:bg-secondary hover:bg-secondary text-white rounded-lg text-2xl marlene-btn"
                type="submit">Sửa bài viết</button>
        </div>
    </Form>
    </div>
</template>

<script>
import * as yup from 'yup';
import { Form, Field, ErrorMessage } from 'vee-validate';
import { useAuthStore } from '@/store/auth';
import { blogService } from '@/services/blog.service';
import { mapState } from 'pinia';
export default {
    components: {
        Form,
        Field,
        ErrorMessage,
    },
    created() {
        // this.getPost(this.postId);
    },
    mounted() {
    },

    props: {
        postId: { type: Number, required: true },
    },
    data() {
        const formSchema = yup.object().shape({
            title: yup
                .string()
                .required('Tên tiêu đề không thể bỏ trống.')
                .min(2, "Tiêu đề không thể ít hơn 2 kí tự")
                .max(200, "Tiêu đề không thể quá 200 kí tự"),
            content: yup
                .string()
                .required('Nội dung không thể bỏ trống.')
                .min(2, "Nội dung không thể ít hơn 2 kí tự"),
        });
        return {
            // Props are supposed to be immutable, therefore create
            // a local variable contactLocal and bind it to the form
            postLocal: { ...this.post },
            post: this.getPost(this.postId),
            // title: "",
            // content: "",
            // error: "",
            // posts: [],
            formSchema,
            
        };
    },
    methods: {
        async updatepost() {
            try {
                await blogService.updatePost(this.postId,{
                    post_title: this.post.post_title,
                    post_content: this.post.post_content,
                });
                this.$router.push('/');
                this.$toast.success('Sửa bài viết thành công');
            } catch (error) {
                console.log(error);
                //console.log("user id: ", user);
            }

        },

        async getPost(id) {
            try {
                this.post = await blogService.getPost(id);
                console.log(this.post);
                // if (this.isAuth) {
                //     // this.likeCheck(this.userAuth.data.user_id, this.postId);
                // }

            } catch (error) {
                console.log(error);
                this.$router.push({
                    name: 'notfound',
                    params: {
                        pathMatch: this.$route.path.split('/').slice(1)
                    },
                    query: this.$route.query,
                    hash: this.$route.hash,
                });
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

<style>

</style>