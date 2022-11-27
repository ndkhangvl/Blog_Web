<template>

    <div v-if="post" class="flex justify-center">
        <PostForm :post="post"/>

    </div>


</template>

<script>
import PostForm from "@/components/PostForm.vue";
import { blogService } from '@/services/blog.service';
export default {
    components: {
        PostForm,
    },
    props: {
        postId: { type: Number, required: true },
    },
    //The full code will be presented below
    data() {
        return {
            post: null,
        };
    },

    methods: {
        async getPost(id) {
            try {
                this.post = await blogService.getPost(id);
                console.log(this.post);
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
    created() {
        this.getPost(this.postId);
    }
};
</script>

<style scoped>

</style>