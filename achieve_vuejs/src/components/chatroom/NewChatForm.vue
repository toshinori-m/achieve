<template>
  <div class="my-5 mx-10">
    <form>
      <textarea class="w-full border-4 border-blue-600 border-double mb-1.5 p-2.5 box-border rounded-2xl"
        placeholder="メッセージを入力してEnterを押してください"
        v-model="message"
        @keypress.enter.prevent="handleSubmit"
      ></textarea>
    </form>
  </div>
</template>

<script>
export default {
  emits: ['connectCable'],
  data () {
    return {
      message: ''
    }
  },
  methods: {
    handleSubmit () {
      this.$emit('connectCable', this.message)
      this.message = ''
    }
  }
}
</script>

<style scoped>
</style>