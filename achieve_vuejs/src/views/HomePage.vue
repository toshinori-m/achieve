<template>
  <div class="text-center">
    <h1 class="uppercase text-3xl tracking-widest mb-7 text-center text-white text-shadow-b my-4">Achieve your goals</h1>
    <div class="-mt-20">
      <GoalForm />
      <ThreemonthsGoalForm />
      <MonthlyGoalForm />
      <RecordForm />
      <CalendarForm />
    </div>
  </div>
</template>
<script>
  import GoalForm from '../components/home/GoalForm.vue'
  import ThreemonthsGoalForm from '../components/home/ThreemonthsGoalForm.vue'
  import MonthlyGoalForm from '../components/home/MonthlyGoalForm.vue'
  import RecordForm from '../components/home/RecordForm.vue'
  import CalendarForm from '../components/home/CalendarForm.vue'
      
  export default {
    components: { GoalForm,ThreemonthsGoalForm,MonthlyGoalForm,RecordForm,CalendarForm 
    },
  }
</script>
<style>
</style>
