<template>
  <div class="report_page">
    <h2>今日の達成</h2>
    <form @submit.prevent ="reports">
      <p>登録年月日：{{ datepicker_value }}</p>
      <p>練習場所</p>
      <input type="location" required placeholder="練習場所を入力" v-model="location">
      <p>練習時間</p>
      <input type="text" required placeholder="練習時間を入力" v-model="time">
      <p>体調</p>
      <select type="condition" v-model="condition">
        <option disabled value="">体調を選択</option>
        <option>絶好調</option>
        <option>好調</option>
        <option>普通</option>
        <option>不調</option>
        <option>絶不調</option>
      </select>
      <p>強度</p>
      <select type="intensity" v-model="intensity">
        <option disabled value="">強度を選択</option>
        <option>厳しい</option>
        <option>少し厳しい</option>
        <option>普通</option>
        <option>少し優しい</option>
        <option>優しい</option>
      </select>
      <p>練習内容（ポイント）</p>
      <textarea type="point" required placeholder="ポイント練習内容を入力" v-model="point"></textarea>
      <p>感想</p>
      <textarea type="report" required placeholder="感想を入力" v-model="report"></textarea>
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
          const res = await axios.post('http://52.197.190.81:3000/reports', {
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
.report_page h2{
  font-size: 30px;
  letter-spacing: 5px;
  margin: 50px 0px -50px 0px;
  text-align: center;
  color: white;
  text-shadow: 1px 1px 2px blue;
}
.report_page form {
  width: 800px;
  margin: 60px auto;
}
.report_page input,select,textarea {
  width: 100%;
  padding: 5px 20px;
  margin: 8px auto;
  border-radius: 4px;
  border: 1px solid rgb(238, 238, 238);
  outline: none;
  box-sizing: border-box;
}
.report_page p {
  text-align: left;
  font-size: 17px;
  margin: 10px 0px 0px 0px;
}
.report_page  {
  text-align: center;
}
</style>