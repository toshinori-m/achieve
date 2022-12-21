<template>
  <div class="text-center py-24">
    <h2 class="text-3xl tracking-widest mb-7 text-center text-white text-shadow-b">３ヶ月毎の目標</h2>
    <form class="sm:w-4/5 md:w-3/4 my-14 mx-auto" @submit.prevent ="threemonths_goal">
      <p class="text-lg text-shadow">１〜３月の目標</p>
      <input class="rounded-2xl w-full py-2 px-3" type="aim_1" required placeholder="１〜３月" v-model="aim_1">
      <p class="text-lg mt-5 text-shadow">４〜６月の目標</p>
      <input class="rounded-2xl w-full py-2 px-3" type="aim_2" required placeholder="４〜６月" v-model="aim_2">
      <p class="text-lg mt-5 text-shadow">７〜９月の目標</p>
      <input class="rounded-2xl w-full py-2 px-3" type="aim_3" required placeholder="７〜９月" v-model="aim_3">
      <p class="text-lg mt-5 text-shadow">１０〜１２月の目標</p>
      <input class="rounded-2xl w-full py-2 px-3" type="aim_4" required placeholder="１０〜１２月" v-model="aim_4">
      <div class="error">{{ error }}</div>
      <button class="mt-8 ok_button">OK</button>
    </form>
  </div>
</template>
<script>
import axios from 'axios'
export default {
  data () {
    return {
      aim_1: '',
      aim_2: '',
      aim_3: '',
      aim_4: '',
      error: null
    }
  },
  methods: {
    async threemonths_goal() {
      try {
        const res = await axios.post('http://localhost:3000/threemonths_goals', {
          aim_1: this.aim_1,
          aim_2: this.aim_2, 
          aim_3: this.aim_3, 
          aim_4: this.aim_4,
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
        this.error = 'threemonths goalを表示できませんでした'
      }
    }
  }
}
</script>
<style>
</style>
