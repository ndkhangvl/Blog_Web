<script>
import AppHeader from '@/components/AppHeader.vue';

export default {
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
