<template>
  <div>
    <component :is="headerComponent"></component>
    <router-view/>
  </div>
</template>

<script>
import TopHeader from './components/TopHeader.vue';
import MainHeader from './components/MainHeader.vue';
import WelcomHeader from './components/WelcomHeader.vue';

export default ({
  name: 'App',
  components: { TopHeader,MainHeader, WelcomHeader },
  computed: {
    headerComponent() {
      switch(this.$route.path) {
        case '/':
          return 'TopHeader';
        case '/Welcom':
          return 'WelcomHeader';
        case '/main':
          return 'MainHeader';
        default:
          return 'MainHeader';
      }
    }
  }
});
</script>

<style>
</style>
