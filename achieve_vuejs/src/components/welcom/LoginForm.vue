<template>
  <div>
    <h2>ログイン</h2>
    <form class= "w-80 my-5 mx-auto" @submit.prevent="login">
      <input class="w-full py-3 px-5 my-2 mx-auto rounded border-2 border-gray-200 box-border" type="email" required placeholder="メールアドレス" v-model="email">
      <input class="w-full py-3 px-5 my-2 mx-auto rounded border-2 border-gray-200 box-border" type="password" required placeholder="パスワード" v-model="password">
      <div class="error">{{ error }}</div>
      <button class="ok_button">ログインする</button>
    </form>
  </div>
</template>

<script>
import axios from 'axios'
import setItem from '../../auth/setItem'

export default {
  emits: ['redirectToHome'],
  data () {
    return {
      email: '',
      password: '',
      error: null
    }
  },
  methods: {
    async login() {
      try {
        this.error = null
        const res = await axios.post(`${process.env.VUE_APP_API_BASE_URL}/auth/sign_in`, {
          email: this.email,
          password: this.password,
          }
        )
        if (!res) {
          throw new Error('メールアドレスかパスワードが違います')
        }
        if (!this.error) {
          setItem(res.headers, res.data.data.name)
          this.$emit('redirectToHome')
        }
        return res
      } catch (error) {
        this.error = 'メールアドレスかパスワードが違います'
      }
    }
  }
}
</script>