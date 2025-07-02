<template>
  <div class="text-center mt-13">
    <form @submit="redirectToMonthlyGoal">
      <button class="ok_button">今月目標</button>
    </form>
    <div class="bg-white rounded-2xl w-full mt-2 mx-auto py-2 px-3 sm:w-4/5 md:w-3/4" v-for="monthly_goal in monthly_goals" :key="monthly_goal.id">
      <p class="text-left"> {{ monthly_goal.aim }} </p>
    </div>
    <div class="error">{{ error }}</div>
  </div>
</template>

<script>
  import axios from 'axios'
  
  export default {
    data () {
      return {
        monthly_goals: "",
        error: null
      }
    },
    methods: {
      async getMonthlyGoal () {
        try {
          const res = await axios.get(`${process.env.VUE_APP_API_BASE_URL}/monthly_goals`, {
            headers: {
            uid: window.localStorage.getItem('uid'),
            "access-token": window.localStorage.getItem('access-token'),
            client: window.localStorage.getItem('client')
            }
          })
          if (res.data.length === 0){
            this.error = '今月目標を表示できませんでした。上の今月目標の釦をにて標的を入力して下さい。'
          }
          this.monthly_goals = res.data
        } catch (error) {
        this.error = '今月目標を表示できませんでした。上の今月目標の釦をにて標的を入力して下さい。'
        }
      },
      redirectToMonthlyGoal () {
        this.$router.push({ name: 'MonthlyGoalPage' })
      }
    },
    mounted() {
      this.getMonthlyGoal()
    }
  }
</script>

<style>
</style>