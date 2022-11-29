<script>
import { useAuthStore } from '@/store/auth';
import { blogService } from '@/services/blog.service';
import { Document } from 'postcss';
export default {
    props: {
        posts: { type: Array, default: () => [] },
        activeIndex: { type: Number, default: -1 },
    },
    emits: ['update:activeIndex'],
    methods: {
        updateActiveIndex(index) {
            this.$emit('update:activeIndex', index);
        },
        // async likeCheck(postid) {
        //     //document.getElementById(`like`+postid).innerHTML = "Hi";
        //     this.messageLike = "";
        //     ;
        //     try {
        //         var islike = await blogService.checkLike(useAuthStore().userAuth.data.user_id, postid);
        //         if (islike != "") {
        //             console.log("likebutton: ", islike);
        //             this.messageLike = "Hủy thích";
        //             console.log("Huy thich");
        //         } else {
        //             this.messageLike = "Thích";
        //             console.log("Thich");
        //         };


        //     } catch (error) {
        //         console.log(error);
        //     }
        // },
        // async likeAction(postid) {
        //     try {
        //         await blogService.actionLike(useAuthStore().userAuth.data.user_id, postid);
        //         console.log("Change like state successful");
        //         this.likeCheck(postid);
        //     } catch (error) {
        //         console.log(error);
        //     }
        // },
        // concatMes(string1, string2) {
        //     console.log("newstring: ", string1 + string2);
        //     return string1 + string2;
        // }
    },
    computed: {
        isAuth() {
            return useAuthStore().userAuth != null;
        },
        // isLike(postid) {
        //     return this.likeCheck(postid) != null;
        // }
    },
};
</script>

<template>
    <ul class="list-group">
        <li v-for="(post, index) in posts" :key="post.post_id" :class="{ active: index === activeIndex }">
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
                    <div class="flex justify-center line-clamp-1">
                        <h5 class="mb-2 text-2xl font-bold tracking-tight text-gray-900 dark:text-white">
                            {{ post.post_title }}
                        </h5>
                    </div>
                    <p class="text-gray-700 text-base mb-4 line-clamp-4" style="white-space: pre-line">
                        {{ post.post_content }}
                    </p>

                    <router-link :to="{
                        name: 'post.show',
                        params: { id: post.post_id },
                    }">
                        <div
                            class="inline-flex items-center px-3 py-2 text-sm font-medium text-center text-white bg-blue-700 rounded-lg hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800 flex justify-center">
                            Xem thêm...
                            <svg aria-hidden="true" class="w-4 h-4 ml-2 -mr-1" fill="currentColor" viewBox="0 0 20 20"
                                xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd"
                                    d="M10.293 3.293a1 1 0 011.414 0l6 6a1 1 0 010 1.414l-6 6a1 1 0 01-1.414-1.414L14.586 11H3a1 1 0 110-2h11.586l-4.293-4.293a1 1 0 010-1.414z"
                                    clip-rule="evenodd"></path>
                            </svg>
                        </div>
                    </router-link>
                </div>
                <!--
<div class="flex justify-end">
                    <div v-if="isAuth" v-on:click="likeAction(post.post_id)"
                        class="mx-7 mb-4 btn btn-outline-secondary text-white bg-blue-700">
                        <div v-bind:on-change="likeCheck(post.post_id)"> Thích </div>
                    </div>
                </div>
                -->
                
            </div>
        </li>
    </ul>
</template>

<style>
.object {
    text-align: justify;
}
</style>