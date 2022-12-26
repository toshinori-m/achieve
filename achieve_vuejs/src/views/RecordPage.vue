<template>
  <div class = "text-center py-16">
    <h2 class="text-3xl tracking-widest mb-7 text-center text-white text-shadow-b">１０日間の記録</h2>
    <div class="sm:w-4/5 md:w-3/4 my-14 mx-auto" v-for="record in records" :key="record.id">
      <p class="text-lg text-shadow -mt-5">年月日 = {{ record.datepicker_value }}</p>
      <p class="text-left bg-white rounded-2xl w-full mt-2 mx-auto py-2 px-3 sm:w-4/5 md:w-3/4 my-4">場所 = {{ record.location }}</p>
      <p class="text-left bg-white rounded-2xl w-full mt-2 mx-auto py-2 px-3 sm:w-4/5 md:w-3/4 my-4">時間 = {{ record.time }}</p>
      <p class="text-left bg-white rounded-2xl w-full mt-2 mx-auto py-2 px-3 sm:w-4/5 md:w-3/4 my-4">体調 = {{ record.condition }}</p>
      <p class="text-left bg-white rounded-2xl w-full mt-2 mx-auto py-2 px-3 sm:w-4/5 md:w-3/4 my-4">負荷 = {{ record.intensity }}</p>
      <p class="text-left bg-white rounded-2xl w-full mt-2 mx-auto py-2 px-3 sm:w-4/5 md:w-3/4 my-4">練習内容 = {{ record.point }}</p>
      <p class="text-left bg-white rounded-2xl w-full mt-2 mx-auto py-2 px-3 sm:w-4/5 md:w-3/4 my-4">感想 = {{ record.report }}</p>
    </div>
    <div class="error">{{ error }}</div>
  </div>
</template>
<script>
  import axios from 'axios'

  export default {
    name: "recordFrom",
    data () {
      return {
        records: "",
        error: null
      }
    },
    methods: {
      async getRecord () {
        try {
          const res = await axios.get('http://54.199.72.77:3000/reports', {
            headers: {
            uid: window.localStorage.getItem('uid'),
            "access-token": window.localStorage.getItem('access-token'),
            client: window.localStorage.getItem('client')
            }
          })
          if (res.data.length === 0){
            this.error = '１０日間の記録を表示できませんでした。毎日の記録を入力して下さい。'
          }
          console.log({ res })
          this.records = res.data
        } catch (error) {
        console.log({ error })
        this.error = 'recordを表示できませんでした'
        }
      }
    },
    mounted() {
      this.getRecord()
    }
  }
</script>
<style>
</style>