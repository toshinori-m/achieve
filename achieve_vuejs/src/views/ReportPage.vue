<template>
  <div class="text-center pt-10">
    <h2 class="text-3xl tracking-widest text-center text-white text-shadow-b">達成出来た日</h2>
    <form class="sm:w-4/5 md:w-3/4 my-8 mx-auto" @submit.prevent ="reports">
      <p class="text-lg text-shadow">登録年月日：{{ datepicker_value }}</p>
      <p class="text-lg mt-2 text-shadow">練習場所</p>
      <input class="rounded-2xl w-full py-2 px-3" type="location" required placeholder="練習場所を入力" v-model="location">
      <p class="text-lg mt-2 text-shadow">練習時間</p>
      <input class="rounded-2xl w-full py-2 px-3" type="text" required placeholder="練習時間を入力" v-model="time">
      <p class="text-lg mt-2 text-shadow">体調</p>
      <select class="rounded-2xl w-full py-2 px-3" type="condition" v-model="condition">
        <option disabled value="">体調を選択</option>
        <option>絶好調</option>
        <option>好調</option>
        <option>普通</option>
        <option>不調</option>
        <option>絶不調</option>
      </select>
      <p class="text-lg mt-2 text-shadow">強度</p>
      <select class="rounded-2xl w-full py-2 px-3" type="intensity" v-model="intensity">
        <option disabled value="">強度を選択</option>
        <option>厳しい</option>
        <option>少し厳しい</option>
        <option>普通</option>
        <option>少し優しい</option>
        <option>優しい</option>
      </select>
      <p class="text-lg mt-2 text-shadow">練習内容（ポイント）</p>
      <textarea class="rounded-2xl w-full py-2 px-3" type="point" required placeholder="ポイント練習内容を入力" v-model="point"></textarea>
      <p class="text-lg mt-2 text-shadow">感想</p>
      <textarea class="rounded-2xl w-full py-2 px-3" type="report" required placeholder="感想を入力" v-model="report"></textarea>
      <div class="error">{{ error }}</div>
      <button class="ok_button">ok</button>
    </form>
  </div>
</template>
<script>
  import axios from 'axios'
  export default {
    date () {
      return {
        datepicker_value: "",
        location: "",
        time: "",
        condition: "",
        intensity: "",
        point: "",
        report: "",
      }
    },
    created () {
      this.datepicker_value = this.$route.query.datepicker_value  ;
    },
    methods: {
      async reports() {
        try {
          const res = await axios.post('http://goals-achieve.click:3000/reports', {
            datepicker_value: this.datepicker_value,
            location: this.location, 
            time: this.time, 
            condition: this.condition,
            intensity: this.intensity, 
            point: this.point, 
            report: this.report,
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
          this.error = 'reportを表示できませんでした'
        }
      }
    }
  }
</script>
<style>
</style>