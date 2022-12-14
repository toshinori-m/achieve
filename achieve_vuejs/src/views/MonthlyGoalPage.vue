<template>
  <div class="monthly_goal">
    <h2>今月目標</h2>
    <form @submit.prevent ="monthly_goal">
      <input type="aim" required placeholder="今月目標を入力" v-model="aim">
      <div class="error">{{ error }}</div>
      <button class="ok_button">OK</button>
    </form>
  </div>
</template>

<script>
import axios from 'axios'

export default {
  data () {
    return {
      aim: '',
      error: null
    }
  },
  methods: {
    async monthly_goal() {
      try {
        const res = await axios.post('http://localhost:3000/monthly_goals',  {
          aim: this.aim,
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
        this.error = 'monthly_goalを表示できませんでした'
      }
    }
  }
}
</script>

<style>
.monthly_goal {
  text-align: center;
  padding: 150px 0;
}
.monthly_goal h2{
  font-size: 30px;
  letter-spacing: 5px;
  margin-bottom: 30px;
  text-align: center;
  color: white;
  text-shadow: 1px 1px 2px blue;
}
.monthly_goal form {
  width: 800px;
  margin: 60px auto;
}
.monthly_goal input {
  width: 100%;
  padding: 8px 20px;
  margin: 8px auto;
  border-radius: 4px;
  border: 1px solid rgb(238, 238, 238);
  outline: none;
  box-sizing: border-box;
}
.monthly_goal .ok_button {
  margin: 30px auto;
}
</style>