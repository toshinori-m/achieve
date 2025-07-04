import axios from 'axios'
import { ref } from 'vue'
import removeItem from './removeItem'

const error = ref(null)
const validate = async () => {
  error.value = null
  const uid = window.localStorage.getItem('uid')
  const client = window.localStorage.getItem('client')
  const accessToken = window.localStorage.getItem('access-token')

  try {
    const res = await axios.get(`${process.env.VUE_APP_API_BASE_URL}/auth/validate_token`, {
      headers: {
        uid: uid,
        'access-token': accessToken,
        client: client
      }
    })
    if (!res) {
      throw new Error('認証に失敗しました')
    }
    return res
  } catch (err) {
    error.value = '認証に失敗しました'
    removeItem()
  } 
}

const useValidate = () => {
  return { error, validate }
}

export default useValidate