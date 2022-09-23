<template>
  <div>
    <p>Times clicked: {{ count }}</p>
    <button @click="increment">increment</button>
  </div>
</template>

<script>
import { defineComponent } from "vue";
export default defineComponent({
  name: "Counter",
  data: () => ({
    count: 0,
  }),

  methods: {
    increment() {
      this.count++;
    },
  },
});
</script>