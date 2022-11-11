<template>
  <div class="monthly">
    <form @submit="redirectToMonthlyGoal">
      <button class="ok_button">今月目標</button>
    </form>
    <div v-for="monthly_goal in monthly_goals" :key="monthly_goal.id">
      <p> {{ monthly_goal.aim }} </p>
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
        monthly_goals: "",
        error: null
      }
    },
    methods: {
      async getMonthlyGoal () {
        try {
          const res = await axios.get('http://54.238.158.136:3000/monthly_goals', {
            headers: {
            uid: window.localStorage.getItem('uid'),
            "access-token": window.localStorage.getItem('access-token'),
            client: window.localStorage.getItem('client')
            }
          })
          if (!res) {
            new Error('取得できませんでした')
          }
          this.monthly_goals = res.data
        } catch (error) {
        console.log({ error })
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
  .monthly {
    text-align: center;
    padding: 30px 0;
  }
  .monthly p {
    text-align:left;
    font-size: 15px;
    padding: 5px 20px;
    margin: 30px;
    background-color: white;
    color: black
  }
</style>