<template lang="pug">
  <div>
    <el-button class="mb-20" type="primary" icon="el-icon-plus" @click="add">添加</el-button>
    <el-table :data="data" border v-loading="loading">
      <el-table-column prop="index" label="序号" align="center" width="100">
        <template slot-scope="scope">
          <span>{{scope.$index + 1}}</span>
        </template>
      </el-table-column>
      <el-table-column prop="name" label="岗位名称" align="center"></el-table-column>
      <el-table-column prop="remark" label="备注" align="center"></el-table-column>
      <el-table-column prop="status" label="状态" align="center">
        <template slot-scope="scope">
          <el-tag :type="scope.row.status | statusFilterType">{{scope.row.status | statusFilter}}</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="操作" width="260" align="center">
        <template slot-scope="scope">
            <el-button size="mini" type="primary" plain @click="edit(scope.row)">编辑</el-button>
            <el-button v-if="scope.row.status==1" size="mini" plain type="warning" @click="enable(scope.row)">禁用</el-button>
            <el-button v-else size="mini" plain type="success" @click="enable(scope.row)">启用</el-button>
            <el-button size="mini" type="danger" plain @click="del(scope.row,scope.$index)">删除</el-button>
        </template>
      </el-table-column>
    </el-table>
    <el-dialog :title="title" :visible.sync="dialogFormVisible" width="500px">
      <el-form v-loading="f_loading" :model="ruleForm" :rules="rules" ref="form" label-width="80px">
        <el-form-item label="岗位名称" label-width="80px" prop="name">
          <el-input v-model="ruleForm.name" />
        </el-form-item>
        <el-form-item label="备注" label-width="80px">
          <el-input v-model="ruleForm.remark" />
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
      data: [],
      loading: false,
      f_loading: false,
      dialogFormVisible: false,
      ruleForm: {
        name: '',
        remark: ''
      },
      title: '添加岗位',
      rules: {
        name: [
          { required: true, message: '请填写岗位名称', trigger: 'blur' }
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
        let res = await api.position.del(e.id)
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
      this.title = '添加岗位'
      this.type = 1
      this.$nextTick(() => {
        this.$refs['form'].resetFields()
        delete this.ruleForm.id
        this.ruleForm.name = ''
        this.ruleForm.remark = ''
      })
    },
    edit (e) {
      this.dialogFormVisible = true
      this.title = '编辑岗位'
      this.type = 2
      this.ruleForm.name = e.name
      this.ruleForm.remark = e.remark
      this.ruleForm.id = e.id
    },
    async submit () {
      this.f_loading = true
      this.$refs['form'].validate(async (valid) => {
        if (valid) {
          let res = []
          if (this.type === 1) {
            res = await api.position.save(this.ruleForm)
          } else {
            res = await api.position.update(this.ruleForm)
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
      let res = await api.position.enable(data)
      util.response(res, this)
      if (res.code === 200) {
        e.status = data.status
      } else {
        util.message(res.error, 'error')
      }
    },
    async getData () {
      this.loading = true
      let res = await api.position.index()
      util.response(res, this)
      this.loading = false
      if (res.code === 200) this.data = res.data
    }
  },
  mounted () {
    this.getData()
  }
}
</script>
<style>

</style>
