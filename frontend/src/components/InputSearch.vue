<script>
export default {
    props: {
        modelValue: { type: String, default: ''},
    },
    emits: ['submit', 'update:modelValue'],
    methods: {
        updateModelValue(e){
            this.$emit('update:modelValue', e.target.value);
        },
        submit() {
            this.$emit('submit');
        },
   },
};
</script>

<template>
    <div class="input-group max-w-3xl">
        <input
            type="text"
            class="form-control"
            placeholder="Nhập từ khóa cần tìm"
            :value="modelValue"
            @input="updateModelValue"
            @keyup.enter="submit"
        >
        <div class="input-group-append">
            <button
                class="btn btn-outline-secondary text-white bg-blue-700"
                type="button"
                @click="submit"
            >
                <i class="fas fa-search" />Tìm kiếm
            </button>
        </div>
    </div>
</template>
