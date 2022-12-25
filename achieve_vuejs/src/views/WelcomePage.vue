<template>
  <div class="welcome my-20 mx-auto w-full text-center py-5">
    <p>ようこそ！</p>
    <div v-if="shouldShowLoginForm">
      <LoginForm @redirectToHome="redirectToHome"/>
      <p class="text-sm m-2.5">初めての方は<span class="text-red-500" @click="shouldShowLoginForm = false">こちら</span>をクリック</p>
    </div>
    <div v-if="!shouldShowLoginForm">
      <SignupForm @redirectToHome="redirectToHome"/>
      <p class="my-3 text-sm m-2.5">&lt;アカウントをお持ちの方は<span class="text-red-500" @click="shouldShowLoginForm = true">こちら</span>をクリック&gt;</p>
    </div>
  </div>
</template>

<script>
import LoginForm from '../components/welcom/LoginForm.vue'
import SignupForm from '../components/welcom/SignupForm.vue'

export default {
  components: { LoginForm, SignupForm },
  data () {
    return {
      shouldShowLoginForm: false
    }
  },
  methods: {
    redirectToHome () {
      this.$router.push({ name: 'HomePage' })
    }
  } 
}
</script>

<style>
</style>