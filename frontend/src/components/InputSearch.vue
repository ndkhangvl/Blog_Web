<script>
export default {
    props: {
        modelValue: { type: String, default: '' },
    },
    emits: ['submit', 'update:modelValue'],
    methods: {
        updateModelValue(e) {
            this.$emit('update:modelValue', e.target.value);
        },
        submit() {
            this.$emit('submit');
        },
        moveToPostList() {
            this.$router.push("/posts");
        },
        moveToUserList() {
            this.$router.push("/users");
        }
    },
};
</script>

<template>
    <div class="flex items-stretch w-full max-w-3xl p-2">
        <!-- <div class="input-group-append">
            <div class="flex items-center">
                <input v-on:click="moveToPostList" id="country-option-1" type="radio" name="countries" value="Post"
                    class="w-4 mb-2 font-medium text-lg font-lighting-tight text-xl border-gray-300 focus:ring-2 focus:ring-blue-300 dark:focus:ring-blue-600 dark:focus:bg-blue-600 dark:bg-gray-700 dark:border-gray-600"
                    checked>
                <label for="country-option-1" class="block ml-2 text-sm font-medium text-gray-900 dark:text-gray-300">
                    Bài Viết
                </label>
            </div>

            <div class="flex items-center">
                <input v-on:click="moveToUserList" id="country-option-2" type="radio" name="countries" value="User"
                    class="w-4 mb-2 font-medium leading-tight text-xl border-gray-300 focus:ring-2 focus:ring-blue-300 dark:focus:ring-blue-600 dark:focus:bg-blue-600 dark:bg-gray-700 dark:border-gray-600">
                <label for="country-option-2" class="block ml-2 text-sm font-medium text-gray-900 dark:text-gray-300">
                    Người Dùng
                </label>
            </div>
        </div> -->
        <input type="text"
            class="block appearance-none w-full p-3 py-1 px-2 mb-1 text-base leading-normal bg-white text-gray-800 border border-gray-200 rounded"
            placeholder="Nhập từ khóa cần tìm" :value="modelValue" @input="updateModelValue" @keyup.enter="submit">
        <!-- <div class="input-group-append">
            <button
                class="inline-block text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 mr-2 mb-2 dark:bg-blue-600 dark:hover:bg-blue-700 focus:outline-none dark:focus:ring-blue-800"
                type="button" @click="submit">
                <i class="fas fa-search" />Tìm kiếm
            </button>
        </div> -->
    </div>
</template>
