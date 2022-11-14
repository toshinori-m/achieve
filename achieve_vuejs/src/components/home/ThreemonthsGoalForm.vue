<template>
  <div class="threemonth">
    <form @submit="redirectToThreemonthsGoal">
      <button class="ok_button">３ヶ月毎の目標</button>
    </form>
    <div v-for="threemonths_goal in threemonths_goals" :key="threemonths_goal.id">
      <div v-show = "threemonths_goal.quarter === 0">
        <p>１〜３月 = {{ threemonths_goal.aim }}</p>
      </div>
      <div v-show = "threemonths_goal.quarter === 1">
        <p>４〜６月 = {{ threemonths_goal.aim }}</p>
      </div>
      <div v-show = "threemonths_goal.quarter === 2">
        <p>７〜９月 = {{ threemonths_goal.aim }}</p>
      </div>
      <div v-show = "threemonths_goal.quarter === 3">
        <p>１０〜１２月 = {{ threemonths_goal.aim }}</p>
      </div>
    </div>
    <div class="error">{{ error }}</div>
  </div>
</template>

<script>
import axios from 'axios'
// import getItem from '../../auth/getItem'

export default {
  data () {
    return {
      threemonths_goals: "",
      error: null
    }
  },
  methods: {
    async getThreemonthsGoal () {
      try {
        const res = await axios.get('http://54.65.83.225:3000/threemonths_goals', {
          headers: {
            uid: window.localStorage.getItem('uid'),
            "access-token": window.localStorage.getItem('access-token'),
            client: window.localStorage.getItem('client')
            }
        })
        if (res.data.length === 0){
          this.error = '３ヶ月毎の目標を表示できませんでした。上の３ヶ月毎の釦をにて標的を入力して下さい。'
        }
        console.log({ res })
        this.threemonths_goals = res.data
      } catch (error) {
      console.log({ error })
      this.error = '３ヶ月毎の目標を表示できませんでした。上の３ヶ月毎の釦をにて標的を入力して下さい。'
      }
    },
    redirectToThreemonthsGoal () {
      this.$router.push({ name: 'ThreemonthsGoalPage' })
    }
  },
  mounted() {
    this.getThreemonthsGoal()
  }
}
</script>

<style>
.threemonth {
  text-align: center;
  margin: -40px 0 0 0;
}
.threemonth p {
  text-align:left;
  font-size: 15px;
  padding: 5px 20px;
  margin: 20px -50px;
  background-color: white;
  color: black;
}
</style>