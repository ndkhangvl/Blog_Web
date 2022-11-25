<script>
export default {
    props: {
        posts: {type: Array, default: () => []},
        activeIndex: {type: Number, default: -1},
    },
    emits: ['update:activeIndex'],
    methods: {
        updateActiveIndex(index){
            this.$emit('update:activeIndex', index);
        },
    },
};
</script>

<template>
    <ul class="list-group">
        <li
            class="list-group-item"
            v-for="(post, index) in posts"
            :key="post.id"
            :class="{ active: index === activeIndex }"
            @click="updateActiveIndex(index)"
        >
            {{ post.post_title }}
        </li>
    </ul>
</template>