<template lang="pug">
  <el-container>
    <el-aside width="200px">
      <Menu />
    </el-aside>
    <el-container>
      <el-header>
        <Header />
      </el-header>
      <el-main>
        <transition name="fade-transform" mode="out-in">
          <router-view />
        </transition>
      </el-main>
      <el-footer>
        <Footer />
      </el-footer>
    </el-container>
  </el-container>
</template>
<script>
import Menu from '@/views/components/Menu'
import Header from '@/views/components/Header'
import Footer from '@/views/components/Footer'
export default {
  name: 'App',
  components: {
    Footer,
    Header,
    Menu
  },
  data () {
    return {
    }
  },
  methods: {
  }
}
</script>
<style scoped>
  .fade-transform-leave-active,
  .fade-transform-enter-active {
    transition: all .5s;
  }
  .fade-transform-enter {
    opacity: 0;
    transform: translateX(-30px);
  }
  .fade-transform-leave-to {
    opacity: 0;
    transform: translateX(30px);
  }

  .el-header, .el-footer {
    /* background-color: #B3C0D1; */
    /* color: #333; */
    text-align: center;
    line-height: 60px;
  }
  .el-footer{
    box-shadow: 0px -2px 5px #e3e3e3;
    -moz-box-shadow: 0px -2px 5px #e3e3e3;
    z-index:1;
  }
  .el-aside {
    height: 100%;
  }

  .el-main {
    /* background-color: #E9EEF3; */
    color: #333;
  }
  body .el-container {
    height: 100%;
  }

  .el-container:nth-child(5) .el-aside,
  .el-container:nth-child(6) .el-aside {
    line-height: 260px;
  }

  .el-container:nth-child(7) .el-aside {
    line-height: 320px;
  }
</style>
