<template>
    <div v-if="isAuth">
        <div class="grid grid-cols-2 mx-auto">
            <div>
                <div class="w-full flex-grow mx-auto">
                    <PostList v-if="filteredPostsCount > 0" :posts="filteredPosts" />
                    <p v-else>
                        Không có bài viết nào
                    </p>
                </div>
            </div>
            <div class="flex justify-center">
                <div class="w-1/3 my-2 flex-shrink-0 rounded-lg shadow-lg bg-white p-2 fixed">
                    <Form :validation-schema="formSchema" @submit="createpost">
                        <div class="mb-6">
                            <label for="text" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Tiêu
                                đề</label>
                            
                            <Field type="text" name="title"
                                class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                                placeholder="Nhập tiêu đề" v-model="title" />
                            <ErrorMessage name="title" class="text-sm text-red-800" />
                        </div>
                        <div class="mb-6">
                            <label for="text" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Bài
                                viết</label>
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
                    </Form>
                </div>
            </div>
        </div>

    </div>
    <div v-else class="flex justify-center">
        Vui lòng&nbsp;<router-link to="/login" class="text-primary">Đăng nhập</router-link>&nbsp;để thực hiện chức năng này

    </div>
</template>
<script>
import * as yup from 'yup';
import { Form, Field, ErrorMessage } from 'vee-validate';
import { blogService } from '@/services/blog.service';
import { mapActions, mapState } from "pinia";
import { useAuthStore } from '@/store/auth';
import PostList from "@/components/PostList.vue";

export default {
    computed: {
        ...mapState(useAuthStore, ["userAuth"]),
        isAuth() {
            return useAuthStore().userAuth != null;
        },
        postsAsStrings() {
            return this.posts.map((post) => {
                const { post_title } = post;
                return [this.removeVietnameseTones(post_title.toLowerCase())].join('');
            });
        },

        filteredPosts() {
            if (!this.searchText) return this.posts;
            return this.posts.filter((post, index) =>
                this.postsAsStrings[index].includes(this.removeVietnameseTones(this.searchText.toLowerCase()))
            );
        },

        filteredPostsCount() {
            return this.filteredPosts.length;
        },

    },

    mounted() {
        //const auth = useAuthStore();
        if (this.isAuth) {
            //console.log("id in form: ", this.userAuth.data.user_id);
            //console.log("username in form: ", this.userAuth.data.user_usname);
            this.refreshList();
        }
        

    },
    data() {
        const formSchema = yup.object().shape({
            title: yup
                .string()
                .required('Tên tiêu đề không thể bỏ trống.')
                .min(2, "Tiêu đề không thể ít hơn 2 kí tự")
                .max(200, "Tiêu đề không thể quá 200 kí tự"),
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
            posts: [],
            searchText: '',
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
                this.refreshList();
                this.message = 'Thêm bài viết thành công.';
            } catch (error) {
                console.log(error);
                //console.log("user id: ", user);
            }
            // let res = await axios.post(`/api/users/${this.user.id}/uploads/image`)

        },

        // async getUser(username) {
        //     try {
        //         this.user = await blogService.getUserBy(username);
        //         console.log(this.user);
        //     } catch (error) {
        //         console.log(error);
        //         this.$router.push({
        //             name: 'notfound',
        //             params: {
        //                 pathMatch: this.$route.path.split('/').slice(1)
        //             },
        //             query: this.$route.query,
        //             hash: this.$route.hash,
        //         });
        //     }
        // },
        async retrievePosts(username) {
            try {
                /*
                const postsList = await blogService.getManyPost();
                this.posts = postsList.sort((current, next) =>
                    current.post_title.localeCompare(next.post_title)
                );
                */
                this.posts = await blogService.getPostBy(username);
            } catch (error) {
                console.log(error);
            }
        },
        refreshList() {
            this.retrievePosts(this.userAuth.data.user_usname);
        },
    },



    components: { Form, Field, ErrorMessage, PostList }

};
</script>
<style>

</style>