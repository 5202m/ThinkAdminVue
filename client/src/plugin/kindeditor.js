import KindEditor from '@/views/public/KindEditor'

let install = (Vue) => {
  if (install.installed) return
  install.installed = true
  Vue.component('editor', KindEditor)
}

export default{
  install
}
