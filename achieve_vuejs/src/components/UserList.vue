<template>
  <h2>ユーザ一覧</h2>
  <ul>
    <li v-for="user in users" :key="user.id">{{ user.name }}</li>
    </ul>
</template>
<script>
import axios from "axios"
export default {
  data(){
    return {
      users:[]
    }
  },
  async mounted() {
  const response = await axios.get(
    'https://jsonplaceholder.typicode.com/users'
  );
  this.users = response.data;
},
}
</script>