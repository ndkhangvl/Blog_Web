<template>

    <div v-if="user" class="grid grid-cols-2">
        <div class="flex justify-center">
            <UserForm :user="user" class="w-1/3 flex justify-center fixed"/>
        </div>
        <div>
            <PostList v-if="filteredPostsCount > 0" :posts="filteredPosts"/>
        <p v-else>
            Không có bài viết nào
        </p>
        </div>
        
    </div>


</template>

<script>
import UserForm from "@/components/UserForm.vue";
import PostList from "@/components/PostList.vue";
import { blogService } from '@/services/blog.service';
export default {
    components: {
        UserForm,
        PostList,
    },
    props: {
        username: { type: String, required: true },
    },
    //The full code will be presented below
    data() {
        return {
            user: null,
            posts: [],
            searchText:'',
        };
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
        async getUser(username) {
            try {
                this.user = await blogService.getUserBy(username);
                //console.log(this.user);
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
            this.retrievePosts(this.username);
        },

    },
    created() {
        this.getUser(this.username);
    },
    mounted() {
        this.refreshList();
    },
};
</script>

<style scoped>

</style>