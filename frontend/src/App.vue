<script>
import AppHeader from '@/components/AppHeader.vue';

export default {
  components: {
    AppHeader,
  },
};
</script>

<template>
  <AppHeader />
  <div class="flex items-center justify-center h-full ">
    <router-view v-slot="{ Component }">
      <transition name="fade" >
        <keep-alive>
          <component :is="Component"/>
        </keep-alive>
      </transition>
    </router-view>
   <!-- <Login/> -->
  </div>
</template>

<style scoped lang="postcss">
</style>
