<template>
  <div class="container">
    <Navbar />
    <ChatWindow @connectCable="connectCable" :messages="formattedMessages" ref="chatWindow" />
    <NewChatForm @connectCable="connectCable" />
  </div>
</template>

<script>
import Navbar from '../components/chatroom/NavbarForm.vue'
import ChatWindow from '../components/chatroom/ChatWindow.vue'
import NewChatForm from '../components/chatroom/NewChatForm.vue'
import axios from 'axios'
import ActionCable from 'actioncable'
import { formatDistanceToNow } from 'date-fns'
import { ja } from 'date-fns/locale'
import getItem from '../auth/getItem'

export default {
  components: { Navbar, ChatWindow, NewChatForm },
  data () {
    return {
      messages: [],
    }
  },
  computed: {
    formattedMessages () {
      if (!this.messages.length) { return [] }
      return this.messages.map(message => {
        let time = formatDistanceToNow(new Date(message.created_at), { locale: ja })
        return { ...message, created_at: time }
      })
    }
  }, 
  methods: {
    async getMessages () {
      try {
        const res = await axios.get('http://54.199.72.77:3000/messages', {
          headers: getItem
        })
        if (!res) {
          new Error('メッセージ一覧を取得できませんでした')
        }
        this.messages = res.data
      } catch (err) {
        console.log(err)
      }
    },
    connectCable (message) {
      this.messageChannel.perform('receive', {
        message: message,
        email: window.localStorage.getItem('uid')
      })
    }
  },
  mounted() {
    const cable = ActionCable.createConsumer('ws://http://54.199.72.77:3000/cable')
    this.messageChannel = cable.subscriptions.create('RoomChannel', {
      connected: () => {
        this.getMessages().then(() => {
          this.$refs.chatWindow.scrollToBottom()
        })
      },
      received: () => {
        this.getMessages().then(() => {
          this.$refs.chatWindow.scrollToBottom()
        })
      }
    })
  },
  beforeUnmount () { 
    this.messageChannel.unsubscribe()
  }
}
</script>

<style>
.container {
  width: 90%;
  max-width: 960px;
  margin: 80px auto;
  border-radius: 3px;
  box-shadow: 2px 4px 6px rgba(28, 6, 49, 0.1);
}
</style>