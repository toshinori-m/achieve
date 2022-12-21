<template>
  <div class="bg-white rounded-2xl border-4 border-cyan-400 py-7 px-5 ">
    <div v-if="messages" class="max-h-96 overflow-auto text-xs sm:text-sm" ref="messages">
      <ul class="list-none" v-for="message in messages" :key="message.id">
        <li class="inline-block clear-both" :class="{ received: message.email !== uid, sent: message.email == uid }">
          <span class="relative mr-1.5 block text-xs">{{ message.name }}</span>
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
        const res = await axios.post(`http://localhost:3000/messages/${messageId}/likes`, {},
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
        const res = await axios.delete(`http://localhost:3000/likes/${likeId}`,
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
  .chat-window {
    /* background: white; */
    /* padding: 30px 20px; */
    /* border-bottom: 1px solid #eee; */
  }
  ul {
    /* list-style: none; */
    /* margin: 0;
    padding: 0; */
  }
  ul li {
    /* display:inline-block; */
    /* clear: both; */
  }
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
    padding: 10px;
    display: inline-block;
    border-radius: 30px;
    margin-bottom: 2px;
    max-width: 400px;
  }
  .name {
    /* position: relative; */
    /* margin-right: 6px;
    display: block;
    font-size: 13px; */
  }
  .created-at {
    /* display: block; */
    /* color: #999; */
    /* font-size: 12px; */
    /* margin-bottom: 20px; */
    /* margin-left: 4px; */
    /* margin-top: 3px; */
  }
  .messages {
    /* max-height: 400px; */
    /* overflow: auto; */
  }
  .message {
    /* position: relative; */
  }
  .heart-container {
    /* background: white; */
    /* position: absolute; */
    /* display: flex; */
    /* justify-content: space-around; */
    /* align-items: center; */
    /* border-radius: 30px; */
    /* min-width: 25px; */
    /* border-style: solid; */
    /* border-width: 1px; */
    /* border-color: rgb(245, 245, 245); */
    /* padding: 1px 2px; */
    /* z-index: 2; */
    /* bottom: -7px; */
    /* right: 0px; */
    /* font-size: 9px; */
  }
  .received .message::selection {
    /* background: #eee; */
  }
  .sent .message::selection {
    /* background: #677bb4; */
  }
</style>