<template>
    <div class="page row">
        
        <div class="mt-3 col-md-6">
            <h4>
                Danh bạ
                <i class="fas fa-address-book" />
            </h4>
            <PostsList
                v-if="filteredPostsCount > 0"
                :posts="filteredPosts"
                v-model:activeIndex="activeIndex"
            />
            <p v-else>
                Không có liên hệ nào.
            </p>
        </div>
        <div class="mt-3 col-md-6">
            <div v-if="activePost">
                <h4>
                    Chi tiết Post
                    <i class="fas fa-address-card" />
                </h4>
                <PostForm :post="activePost" />
            </div>
        </div> 
    </div>
</template>

<script>
import PostForm from "@/components/PostForm.vue";
import PostsList from "@/components/PostsList.vue";
import { blogService } from '@/services/blog.service';
export default {
    components: {
        PostForm,
        PostsList,
    },
    //The full code will be presented below
    data() {
        return {
            posts: [],
            activeIndex: -1,
            searchText: '',
        };
    },
    watch: {
        // Monitor changes on searchText
        // Release the currently selected post
        searchText() {
            this.activeIndex = -1;
        },
    },
    computed: {
        // Map posts to strings for searching.
        postsAsStrings() {
            return this.posts.map((post) => {
                const { user_usname, post_title, post_content } = post;
                return [user_usname, post_title, post_content].join('');
            });
        },
        // Return posts filtered by the search box.
        filteredPosts() {
            if (!this.searchText) return this.posts;
                return this.posts.filter((post, index) =>
                this.postsAsStrings[index].includes(this.searchText)
            );
        },
        activePost() {
            if (this.activeIndex < 0) return null;
                return this.filteredPosts[this.activeIndex];
            },
        filteredPostsCount() {
            return this.filteredPosts.length;
        },
    },
    methods: {
        async retrievePosts() {
            try {
                const postsList = await blogService.getManyPost();
                this.posts = postsList.sort((current, next) =>
                current.post_title.localeCompare(next.post_title)
            );
            } catch (error) {
                console.log(error);
            }
        },
        refreshList() {
            this.retrievePosts();
            this.activeIndex = -1;
        },
    },
    mounted() {
        this.refreshList();
    },
};
</script>

<style scoped>
.page {
    text-align: left;
    max-width: 750px;
}
</style>