<template>

    <div v-if="post" class="flex justify-center">
        <PostForm :post="post" :messageLike="messageLike"/>

    </div>


</template>

<script>
import PostForm from "@/components/PostForm.vue";
import { blogService } from '@/services/blog.service';
import { useAuthStore } from '@/store/auth';
import { mapState } from 'pinia';
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
            messageLike : '',
        };
    },

    methods: {
        async getPost(id) {
            try {
                this.post = await blogService.getPost(id);
                console.log(this.post);
                if(this.isAuth) {
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
        async likeCheck(userid,postid) {
            //document.getElementById(`like`+postid).innerHTML = "Hi";
            try {
                var islike = await blogService.checkLike(userid, postid);
                if (islike != "") {
                    // console.log("likebutton: ", islike);
                    this.messageLike = "Hủy thích";
                    console.log("Huy thich", this.messageLike);
                } else {
                    this.messageLike = "Thích";
                    console.log("Thich",this.messageLike);
                };


            } catch (error) {
                console.log(error);
            }
        },
    },
    created() {
        this.getPost(this.postId);
        // this.likeCheck(this.userAuth.data.user_id, this.postId);
        // console.log("isUse: ", this.userAuth.data.user_id);
    },
    mounted() {
        
    },
    computed: {
        isAuth() {
            return useAuthStore().userAuth != null;
        },
        ...mapState(useAuthStore, ["userAuth"]),
    }
};
</script>

<style scoped>

</style>