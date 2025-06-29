<template>
  <div class="text-center py-20">
    <form @submit="redirectToGoal">
      <button class="ok_button">今期目標</button>
    </form>
    <div class="bg-white rounded-2xl w-full mt-2 mx-auto py-2 px-3 sm:w-4/5 md:w-3/4" v-for="goal in goals" :key="goal.id">
      <p class="text-left"> {{ goal.aim }} </p>
    </div>
    <div class="error">{{ error }}</div>
  </div>
</template>

<script>
  import axios from 'axios'

  export default {
    data () {
      return {
        goals: "",
        error: null
      }
    },
    methods: {
      async getGoal () {
        try {
          const res = await axios.get('https://backend-goals-achieve.onrender.com/goals', {
            headers: {
            uid: window.localStorage.getItem('uid'),
            "access-token": window.localStorage.getItem('access-token'),
            client: window.localStorage.getItem('client')
            }
          })
          if (res.data.length === 0){
            this.error = '今期目標を表示できませんでした。上の今期目標の釦にて目標を入力して下さい。'
          }
          console.log({ res })
          this.goals = res.data
        } catch (error) {
        this.error = '今期目標を表示できませんでした。上の今期目標の釦にて目標を入力して下さい。'
        }
      },
      redirectToGoal () {
        // this.$emit('catchGoal', this.goals);
        this.$router.push({ name: 'GoalPage' })
      }
    },
    mounted() {
      this.getGoal()
    }
  }
</script>

<style>
</style>