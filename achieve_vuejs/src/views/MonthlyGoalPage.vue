<template>
  <div class="py-36 text-center">
    <h2 class="text-3xl tracking-widest mb-7 text-center text-white text-shadow-b">今月目標</h2>
    <form class="sm:w-4/5 md:w-3/4 my-14 mx-auto" @submit.prevent ="monthly_goal">
      <input class="rounded-2xl w-full py-2 px-3" type="aim" required placeholder="今月目標を入力" v-model="aim">
      <div class="error">{{ error }}</div>
      <button class="mt-10 ok_button">OK</button>
    </form>
  </div>
</template>

<script>
import axios from 'axios'

export default {
  data () {
    return {
      aim: '',
      error: null
    }
  },
  methods: {
    async monthly_goal() {
      try {
        const res = await axios.post('http://54.199.72.77:3000/monthly_goals',  {
          aim: this.aim,
          'access-token': localStorage.getItem('access-token'),
          client: localStorage.getItem('client'),
          uid: localStorage.getItem('uid')
        })
        .then(res => {
          return res
        })
        if (!this.error) {
          this.$router.push({ name: 'HomePage' })
        }
        return res
      } catch (error) {
        this.error = 'monthly_goalを表示できませんでした'
      }
    }
  }
}
</script>

<style>
</style>