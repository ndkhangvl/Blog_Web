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
        this.getPost(this.postId);
    },
    mounted() {
        if (this.isAuth) {
            console.log(this.userAuth.data.user_id);
            console.log(this.post.user_usname);
            console.log(this.userAuth.data.user_usname);
        }
    },

    props: {
        postId: { type: Number, required: true },
    },
    data() {
        return {
            // Props are supposed to be immutable, therefore create
            // a local variable contactLocal and bind it to the form
            postLocal: { ...this.post },
            post: null,
            messageLike: '',
        };
    },
    methods: {
        async getPost(id) {
            try {
                this.post = await blogService.getPost(id);
                console.log(this.post);
                if (this.isAuth) {
                    this.likeCheck(this.userAuth.data.user_id, this.postId);
                }

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
        async likeCheck(userid, postid) {
            //document.getElementById(`like`+postid).innerHTML = "Hi";
            try {
                var islike = await blogService.checkLike(userid, postid);
                if (islike != "") {
                    // console.log("likebutton: ", islike);
                    this.messageLike = "Hủy thích";
                    console.log("Huy thich", this.messageLike);
                } else {
                    this.messageLike = "Thích";
                    console.log("Thich", this.messageLike);
                };


            } catch (error) {
                console.log(error);
            }
        },
        getDateUpdate(dateInSQL) {
            const date = new Date(dateInSQL).toLocaleDateString('en-US', {
                //weekday: 'long',
                year: 'numeric',
                month: 'long',
                day: 'numeric',
                hour: 'numeric',
                minute: 'numeric',
                //second: 'numeric'
            });
            return date;
        },

        checkUser() {
            try {
                if (this.userAuth.data.user_usname == this.post.user_usname) {
                    return true;
                } else {
                    return;
                }
            } catch (error) {

            }
        },

        async updatePost() {
            try {
                this.$router.push('/editpost')
            } catch (error) {
                console.log(error);
            }
        },

        async clearPost(postid) {
            try {
                await blogService.deletePost(postid);
                this.$toast.success('Xóa bài viết thành công');
                this.$router.push('/')
            } catch (error) {
                console.log(error);
            }
        },

        async likeAction(userid, postid) {
            try {
                await blogService.actionLike(userid, postid);
                console.log("Change like state successful");
                //this.likeCheck(postid);
                this.getPost(this.postId);
            } catch (error) {
                console.log(error);
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
    <div class="flex justify-center">
        <div class="rounded-lg shadow-lg bg-white max-w-3xl my-2 object">
            <div class="p-7">
                <div class="text-gray-900 text-base font-medium mb-2">
                    {{ post.user_name }}
                </div>
                <router-link :to="{
                    name: 'UserPage',
                    params: { username: post.user_usname },
                }">
                    <div class="text-gray-700 text-sm mb-4">
                        @{{ post.user_usname }}
                    </div>
                </router-link>

                <div class="flex justify-center">
                    <h5 class="mb-2 text-2xl font-bold tracking-tight text-gray-900 dark:text-white">
                        {{ post.post_title }}
                    </h5>
                </div>

                <p class="text-gray-700 text-base mb-4">
                    {{ post.post_content }}
                </p>
                <div class="text-gray-700 text-sm mb-4 ml-100 flex justify-end">
                    <i>Cập nhật: {{ getDateUpdate(post.post_dateUp) }}</i>
                </div>
                <p class="text-gray-700 text-base font-medium">
                    Lượt thích:
                    {{ post.numLike }}
                </p>
            </div>
            <div class="flex justify-end">
                <div v-if="isAuth" v-on:click="likeAction(this.userAuth.data.user_id, post.post_id)"
                    class="mx-7 mb-4 btn btn-outline-secondary text-white bg-blue-700">
                    <div> {{ messageLike }} </div>
                </div>
            </div>
            <div class="grid gap-4 grid-cols-2 mx-auto p-2">
                <div class="mx-auto">
                    <router-link :to="{
                        name: 'post.edit',
                        params: { id: post.post_id },
                    }">
                        <button v-if="isAuth && checkUser()"
                            class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-5 rounded"
                            type="submit">Sửa bài viết</button>
                    </router-link>
                </div>
                <div class="mx-auto">
                    <button v-if="isAuth && checkUser()" v-on:click="clearPost(post.post_id)"
                        class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded" type="submit">Xóa
                        bài viết</button>
                </div>
            </div>
        </div>
    </div>

</template>
<style>
.object {
    text-align: justify;
}
</style>