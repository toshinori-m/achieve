<template>
  <div class="mx-auto rounded-xl bg-orange-300 mt-10 mb-2 p-3 shadow-md shadow-lime-700 sm:w-96">
    <div class="text-center text-xs sm:text-base">
      <p>こんにちは、<span class="text-blue-500">{{ name }}</span>さん</p>
      <p class="text-slate-400 text-xs md:text-sm">{{ email }} でログイン中です</p>
      <div class="error">{{ error }}</div>
    </div>
  </div>
</template>

<script>
import axios from 'axios'
import removeItem from '../../auth/removeItem'

export default {
  data () {
    return {
      name: window.localStorage.getItem('name'),
      email: window.localStorage.getItem('uid'),
      error: null
    }
  },
  methods: {
    async logout () {
      this.error = null
      try {
        const res = await axios.delete(`https://backend-goals-achieve.onrender.com/auth/sign_out`, {
          headers: {
            uid: this.email,
            "access-token": window.localStorage.getItem('access-token'),
            client: window.localStorage.getItem('client')
          }
        })
        if (!res) {
          new Error('ログアウトできませんでした')
        }
        if (!this.error) {
          removeItem()
          this.$router.push({ name: 'WelcomePage' })
        }
        return res
      } catch (error) {
        this.error = 'ログアウトできませんでした'
      }
    }
  }
}
</script>

<style scoped>
</style>