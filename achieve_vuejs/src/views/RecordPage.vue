<template>
  <div class = "record">
    <h2>１０日間の記録</h2>
    <div v-for="record in records" :key="record.id">
      <p class="datepicker">年月日 = {{ record.datepicker_value }}</p>
      <p class="location">場所 = {{ record.location }}</p>
      <p class="time">時間 = {{ record.time }}</p>
      <p class="condition">体調 = {{ record.condition }}</p>
      <p class="intensity">負荷 = {{ record.intensity }}</p>
      <p class="point">練習内容 = {{ record.point }}</p>
      <p class="report">感想 = {{ record.report }}</p>
    </div>
  </div>
</template>
<script>
  import axios from 'axios'
  import getItem from '../auth/getItem'

  export default {
    name: "recordFrom",
    data () {
      return {
        records: ""
      }
    },
    methods: {
      async getRecord () {
        try {
          const res = await axios.get('http://54.65.83.225:3000/reports', {
            headers: getItem
          })
          if (!res) {
            new Error('取得できませんでした')
          }
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
  .record {
    text-align: center;
    margin: 100px 0px 0px 0px;
  }
  .record h2{
    font-size: 30px;
    letter-spacing: 5px;
    margin: 30px;
    text-align: center;
    color: white;
    text-shadow: 1px 1px 2px blue;
  }
  .datepicker{
    text-align: center;
    padding: 0px 20px;
    margin: 10px 600px;
    background-color: white;
  }
  .location{
    position: relative;
    top: 10px; left: -300px;
    padding: 0px 20px;
    margin: 10px 600px;
    background-color: white;
  }
  .time{
    position: relative;
    top: -24px; left: 300px;
    padding: 0px 20px;
    margin: 10px 600px;
    background-color: white;
  }
  .condition{
    position: relative;
    top: -20px; left: -300px;
    padding: 0px 20px;
    margin: 10px 600px;
    background-color: white;
  }
  .intensity{
    position: relative;
    top: -55px; left: 300px;
    padding: 0px 20px;
    margin: 10px 600px;
    background-color: white;
  }
  .point {
    text-align:left;
    padding: 0px 20px;
    margin:-40px 50px 30px 50px;
    background-color: white;
  }
  .report {
    text-align:left;
    padding: 0px 20px;
    margin:30px 50px;
    background-color: white;
  }
</style>