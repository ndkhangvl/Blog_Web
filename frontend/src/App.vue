<script>
import AppHeader from '@/components/AppHeader.vue';
import { useAuthStore } from '@/store/auth';
import { mapActions, mapState } from 'pinia';

export default {
  setup() {
    const store = useAuthStore();
   return {
      store,
    };
  },
  components: {
    AppHeader,
  },
};
</script>

<template>
  <div>
    <AppHeader />
  </div>
<div class="container mx-auto">
  <router-view />
</div>
    <!-- <router-view v-slot="{ Component }">
      <transition name="fade" >
        <keep-alive>
          <component :is="Component"/>
        </keep-alive>
      </transition>
    </router-view> -->
   <!-- <Login/> -->
</template>

<style scoped lang="postcss">
</style>
