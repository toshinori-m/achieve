<template>
  <div class="py-36 text-center">
    <h2 class="text-3xl tracking-widest mb-7 text-center text-white text-shadow-b">今期目標</h2>
    <form class="sm:w-4/5 md:w-3/4 my-14 mx-auto" @submit.prevent ="goal">
      <input class="rounded-2xl w-full py-2 px-3 " type="aim" required placeholder="今期目標を入力" v-model="aim">
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
    async goal() {
      try {
        const res = await axios.post('http://localhost:3000/goals',  {
          aim: this.aim,
          'access-token': localStorage.getItem('access-token'),
          client: localStorage.getItem('client'),
          uid: localStorage.getItem('uid')
        })
        .then(res => {
          console.log({ res })
          return res
        })
        if (!this.error) {
          this.$router.push({ name: 'HomePage' })
        }
        return res
      } catch (error) {
        console.log({ error })
        this.error = 'goalを表示できませんでした'
      }
    }
  }
}
</script>

<style>
</style>