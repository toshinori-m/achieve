<template>
  <div class="calendar">
    <h2>&lt;カレンダー&gt;</h2>
    <DatePicker mode="date" v-model="date" :masks="masks">
      <template v-slot="{ inputValue, inputEvents }">
        <input
          id="input_date"
          class="number_of_days"
          :value="inputValue"
          v-on="inputEvents"
        />
      </template>
    </DatePicker>
    <form @submit="redirectToReport">
      <button class="ok_button" id="submit_btn">カレンダーの日付を選択後クリック</button>
    </form>
    <!-- <div v-for="report in reports" :key="report.id">
      <p> {{ report }} </p>
    </div> -->
    <div class="error">{{ error }}</div>
  </div>
</template>
<script>
import 'v-calendar/dist/style.css';
import { DatePicker } from 'v-calendar';
import axios from 'axios'
// import getItem from '../../auth/getItem'

export default {
  components: {
    DatePicker,
  },
  data() {
    return {
      reports: "",
      error: null,
      date: new Date(),
      masks: {
        input: 'YYYY-MM-DD',
      },
    };
  },
  methods: {
    async getReport () {
      try {
        const datePicker = document.getElementById('input_date');
        document.getElementById('submit_btn').addEventListener('click', () => {
        window.location.href = 'http://localhost:8080/reports/new/?datepicker_value=' + datePicker.value;
        });
        const res = await axios.get('achieve_rails:3000/reports', {
          headers: {
            uid: window.localStorage.getItem('uid'),
            "access-token": window.localStorage.getItem('access-token'),
            client: window.localStorage.getItem('client')
            }
        })
        if (!res) {
          new Error('取得できませんでした')
        }
        this.reports = res.data
        }  catch (error) {
      console.log({ error })
      this.error = 'reportを表示できませんでした'
      }
    },
    redirectToReport () {
      this.$router.push({ name: 'ReportPage' })
    }
  },
  mounted() {
    this.getReport()
  }
}
</script>
<style>
.calendar {
  text-align: center;
  margin: -150px 0px 0px 0px;
}
.calendar h2{
  font-size: 30px;
  letter-spacing: 5px;
  margin-bottom: 30px;
  text-align: center;
  color: white;
  text-shadow: 1px 1px 2px blue;
}
.number_of_days{
  font-size: 18px;
  padding: 5px 10px;
  letter-spacing: 5px;
  margin-bottom: 15px;
  text-align: center;
  border: none;
}
</style>