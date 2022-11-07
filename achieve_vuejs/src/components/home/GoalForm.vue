<template>
  <div class="goal">
    <form @submit="redirectToGoal">
      <button class="ok_button">今期目標</button>
    </form>
    <div v-for="goal in goals" :key="goal.id">
      <p> {{ goal.aim }} </p>
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
        goals: "",
        error: null
      }
    },
    methods: {
      async getGoal () {
        try {
          const res = await axios.get('http://52.197.190.81:3000/goals', {
            headers: {
            uid: window.localStorage.getItem('uid'),
            "access-token": window.localStorage.getItem('access-token'),
            client: window.localStorage.getItem('client')
            }
          })
          if (!res) {
            new Error('取得できませんでした')
          }
          this.goals = res.data
        } catch (error) {
        console.log({ error })
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
  .goal {
    text-align: center;
    padding: 150px 0;
  }
  .goal p {
    text-align:left;
    font-size: 15px;
    padding: 5px 20px;
    margin: -50px;
    background-color: white;
    color: black;
  }
</style>