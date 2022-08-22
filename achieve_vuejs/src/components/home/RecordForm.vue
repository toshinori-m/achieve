<template>
  <div class="record_from">
    <button @click="onClickButton" class="ok_button">10日間の記録</button>
  </div>
</template>
<script>
  export default {
    methods: {
      onClickButton() {
        this.$router.push({ name: 'RecordPage' })
      }
    }
  }
</script>
<style>
  .record_from {
    text-align: center;
    padding: 0px 0 140px 0;
  }
</style>