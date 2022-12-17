<template>
  <div class="relative">
    <div class="z-40 fixed top-0 bg-blue-500/75 p-5 w-full h-28 md:h-16">
      <h1 class="text-center uppercase text-2xl text-shadow-md mb-2 md:text-left">achieve one's goal</h1>
      <div class="text-center mt-2 md:text-right md:-mt-12">
        <form @submit="redirectToWelcome">
          <button class="ok_button ">サインイン/ログイン</button>
        </form>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  methods: {
    redirectToWelcome () {
      this.$router.push({name: 'WelcomePage'})
    }
  }
}
</script>