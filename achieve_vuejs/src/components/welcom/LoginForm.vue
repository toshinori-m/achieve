<template>
  <div>
    <h2>ログイン</h2>
    <form @submit.prevent="login">
      <input type="email" required placeholder="メールアドレス" v-model="email">
      <input type="password" required placeholder="パスワード" v-model="password">
      <div class="error">{{ error }}</div>
      <button class="ok_button">ログインする</button>
    </form>
    <form @submit.prevent="loginWithGestUser">
      <button class="ok_button">ゲストログイン</button>
      <ul class="Guest">
        <li>↑</li>
        <li>（あらかじめゲストユーザーを作成し、その情報でログイン）</li>
      </ul>
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
        const res = await axios.post('http://54.199.72.77:3000/auth/sign_in', {
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
        console.log({ res })
        return res
      } catch (error) {
        console.log({ error })
        this.error = 'メールアドレスかパスワードが違います'
      }
    },
    async loginWithGestUser() {
      this.error = null
      const res = await axios.post('http://54.199.72.77:3000/auth/sign_in', {
        email: 'guest@example.com',
        password: 'guests',
        }
      )
      if (!this.error) {
        setItem(res.headers, res.data.data.name)
        this.$emit('redirectToHome')
      }
      console.log({ res })
      return res
    }
  }
}
</script>