<template>
  <div class="text-center">
    <h2 class="uppercase text-3xl tracking-widest mb-3 text-center text-white text-shadow-b">&lt;カレンダー&gt;</h2>
    <DatePicker mode="date" v-model="date" :masks="masks">
      <template v-slot="{ inputValue, inputEvents }">
        <input
          id="input_date"
          class="text-center text-lg tracking-widest mb-3 py-1"
          :value="inputValue"
          v-on="inputEvents"
        />
      </template>
    </DatePicker>
    <form @submit="redirectToReport">
      <button class="ok_button" id="submit_btn">カレンダーの日付を選択後クリック</button>
    </form>
    <div class="error">{{ error }}</div>
  </div>
</template>
<script>
import 'v-calendar/dist/style.css';
import { DatePicker } from 'v-calendar';
import axios from 'axios'

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
        window.location.href = 'http://goals-achieve.click/reports/new/?datepicker_value=' + datePicker.value;
        });
        const res = await axios.get('https://backend-goals-achieve.onrender.com/reports', {
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
</style>