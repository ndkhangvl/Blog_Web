<script>
import * as yup from 'yup';
import { Form, Field, ErrorMessage } from 'vee-validate';
export default {
    components: {
        Form,
        Field,
        ErrorMessage,
    },
    props: {
        post: { type: Object, required: true }
    },
    data() {
        return {
            // Props are supposed to be immutable, therefore create
            // a local variable contactLocal and bind it to the form
            postLocal: { ...this.post },
        };
    },
    methods: {
        getDateUpdate(dateInSQL) {
            const date = new Date(dateInSQL).toLocaleDateString('en-US', {
                //weekday: 'long',
                year: 'numeric',
                month: 'long',
                day: 'numeric',
                hour: 'numeric',
                minute: 'numeric',
                //second: 'numeric'
            });
            return date;
        }
    }
};
</script>

<template>

    <div class="rounded-lg shadow-lg bg-white max-w-3xl my-2 object">
        <div class="p-7">
            <div class="text-gray-900 text-base font-medium mb-2">
                {{ post.user_name }}
            </div>
            <div class="text-gray-700 text-sm mb-4">
                @{{ post.user_usname }}
            </div>

            <div class="flex justify-center">
                <h5 class="mb-2 text-2xl font-bold tracking-tight text-gray-900 dark:text-white">
                    {{ post.post_title }}
                </h5>
            </div>

            <p class="text-gray-700 text-base mb-4">
                {{ post.post_content }}
            </p>
            <div class="text-gray-700 text-sm mb-4 ml-100 flex justify-end">
                <i>Cập nhật: {{ getDateUpdate(post.post_dateUp) }}</i>
            </div>
            <p class="text-gray-700 text-base font-medium">
                Lượt thích:
                {{ post.numLike }}
            </p>
        </div>

    </div>
</template>
<style>
.object {
    text-align: justify;
}
</style>