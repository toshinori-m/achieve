<template>
  <div>
    <h2>アカウントを登録</h2>
    <form class= "w-80 my-5 mx-auto" @submit.prevent="signUp">
      <input class="w-full py-3 px-5 my-2 mx-auto rounded border-2 border-gray-200 box-border" type="text" required placeholder="名前" v-model="name">
      <input class="w-full py-3 px-5 my-2 mx-auto rounded border-2 border-gray-200 box-border" type="email" required placeholder="メールアドレス" v-model="email">
      <input class="w-full py-3 px-5 my-2 mx-auto rounded border-2 border-gray-200 box-border" type="password" required placeholder="パスワード" v-model="password">
      <input class="w-full py-3 px-5 my-2 mx-auto rounded border-2 border-gray-200 box-border" type="password" required placeholder="パスワード（確認用）" v-model="passwordConfirmation">
      <div class="error">{{ error }}</div>
      <button class="ok_button">登録する</button>
    </form>
    <form class= "w-80 my-5 mx-auto" @submit.prevent="signUpGuest">
      <button class="ok_button">ゲストログイン</button>
      <ul class="list-none my-13 -mx-5">
        <li class="my-3 w-full px-2">↑</li>
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
        const res = await axios.post('http://goals-achieve.click/auth', {
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
        const res = await axios.post('http://goals-achieve.click/auth', {
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