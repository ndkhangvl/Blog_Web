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

                    <h5 class="mb-2 text-2xl font-bold tracking-tight text-gray-900 dark:text-white">
                        {{ post.post_title }}
                    </h5>

                    <p class="text-gray-700 text-base mb-4 line-clamp-4">
                        {{ post.post_content }}
                    </p>
                    <router-link :to="{
                        name: 'post.show',
                        params: { id: post.post_id },
                    }">
                        <div
                            class="inline-flex items-center px-3 py-2 text-sm font-medium text-center text-white bg-blue-700 rounded-lg hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">
                            Read more
                            <svg aria-hidden="true" class="w-4 h-4 ml-2 -mr-1" fill="currentColor" viewBox="0 0 20 20"
                                xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd"
                                    d="M10.293 3.293a1 1 0 011.414 0l6 6a1 1 0 010 1.414l-6 6a1 1 0 01-1.414-1.414L14.586 11H3a1 1 0 110-2h11.586l-4.293-4.293a1 1 0 010-1.414z"
                                    clip-rule="evenodd"></path>
                            </svg>
                        </div>
                    </router-link>

                    <p class="text-gray-700 text-base mb-4 font-medium">
                        Likes: {{ post.numLike }}
                    </p>
                </div>
            </div>
        </li>
    </ul>
</template>