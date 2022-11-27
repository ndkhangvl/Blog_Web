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
        user: { type: Object, required: true }
    },
    data() {
        return {
            // Props are supposed to be immutable, therefore create
            // a local variable contactLocal and bind it to the form
            userLocal: { ...this.user },
        };
    },
    methods: {
        
        
    },
    computed: {
        
    }
};
</script>

<template>

    <div class="rounded-lg shadow-lg bg-white h-96 my-2">
        <div class="p-7">
            <div class="text-gray-900 text-base font-medium mb-2">
                {{ user.user_name }}
            </div>
            <div class="text-gray-700 text-sm mb-4 text-center">
                @{{user.user_usname }}
            </div>
        </div>
        
    </div>
</template>
<style>
.object {
    text-align: justify;
}
</style>