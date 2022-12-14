<template>
  <div class="z-40 topHeader">
    <h1>achieve one's goal</h1>
    <top>
      <form @submit="redirectToWelcome">
        <button class="login_button ok_button">サインイン/ログイン</button>
      </form>
    </top>
  </div>
</template>
<script>
export default {
  methods: {
    redirectToWelcome () {
      this.$router.push({name: 'WelcomePage'})
    }
  }
}
</script>

<style>
.topHeader{
  background-color: #0066ff89;
  align-items: center;
  padding: 20px 20px;
  width: 100%;
  height: 70px;
  position: fixed;
  top: 0;
  left: 0;
}
.topHeader h1 {
  float: center;
  margin: 0px 50px 0px 50px;
  font-size: 25px;
  text-transform: uppercase;
  text-shadow: 1px 1px 2px rgb(0, 255, 145);
}
.login_button {
	position: relative;
  left: 1100px;
  top: -45px;
  margin: 0px -50px 0px 80px;
}
</style>