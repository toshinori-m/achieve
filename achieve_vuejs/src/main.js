import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import './index.css'
import './assets/main.css'
import { FontAwesomeIcon } from "@fortawesome/vue-fontawesome"
import { library } from "@fortawesome/fontawesome-svg-core"
import { faHeart } from "@fortawesome/free-solid-svg-icons"
import { SetupCalendar } from 'v-calendar';

library.add(faHeart)
createApp(App).use(router,SetupCalendar, {}).component("font-awesome-icon", FontAwesomeIcon).mount('#app')
