<template>
  <div class="text-center mt-13 mb-5">
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
</style>