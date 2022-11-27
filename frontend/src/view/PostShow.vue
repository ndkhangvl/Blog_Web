<template>

    <div v-if="post" class="flex justify-center">
        <PostForm :post="post" :messageLike="messageLike"/>

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
            messageLike: "Huy",
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
        async likeCheck(postid) {
            //document.getElementById(`like`+postid).innerHTML = "Hi";
            var mes = postid;
            this.pos = "Hi";
            try{
               var islike = await blogService.checkLike(useAuthStore().userAuth.data.user_id, postid);
               if(islike != ""){
                console.log("likebutton: ", islike);
                //this.messageLike = "Hủy thích";
                console.log("Huy thich");
               }else {
                //this.messageLike = "Thích";
                console.log("Thich");
            };
                
               
            }catch (error) {
                console.log(error);
            }
        },
        async likeAction(postid) {
            try{
                await blogService.actionLike(useAuthStore().userAuth.data.user_id, postid);
                console.log("Change like state successful");
                this.likeCheck(postid);
            }catch (error) {
                console.log(error);
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