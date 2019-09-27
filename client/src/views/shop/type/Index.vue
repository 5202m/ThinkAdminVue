<template lang="pug">
  <div>
    <el-button class="mb-20" type="primary" icon="el-icon-plus" @click="add">添加</el-button>
    <el-table :data="data.data" border v-loading="loading" :row-class-name="tableRowClassName" row-key="cat_id">
      <el-table-column prop="cat_id" label="ID" align="center" width="100"></el-table-column>
      <el-table-column prop="cat_name" label="商品类型名称" align="center"></el-table-column>
      <el-table-column prop="attr_group" label="属性分组" align="center"></el-table-column>
      <el-table-column prop="attr_count" label="属性数" align="center"></el-table-column>
      <el-table-column prop="enabled" label="状态" align="center">
        <template slot-scope="scope">
          <el-tag :type="scope.row.enabled | showFilterType">{{scope.row.enabled | showFilter}}</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="操作" width="300" align="center">
        <template slot-scope="scope">
          <el-button size="mini" type="info" plain @click="editAttr(scope.row)" >属性列表</el-button>
          <el-button size="mini" type="primary" plain @click="edit(scope.row)">编辑</el-button>
          <el-button size="mini" type="danger" plain @click="del(scope.row,scope.$index)">删除</el-button>
        </template>
      </el-table-column>
    </el-table>
    <div class="block">
      <el-pagination @size-change="handleSizeChange" @current-change="handleCurrentChange" :current-page="data.currentPage" :page-sizes="[10, 20, 30, 40, 50]" :page-size="data.pageSize" layout="total, sizes, prev, pager, next, jumper" :total="data.total">
      </el-pagination>
    </div>
    <el-dialog :title="title" :visible.sync="dialogFormVisible" width="600px">
      <el-form v-loading="f_loading" :model="ruleForm" :rules="rules" ref="ruleForm" label-width="130px">
        <el-form-item label="商品类型名称" prop="cat_name">
          <el-input v-model="ruleForm.cat_name" placeholder="输入商品类型名称" />
        </el-form-item>
        <el-form-item label="属性分组" prop="attr_group">
          <el-input type="textarea" :rows="2" v-model="ruleForm.attr_group" placeholder="每行一个商品属性组。排序也将按照自然顺序排序。" />
        </el-form-item>
      </el-form>
      <div class="dialog-footer" slot="footer">
        <el-button @click="dialogFormVisible = false">取 消</el-button>
        <el-button type="primary" @click="submit">确 定</el-button>
      </div>
    </el-dialog>
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
        cat_name: '',
        attr_group: ''
      },
      title: '添加商品类型',
      rules: {
        cat_name: [
          { required: true, message: '请填写商品类型名称', trigger: 'blur' }
        ]
      },
      type: 2
    }
  },
  methods: {
    tableRowClassName ({row, rowIndex}) {
      if (row.child) {
        return 'bg'
      } else {
        return ''
      }
    },
    async del (e, index) {
      this.$confirm('此操作将永久删除该记录, 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(async () => {
        let res = await api.goodType.del(e.cat_id)
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
      this.dialogFormVisible = true
      this.title = '添加商品类型'
      this.type = 1
      this.$nextTick(() => {
        this.$refs['ruleForm'].resetFields()
        delete this.ruleForm.cat_id
        this.ruleForm.cat_name = ''
        this.ruleForm.attr_group = ''
      })
    },
    edit (e) {
      this.dialogFormVisible = true
      this.title = '编辑商品类型'
      this.type = 2
      this.ruleForm.cat_id = e.cat_id
      this.ruleForm.cat_name = e.cat_name
      this.ruleForm.attr_group = e.attr_group
    },
    async submit () {
      this.f_loading = true
      this.$refs['ruleForm'].validate(async (valid) => {
        if (valid) {
          let res = []
          if (this.type === 1) {
            res = await api.goodType.save(this.ruleForm)
          } else {
            res = await api.goodType.update(this.ruleForm)
          }
          util.response(res, this)
          this.f_loading = false
          if (res.code === 200) {
            this.dialogFormVisible = false
            util.message('操作成功')
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
    async enable (e, type) {
      let data = {
        'id': e.cat_id
      }
      if (type === 'show') {
        data.is_show = e.is_show ? 0 : 1
      } else if (type === 'nav') {
        data.show_in_nav = e.show_in_nav ? 0 : 1
      }
      let res = await api.goodType.enable(data)
      util.response(res, this)
      if (res.code === 200) {
        if (type === 'show') {
          e.is_show = e.is_show ? 0 : 1
        } else if (type === 'nav') {
          e.show_in_nav = e.show_in_nav ? 0 : 1
        }
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
      let res = await api.goodType.index(_params)
      util.response(res, this)
      this.loading = false
      if (res.code === 200) this.data = res.data
    },
    handleSizeChange (val) {
      console.log(`每页 ${val} 条`)
    },
    handleCurrentChange (val) {
      console.log(`当前页: ${val}`)
    },
    editAttr (e) {
      this.$router.push({path: '/shop/attr/index', params: {cat_id: e.cat_id}})
    }
  },
  computed: {
    header () {
      return {
        'X-Requested-Token': sessionStorage.getItem('token') ? sessionStorage.getItem('token') : null
      }
    }
  },
  mounted () {
    this.getData()
  }
}
</script>
<style>
.el-table .bg{
  background: #EDE7F6;
}
</style>
