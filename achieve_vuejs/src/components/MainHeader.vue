<template>
  <div class="z-40 relative fixed top-0 bg-blue-500/75 w-full h-28 md:h-16">
    <div class="text-center mb-2 p-5 md:text-left">
      <h1 class="uppercase text-2xl text-shadow-md ">achieve one's goal</h1>
    </div>
    <div class=" ">
      <ul class="flex flex-row text-center md:absolute md:right-3 md:top-5">
        <li class="basis-1/6 md:mx-3">
          <form @click="redirectToHome">
            <button class="text-shadow text-sm sm:text-lg">Home</button>
          </form>
        </li>
        <li class="basis-1/5 md:mx-3">
          <form @click="redirectToTraining">
            <button class="text-shadow text-sm sm:text-lg">Training</button>
          </form>
        </li>
        <li class="basis-1/4 md:mx-3">
          <form @click="redirectToChatroom">
            <button class="text-shadow text-sm sm:text-lg">Chatroom</button>
          </form>
        </li>
        <li class="basis-2/5 -mt-2 -mx-1 md:mx-3">
          <button @click="logout" class="out_button">ログアウト</button>
          <div class="error">{{ error }}</div>
        </li>
      </ul>
    </div>
  </div>
</template>
<script>
import axios from 'axios'
import removeItem from '../auth/removeItem'

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
        const res = await axios.delete('https://goals-achieve.click/auth/sign_out', {
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
          console.log("ログアウトしました")
          removeItem()
          this.$router.push({ name: 'WelcomePage' })
        }
        return res
      } catch (error) {
        this.error = 'ログアウトできませんでした'
      }
    },
    redirectToHome () {
      this.$router.push({name: 'HomePage'})
    },
    redirectToTraining () {
      this.$router.push({name: 'TrainingPage'})
    },
    redirectToChatroom () {
      this.$router.push({name: 'ChatroomPage'})
    }
  }
}
</script>

<style>
</style>