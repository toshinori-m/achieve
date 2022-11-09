<template>
  <div class="goal">
    <h2>今期目標</h2>
    <form @submit.prevent ="goal">
      <input type="aim" required placeholder="今期目標を入力" v-model="aim">
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
    async goal() {
      try {
        const res = await axios.post('http://54.65.83.225:3000/goals',  {
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
        this.error = 'goalを表示できませんでした'
      }
    }
  }
}
</script>

<style>
.goal {
  padding: 150px 0;
}
.goal h2{
  font-size: 30px;
  letter-spacing: 5px;
  margin-bottom: 30px;
  text-align: center;
  color: white;
  text-shadow: 1px 1px 2px blue;
}
.goal form {
  width: 800px;
  margin: 60px auto;
}
.goal input {
  width: 100%;
  padding: 8px 20px;
  margin: 8px auto;
  border-radius: 4px;
  border: 1px solid rgb(238, 238, 238);
  outline: none;
  box-sizing: border-box;
}
.goal button {
  margin: 30px auto;
}
</style>