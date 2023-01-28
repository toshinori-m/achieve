<template>
  <div class="bg-white rounded-2xl border-4 border-cyan-400 py-7 px-5 ">
    <div v-if="messages" class="max-h-96 overflow-auto text-xs sm:text-sm" ref="messages">
      <ul class="list-none" v-for="message in messages" :key="message.id">
        <li class="inline-block clear-both" :class="{ received: message.email !== uid, sent: message.email == uid }">
          <span class="mr-1.5 block text-xs">{{ message.name }}</span>
          <div class="message relative" @dblclick="handleLike(message)">
            {{ message.content }}
            <div v-if="message.likes.length" class="absolute bg-white flex justify-around items-center rounded-l-full w-7 z-30 border-2 border-gray-300 p-px z-20 -bottom-2.5 right-0 text-xs">
              <font-awesome-icon icon="heart" class="heart" />
              <span class="heart-count">{{ message.likes.length }}</span>
            </div>
          </div>
          <span class="block text-xs mb-5 mt-0.5 ml-1">{{ message.created_at }}前</span>
        </li>
      </ul>
    </div>
  </div>
</template>

<script>
import axios from 'axios' 

export default {
  emits: ['connectCable'],
  props: ['messages'],
  data () {
    return {
      uid: localStorage.getItem('uid')
    }
  },
  methods: {
    handleLike (message) {
      for (let i = 0; i < message.likes.length; i++) {
        const like = message.likes[i]
        if (like.email === this.uid) {
          this.deleteLike(like.id)
          return
        }
      }
      this.createLike(message.id)
    },
    async createLike (messageId) {
      try {
        const res = await axios.post(`http://goals-achieve.click:3000/messages/${messageId}/likes`, {},
          {
            headers: {
              uid: this.uid,
              "access-token": window.localStorage.getItem('access-token'),
              client: window.localStorage.getItem('client')
            }
          })

        if (!res) {
          new Error('いいねできませんでした')
        }
        this.$emit('connectCable')
      } catch (error) {
        console.log(error)
      }
    },
    async deleteLike(likeId) {
      try {
        const res = await axios.delete(`http://goals-achieve.click:3000/likes/${likeId}`,
          {
            headers: {
              uid: this.uid,
              "access-token": window.localStorage.getItem('access-token'),
              client: window.localStorage.getItem('client')
            }
          })
        
        if (!res) { 
          new Error('いいねを削除できませんでした')
        }
        this.$emit('connectCable')
      } catch (error) {
        console.log(error)
      }      
    },
    scrollToBottom () {
      const element = this.$refs.messages
      element.scrollTop = element.scrollHeight
    }
  },
  mounted () {
    this.scrollToBottom()
  }
}
</script>

<style scoped>
  .received .message {
    background: #eee;
    padding: 10px;
    display: inline-block;
    border-radius: 30px;
    margin-bottom: 2px;
    max-width: 400px;
  }
  .received {
    float: left;
  }
  .sent {
    float: right;
  }
  .sent .message {
    background: #677bb4;
    color: white;
    padding: 10px;
    display: inline-block;
    border-radius: 30px;
    margin-bottom: 2px;
    max-width: 400px;
  }
  .heart {
    color: rgb(236, 29, 29);
  }
  .heart-count {
    color: rgb(20, 19, 19);
  }
</style>