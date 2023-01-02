<template>
  <div class="text-center -mt-16">
    <form @submit="redirectToThreemonthsGoal">
      <button class="ok_button">３ヶ月毎の目標</button>
    </form>
    <div class="bg-white rounded-2xl w-full mt-2 mx-auto py-2 px-3 sm:w-4/5 md:w-3/4 my-4" v-for="threemonths_goal in threemonths_goals" :key="threemonths_goal.id">
      <div v-show = "threemonths_goal.quarter === 0">
        <p class="text-left">１〜３月 = {{ threemonths_goal.aim }}</p>
      </div>
      <div v-show = "threemonths_goal.quarter === 1">
        <p class="text-left">４〜６月 = {{ threemonths_goal.aim }}</p>
      </div>
      <div v-show = "threemonths_goal.quarter === 2">
        <p class="text-left">７〜９月 = {{ threemonths_goal.aim }}</p>
      </div>
      <div v-show = "threemonths_goal.quarter === 3">
        <p class="text-left">１０〜１２月 = {{ threemonths_goal.aim }}</p>
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
        const res = await axios.get('https://goals-achieve.click/threemonths_goals', {
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
</style>