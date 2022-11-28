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

    mounted() {
        console.log(this.userAuth);
        // console.log(this.post.user_usname);
        // console.log(this.userAuth.data.user_usname);
    },

    props: {
        post: { type: Object, required: true }
    },
    data() {
        return {
            // Props are supposed to be immutable, therefore create
            // a local variable contactLocal and bind it to the form
            postLocal: { ...this.post },
        };
    },
    methods: {
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
                    return false;
                }
            } catch (error) {

            }
        },

        async clearPost(postid) {
            if (confirm('Bạn muốn xóa liên hệ này?')) {
                try {
                    await blogService.deletePost(postid);
                    this.$toast.error('Xóa bài viết thành công');
                    this.$router.push('/')
                } catch (error) {
                    console.log(error);
                }
            }
        }

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

    <div class="rounded-lg shadow-lg bg-white max-w-3xl my-2 object">
        <div class="p-7">
            <div class="text-gray-900 text-base font-medium mb-2">
                {{ post.user_name }}
            </div>
            <div class="text-gray-700 text-sm mb-4">
                @{{ post.user_usname }}
            </div>

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
        <button v-if="isAuth && checkUser()" v-on:click="clearPost(post.post_id)"
            class="tracking-widest bg-primary min-w-full h-12 focus:bg-secondary hover:bg-secondary text-white rounded-lg text-2xl marlene-btn"
            type="submit">Xóa bài viết</button>
    </div>
</template>
<style>
.object {
    text-align: justify;
}
</style>