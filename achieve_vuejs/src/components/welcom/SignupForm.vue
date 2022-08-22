<template>
  <div>
    <h2>アカウントを登録</h2>
    <form @submit.prevent="signUp">
      <input type="text" required placeholder="名前" v-model="name">
      <input type="email" required placeholder="メールアドレス" v-model="email">
      <input type="password" required placeholder="パスワード" v-model="password">
      <input type="password" required placeholder="パスワード（確認用）" v-model="passwordConfirmation">
      <div class="error">{{ error }}</div>
      <button class="ok_button">登録する</button>
    </form>
    <form @submit.prevent="signUpGuest">
      <button class="ok_button">ゲストログイン</button>
      <ul class="Guest">
        <li>↑</li>
        <li>（ゲストユーザーをその都度作成し、ログイン）</li>
      </ul>
    </form>
  </div>
</template>

<script>
import axios from 'axios'
import setItem from '../../auth/setItem'
import crypto from 'crypto-js'

export default {
  emits: ['redirectToHome'],
  data () {
    return {
      name: '',
      email: '',
      password: '',
      passwordConfirmation: '',
      error: null
    }
  },
  methods: {
    async signUp () {
      this.error = null
      try {
        const res = await axios.post('http://localhost:3000/auth', {
          name: this.name,
          email: this.email,
          password: this.password,
          password_confirmation: this.passwordConfirmation
          }
        )
        if (!res) {
          throw new Error('アカウントを登録できませんでした')
        }
        if (!this.error) {
          setItem(res.headers, res.data.data.name)
          this.$emit('redirectToHome')
        }
        console.log({ res })
        return res
      } catch (error) {
        this.error = 'アカウントを登録できませんでした'
      }
    },
    async signUpGuest() { 
      this.error = null
      try {
        const ecrypted_value = crypto.AES.encrypt('name', 'guest')
        const ecrypted_pass = crypto.AES.encrypt('name', 'password')
        const res = await axios.post('http://localhost:3000/auth', {
          name: ecrypted_value.toString(),
          email: ecrypted_value.toString() + "@guest.com",
          password: ecrypted_pass.toString(),
          password_confirmation: ecrypted_pass.toString()
          }
        )
        if (!this.error) {
          setItem(res.headers, res.data.data.name)
          this.$emit('redirectToHome')
        }
        console.log({ res })
        return res
      } catch (error) {
        this.error = 'アカウントを登録できませんでした'
      }
    }
  }
}
</script>