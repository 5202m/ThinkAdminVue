<template lang="pug">
  <div id="login-container" v-loading="loading">
    <div class="content">
      <div class="login fl">
        <el-header class="text-center">后台管理系统</el-header>
        <el-main>
          <el-form :model="ruleForm" :rules="rules" ref="ruleForm">
            <el-form-item prop="username">
              <el-input v-model="ruleForm.username" auto-complete="off">
                <i slot="prefix">
                  <svg class="icon fs-20 mt-10" aria-hidden="true" @click="toLink">
                    <use xlink:href="#nan-icon-user" />
                  </svg>
                </i>
              </el-input>
            </el-form-item>
            <el-form-item prop="password">
              <el-input type="password" v-model="ruleForm.password" auto-complete="off">
                <i slot="prefix">
                  <svg class="icon fs-20 mt-10" aria-hidden="true" @click="toLink">
                    <use xlink:href="#nan-icon-password" />
                  </svg>
                </i>
              </el-input>
            </el-form-item>
            <el-form-item class="text-center">
              <el-button class="bt-bg" type="primary" style="width:266px;margin-top:10px;" @click="submitForm('ruleForm')">登录</el-button>
            </el-form-item>
          </el-form>
        </el-main>
        <el-footer class="text-center">
          <svg class="icon" aria-hidden="true" @click="toLink">
            <use xlink:href="#nan-icon-github" />
          </svg>
        </el-footer>
      </div>
    </div>
  </div>
</template>

<script>
import login from '@/api/login'
import util from '@/utils'
import http from '@/utils/http'
export default{
  data () {
    let validateName = (rule, value, callback) => {
      if (value === '') {
        callback(new Error('请输入账号'))
      } else {
        callback()
      }
    }
    let validatePass = (rule, value, callback) => {
      if (value === '') {
        callback(new Error('请输入密码'))
      } else {
        callback()
      }
    }
    return {
      loading: false,
      ruleForm: {
        username: '',
        password: ''
      },
      rules: {
        username: [
          { validator: validateName, trigger: 'blur' }
        ],
        password: [
          { validator: validatePass, trigger: 'blur' }
        ]
      }
    }
  },
  methods: {
    submitForm (formName) {
      this.$refs[formName].validate(async (valid) => {
        if (valid) {
          this.loading = true
          let res = await login.login(this.ruleForm)
          await util.sleep(500)
          this.loading = false
          if (res.code === 200) {
            util.message('登陆成功')
            await util.sleep(500)
            if (res.data.user['avatar']) {
              res.data.user['avatar'] = http.baseURL + res.data.user['avatar']
            }
            sessionStorage.setItem('menus', JSON.stringify(res.data.menus))
            sessionStorage.setItem('user', JSON.stringify(res.data.user))
            sessionStorage.setItem('token', res.data.token)
            this.$router.push('/index')
          } else {
            util.message(res.error, 'error')
          }
        } else {
          console.log('error submit!!')
          return false
        }
      })
    },
    toLink () {
      window.open('https://github.com/5202m/ThinkAdminVue')
    }
  }
}
</script>

<style lang="less">
#login-container{
  position: relative;
  width: 100%;
  height: 100%;
  background-image: url("../../assets/image/background.jpg");
  background-repeat:no-repeat;
  background-size:100% 100%;
  -moz-background-size:100% 100%;

  .content{
    z-index: 1;
    position: absolute;
    top: 50%;
    left:50%;
    margin-left: -500px;
    margin-top: -280px;
    width: 1052px;
    height: 452px;
    background-image: url("../../assets/image/login-bg.png");
    border-radius: 10px;

    .login{
      width: 462px;
      height: 432px;
      margin-left:570px;
      padding: 20px;

      .el-form-item{
        margin-bottom: 36px;
      }
      .bt-bg{
        background-image: url("../../assets/image/login-btn.png");
        border: none
      }

      .el-header{
        line-height: 80px;
        height: 80px !important;
        font-size: 26px;
        color:#0088ff;
        font-weight: 600;
      }

      .el-footer{
        svg {
          cursor: pointer;
          font-size: 80px;
          margin-top: -20px;
        }
      }
    }

  }
}
</style>
