// 全局过滤
import Vue from 'vue'
import moment from 'moment'

Vue.filter('statusFilter', function (value) {
  if (value) {
    return '启用'
  } else {
    return '禁用'
  }
})

Vue.filter('statusFilterType', function (value) {
  if (value) {
    return 'success'
  } else {
    return 'danger'
  }
})

Vue.filter('showFilter', function (value) {
  if (value) {
    return '显示'
  } else {
    return '隐藏'
  }
})

Vue.filter('showFilterType', function (value) {
  if (value) {
    return ''
  } else {
    return 'info'
  }
})

Vue.filter('hiddenFilter', function (value) {
  if (value) {
    return '隐藏'
  } else {
    return '显示'
  }
})

Vue.filter('hiddenFilterType', function (value) {
  if (value) {
    return 'info'
  } else {
    return ''
  }
})

Vue.filter('timeFilter', function (value, format = 'YYYY-MM-DD H:mm:ss') {
  if (!value) return ''
  let day = moment.unix(value)
  let date = moment(day).format(format)
  return date
})

Vue.filter('enableShowFilter', function (value) {
  if (value) {
    return '隐藏'
  } else {
    return '显示'
  }
})

Vue.filter('enableShowFilterType', function (value) {
  if (value) {
    return 'warning'
  } else {
    return 'success'
  }
})

Vue.filter('inputTypeFilter', function (value) {
  if (value) {
    return '从列表中选择'
  } else {
    return '手工录入'
  }
})

Vue.filter('attrTypeFilter', function (value) {
  if (value === 0) {
    return '唯一属性'
  } else if (value === 1) {
    return '单选属性'
  } else if (value === 2) {
    return '复选属性'
  }
})
