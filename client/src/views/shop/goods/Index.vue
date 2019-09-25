<template lang="pug">
  <div>
    <el-button class="mb-20" type="primary" icon="el-icon-plus" @click="add">添加</el-button>
    <el-table :data="data.data" border v-loading="loading">
      <el-table-column prop="goods_id" label="编号" align="center"></el-table-column>
      <el-table-column prop="goods_name" label="商品名称" align="center"></el-table-column>
      <el-table-column prop="remark" label="价格/货号/运费" align="center"></el-table-column>
      <el-table-column prop="status" label="标签" align="center">
        <template slot-scope="scope">
          <el-tag :type="scope.row.status | statusFilterType">{{scope.row.status | statusFilter}}</el-tag>
        </template>
      </el-table-column>
      <el-table-column prop="sort_order" label="排序" align="center"></el-table-column>
      <el-table-column prop="sku" label="SKU/库存" align="center"></el-table-column>
      <el-table-column prop="review_status" label="审核状态" align="center"></el-table-column>
      <el-table-column label="操作" width="260" align="center" fixed="right">
        <template slot-scope="scope">
          <el-button size="mini" type="primary" plain @click="edit(scope.row)">编辑</el-button>
          <el-button v-if="scope.row.status==1" size="mini" plain type="warning" @click="enable(scope.row)">禁用</el-button>
          <el-button v-else size="mini" plain type="success" @click="enable(scope.row)">启用</el-button>
          <el-button size="mini" type="danger" plain @click="del(scope.row,scope.$index)">删除</el-button>
        </template>
      </el-table-column>
    </el-table>
    <div class="block">
      <el-pagination @size-change="handleSizeChange" @current-change="handleCurrentChange" :current-page="data.currentPage" :page-sizes="[10, 20, 30, 40, 50]" :page-size="data.pageSize" layout="total, sizes, prev, pager, next, jumper" :total="data.total">
      </el-pagination>
    </div>
  </div>
</template>
<script>
import api from '@/api'
import util from '@/utils'
export default{
  data () {
    return {
      data: {
        data: [],
        currentPage: 1,
        pageSize: 10,
        total: 0
      },
      loading: false,
      f_loading: false,
      dialogFormVisible: false,
      ruleForm: {
        name: null,
        remark: null
      },
      title: '添加部门',
      rules: {
        name: [
          { required: true, message: '请填写部门名称', trigger: 'blur' }
        ]
      },
      type: 1
    }
  },
  methods: {
    async del (e, index) {
      this.$confirm('此操作将永久删除该记录, 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(async () => {
        let res = await api.good.del(e.id)
        util.response(res, this)
        if (res.code === 200) {
          util.message('操作成功')
          this.data.splice(index, 1)
        } else {
          util.message(res.error, 'error')
        }
      }).catch(() => {
      })
    },
    add () {
      this.$router.push({path: '/shop/good/add'})
    },
    edit (e) {
      this.$router.push({path: '/shop/good/add/' + e.id})
    },
    async submit () {
      this.f_loading = true
      this.$refs['form'].validate(async (valid) => {
        if (valid) {
          let res = []
          if (this.type === 1) {
            res = await api.good.save(this.ruleForm)
          } else {
            res = await api.good.update(this.ruleForm)
          }
          util.response(res, this)
          this.f_loading = false
          if (res.code === 200) {
            util.message('操作成功')
            this.dialogFormVisible = false
            this.getData()
          } else {
            util.message(res.error, 'error')
          }
        } else {
          this.f_loading = false
          return false
        }
      })
    },
    async enable (e) {
      let data = {
        'id': e.id,
        'status': e.status ? 0 : 1
      }
      let res = await api.good.enable(data)
      util.response(res, this)
      if (res.code === 200) {
        e.status = e.status ? 0 : 1
      } else {
        util.message(res.error, 'error')
      }
    },
    async getData () {
      let _params = {
        currentPage: this.data.currentPage,
        pageSize: this.data.pageSize
      }
      this.loading = true
      let res = await api.good.index(_params)
      util.response(res, this)
      this.loading = false
      if (res.code === 200) this.data = res.data
    },
    handleSizeChange (val) {
      console.log(`每页 ${val} 条`)
    },
    handleCurrentChange (val) {
      console.log(`当前页: ${val}`)
    }
  },
  mounted () {
    this.getData()
  }
}
</script>
<style>

</style>
