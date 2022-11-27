<script>
export default {
    props: {
        users: { type: Array, default: () => [] },
        activeIndex: { type: Number, default: -1 },
    },
    emits: ['update:activeIndex'],
    methods: {
        updateActiveIndex(index) {
            this.$emit('update:activeIndex', index);
        },
    },
};
// v-for="(user, index) in users" :key="user.id" :class="{ active: index === activeIndex }"
</script>

<template>
    <div class="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-4 p-3">
        <div v-for="(user, index) in users" :key="user.user_id" :class="{ active: index === activeIndex }" >
            <div class="rounded-lg shadow-lg bg-white my-2 mx-2 h-36">
                <div class="p-7">
                    <div class="text-gray-900 text-base font-medium mb-2">
                        {{ user.user_name }}
                    </div>
                    <div class="text-gray-700 text-sm mb-4">
                        @{{ user.user_usname }}
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<style>
.object {
    text-align: justify;
}
</style>