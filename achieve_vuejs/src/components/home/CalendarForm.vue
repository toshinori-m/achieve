<template>
  <div class="text-center">
    <h2 class="uppercase text-3xl tracking-widest mb-3 text-center text-white text-shadow-b">&lt;カレンダー&gt;</h2>
    <DatePicker mode="date" v-model="date" />
    <form @submit.prevent="redirectToReport">
      <button class="ok_button" id="submit_btn">カレンダーの日付を選択後クリック</button>
    </form>
    <div class="error">{{ error }}</div>
  </div>
</template>

<script>
import 'v-calendar/dist/style.css';
import { DatePicker } from 'v-calendar';

export default {
  components: {
    DatePicker,
  },
  data() {
    return {
      error: null,
      date: new Date(),
    };
  },
  methods: {
    redirectToReport() {
      const selectedDate = this.date;
      if (!selectedDate) {
        this.error = '日付を選択してください';
        return;
      }
      const formattedDate = selectedDate.toISOString().split('T')[0];
      this.$router.push({ name: 'ReportPage', query: { datepicker_value: formattedDate } });
    },
  },
};
</script>
