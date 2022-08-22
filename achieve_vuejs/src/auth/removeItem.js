const removeItem = () => {
  window.localStorage.removeItem('uid')
  window.localStorage.removeItem('access-token')
  window.localStorage.removeItem('client')
  window.localStorage.removeItem('name')
}

export default removeItem