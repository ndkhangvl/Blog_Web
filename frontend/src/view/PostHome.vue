<template>
    <div class="flex justify-center">
        <InputSearch v-model="searchText" />
    </div>
    <div class="flex justify-center">
        <PostList v-if="filteredPostsCount > 0" :posts="filteredPosts" />
        <p v-else>
            Không có bài viết nào
        </p>
    </div>

</template>

<script>
import InputSearch from '@/components/InputSearch.vue';
import PostList from "@/components/PostList.vue";
import { blogService } from '@/services/blog.service';
export default {
    components: {
        InputSearch,
        PostList,
    },
    //The full code will be presented below
    data() {
        return {
            posts: [],
            searchText: '',
        };
    },
    watch: {
        // Monitor changes on searchText
        // Release the currently selected post
    },
    computed: {
        // Map posts to strings for searching.
        postsAsStrings() {
            return this.posts.map((post) => {
                const { post_title } = post;
                return [ this.removeVietnameseTones(post_title.toLowerCase())].join('');
            });
        },
        // Return posts filtered by the search box.
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
    methods: {
        async retrievePosts() {
            try {
                /*
                const postsList = await blogService.getManyPost();
                this.posts = postsList.sort((current, next) =>
                    current.post_title.localeCompare(next.post_title)
                );
                */
                this.posts = await blogService.getManyPost();
            } catch (error) {
                console.log(error);
            }
        },
        refreshList() {
            this.retrievePosts();
        },
        removeVietnameseTones(str) {
            str = str.replace(/à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ/g, "a");
            str = str.replace(/è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ/g, "e");
            str = str.replace(/ì|í|ị|ỉ|ĩ/g, "i");
            str = str.replace(/ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ/g, "o");
            str = str.replace(/ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ/g, "u");
            str = str.replace(/ỳ|ý|ỵ|ỷ|ỹ/g, "y");
            str = str.replace(/đ/g, "d");
            /*str = str.replace(/À|Á|Ạ|Ả|Ã|Â|Ầ|Ấ|Ậ|Ẩ|Ẫ|Ă|Ằ|Ắ|Ặ|Ẳ|Ẵ/g, "A");
            str = str.replace(/È|É|Ẹ|Ẻ|Ẽ|Ê|Ề|Ế|Ệ|Ể|Ễ/g, "E");
            str = str.replace(/Ì|Í|Ị|Ỉ|Ĩ/g, "I");
            str = str.replace(/Ò|Ó|Ọ|Ỏ|Õ|Ô|Ồ|Ố|Ộ|Ổ|Ỗ|Ơ|Ờ|Ớ|Ợ|Ở|Ỡ/g, "O");
            str = str.replace(/Ù|Ú|Ụ|Ủ|Ũ|Ư|Ừ|Ứ|Ự|Ử|Ữ/g, "U");
            str = str.replace(/Ỳ|Ý|Ỵ|Ỷ|Ỹ/g, "Y");
            str = str.replace(/Đ/g, "D");*/
            // Some system encode vietnamese combining accent as individual utf-8 characters
            // Một vài bộ encode coi các dấu mũ, dấu chữ như một kí tự riêng biệt nên thêm hai dòng này
            str = str.replace(/\u0300|\u0301|\u0303|\u0309|\u0323/g, ""); // ̀ ́ ̃ ̉ ̣  huyền, sắc, ngã, hỏi, nặng
            str = str.replace(/\u02C6|\u0306|\u031B/g, ""); // ˆ ̆ ̛  Â, Ê, Ă, Ơ, Ư
            // Remove extra spaces
            // Bỏ các khoảng trắng liền nhau
            str = str.replace(/ + /g, " ");
            str = str.trim();
            // Remove punctuations
            // Bỏ dấu câu, kí tự đặc biệt
            str = str.replace(/!|@|%|\^|\*|\(|\)|\+|\=|\<|\>|\?|\/|,|\.|\:|\;|\'|\"|\&|\#|\[|\]|~|\$|_|`|-|{|}|\||\\/g, " ");
            return str;
        },
    },
    mounted() {
        this.refreshList();
    },
};
</script>

<style scoped>

</style>