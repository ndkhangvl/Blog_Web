<script>
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
    },
};
</script>

<template>
    <ul class="list-group">
        <li v-for="(post, index) in posts" :key="post.id" :class="{ active: index === activeIndex }">
            <div class="rounded-lg shadow-lg bg-white max-w-3xl my-2">
                <div class="p-7">
                    <div class="text-gray-900 text-base font-medium mb-2">
                        {{ post.user_name }}
                    </div>
                    <div class="text-gray-700 text-base mb-4">
                        @{{ post.user_usname }}
                    </div>
                    <h5 class="text-gray-900 text-xl font-medium mb-2">
                        {{ post.post_title }}
                    </h5>
                    <p class="text-gray-700 text-base mb-4">
                        {{ post.post_content }}
                    </p>
                    <p class="text-gray-700 text-base mb-4 font-medium">
                        Likes: {{ post.numLike }}
                    </p>
                </div>
            </div>
        </li>
    </ul>
</template>