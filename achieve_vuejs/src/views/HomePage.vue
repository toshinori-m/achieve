<template>
  <div class="container">
    <h1>Achieve your goals</h1>
    <div class="home">
      <GoalForm />
      <!-- <GoalForm @catchGoal="displayMessage"></GoalForm> -->
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
  .container h1 {
    font-size: 50px;
    letter-spacing: -2px;
    text-align: center;
    color: white;
    text-shadow: 1px 1px 2px blue;
  }
  .home {
    margin: -200px 0px 0px 0px;
  }
</style>
