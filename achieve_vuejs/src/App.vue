<template>
  <div>
    <component :is="headerComponent"></component>
    <router-view/>
  </div>
</template>

<script>
import TopHeader from './components/TopHeader.vue';
import MainHeader from './components/MainHeader.vue';
import WelcomeHeader from './components/WelcomeHeader.vue';

export default ({
  name: 'App',
  components: { TopHeader,MainHeader, WelcomeHeader },
  computed: {
    headerComponent() {
      switch(this.$route.path) {
        case '/':
          return 'TopHeader';
        case '/welcome':
          return 'WelcomeHeader';
        // case '/main':
        //   return 'MainHeader';
        default:
          return 'MainHeader';
      }
    }
  }
});
</script>

<style>
</style>
