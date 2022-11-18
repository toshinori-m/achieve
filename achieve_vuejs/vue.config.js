devServer: {
  disableHostCheck: true
  }
  
  module.exports = defineConfig({
  transpileDependencies: true,
  devServer: {
  disableHostCheck: true
  },
  configureWebpack: {
  watch: true
  }
  })