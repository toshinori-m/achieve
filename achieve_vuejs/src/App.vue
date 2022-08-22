<template>
  <div>
    <component :is="headerComponent"></component>
    <router-view/>
  </div>
</template>

<script>
import MainHeader from './components/MainHeader.vue';
import WelcomHeader from './components/WelcomHeader.vue';

export default ({
  name: 'App',
  components: { MainHeader, WelcomHeader },
  computed: {
    headerComponent() {
      switch(this.$route.path) {
        case '/main':
          return 'MainHeader';
        case '/':
          return 'WelcomHeader';
        default:
          return 'MainHeader';
      }
    }
  }
});
</script>

<style>
</style>
