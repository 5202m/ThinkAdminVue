<template lang="pug">
  <div>
    <el-button class="mb-20" type="primary" icon="el-icon-plus" @click="add">添加</el-button>
    <el-table :data="data.data" border v-loading="loading" :row-class-name="tableRowClassName" row-key="cat_id">
      <el-table-column prop="cat_id" label="ID" align="center" width="100"></el-table-column>
      <el-table-column prop="cat_name" label="属性名称" align="center"></el-table-column>
      <el-table-column prop="attr_group" label="商品类型" align="center"></el-table-column>
      <el-table-column prop="attr_count" label="属性是否可选" align="center"></el-table-column>
      <el-table-column prop="enabled" label="属性值的录入方式" align="center">
        <template slot-scope="scope">
          <el-tag :type="scope.row.enabled | showFilterType">{{scope.row.enabled | showFilter}}</el-tag>
        </template>
      </el-table-column>
      <el-table-column prop="attr_count" label="可选值列表" align="center"></el-table-column>
      <el-table-column prop="attr_count" label="排序" align="center"></el-table-column>
      <el-table-column label="操作" width="300" align="center">
        <template slot-scope="scope">
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
        <el-form-item label="属性名称" prop="attr_name">
          <el-input v-model="ruleForm.attr_name" placeholder="输入属性名称" />
        </el-form-item>
        <el-form-item label="所属商品类型" prop="cat_id">
          <el-select v-model="ruleForm.cat_id" placeholder="请选择">
            <el-option v-for="item in options" :key="item.cat_id" :label="item.cat_name" :value="item.cat_id" />
          </el-select>
        </el-form-item>
        <el-form-item label="分类筛选样式" prop="attr_cat_type">
          <el-radio-group v-model="ruleForm.attr_cat_type">
            <el-radio :label="0">普通</el-radio>
            <el-radio :label="1">颜色</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="能否进行检索" prop="attr_index">
          <el-radio-group v-model="ruleForm.attr_index">
            <el-radio :label="0">不需要检索</el-radio>
            <el-radio :label="1">关键字检索</el-radio>
            <el-radio :label="2">范围检索</el-radio>
          </el-radio-group>
          <br />
          <el-tag>不需要该属性成为检索商品条件的情况请选择不需要检索，需要该属性进行关键字检索商品时选择关键字检索，如果该属性检索时希望是指定某个范围时，选择范围检索。</el-tag>
        </el-form-item>
        <el-form-item label="相同属性值的商品是否关联" prop="is_linked">
          <el-radio-group v-model="ruleForm.is_linked">
            <el-radio :label="0">否</el-radio>
            <el-radio :label="1">是</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="属性是否可选" prop="attr_type">
          <el-radio-group v-model="ruleForm.attr_type">
            <el-radio :label="0">唯一属性</el-radio>
            <el-radio :label="1">单选属性</el-radio>
            <el-radio :label="2">复选属性</el-radio>
          </el-radio-group>
          <br />
          <el-tag>选择"单选/复选属性"时，可以对商品该属性设置多个值，同时还能对不同属性值指定不同的价格加价，用户购买商品时需要选定具体的属性值。选择"唯一属性"时，商品的该属性值只能设置一个值，用户只能查看该值。</el-tag>
        </el-form-item>
        <el-form-item label="该属性值的录入方式" prop="attr_input_type">
          <el-radio-group v-model="ruleForm.attr_input_type">
            <el-radio :label="0">手工录入</el-radio>
            <el-radio :label="1">从下面的列表中选择（一行代表一个可选值）</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="可选值列表" prop="attr_values">
          <el-input type="textarea" :rows="6" v-model="ruleForm.attr_values" placeholder="每行一个商品属性组。排序也将按照自然顺序排序。" />
        </el-form-item>
        <el-form-item label="排序" prop="sort_order">
          <el-input-number v-model="ruleForm.sort_order" :min="0" />
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
        total: 0,
        cat_id: 0
      },
      loading: false,
      f_loading: false,
      dialogFormVisible: false,
      ruleForm: {
        attr_name: '',
        cat_id: 0,
        attr_cat_type: 0,
        attr_index: 0,
        is_linked: 0,
        attr_type: 0,
        attr_input_type: 0,
        attr_values: '',
        sort_order: 0
      },
      title: '添加商品类型属性',
      rules: {
        attr_name: [
          { required: true, message: '请填写商品类型属性名称', trigger: 'blur' }
        ],
        cat_id: [
          { required: true, message: '请选择商品类型', trigger: 'blur' }
        ]
      },
      type: 2,
      options: [{
        cat_id: 0,
        cat_name: ''
      }]
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
        let res = await api.attribute.del(e.cat_id)
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
      this.$router.push({path: '/shop/attr/add'})
      this.dialogFormVisible = true
      this.title = '添加商品类型'
      this.type = 1
      this.$nextTick(() => {
        this.$refs['ruleForm'].resetFields()
        delete this.ruleForm.attr_id
        this.ruleForm.cat_id = 0
        this.ruleForm.attr_name = ''
        this.ruleForm.attr_cat_type = 0
        this.ruleForm.attr_index = 0
        this.ruleForm.is_linked = 0
        this.ruleForm.attr_type = 0
        this.ruleForm.attr_input_type = 0
        this.ruleForm.attr_values = ''
        this.ruleForm.sort_order = 0
      })
    },
    edit (e) {
      this.dialogFormVisible = true
      this.title = '编辑商品类型'
      this.type = 2
      this.ruleForm.attr_id = e.attr_id
      this.ruleForm.attr_name = e.attr_name
      this.ruleForm.cat_id = e.cat_id
      this.ruleForm.attr_cat_type = e.attr_cat_type
      this.ruleForm.attr_index = e.attr_index
      this.ruleForm.is_linked = e.is_linked
      this.ruleForm.attr_type = e.attr_type
      this.ruleForm.attr_input_type = e.attr_input_type
      this.ruleForm.attr_values = e.attr_values
      this.ruleForm.sort_order = e.sort_order
    },
    async submit () {
      this.f_loading = true
      this.$refs['ruleForm'].validate(async (valid) => {
        if (valid) {
          let res = []
          if (this.type === 1) {
            res = await api.attribute.save(this.ruleForm)
          } else {
            res = await api.attribute.update(this.ruleForm)
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
      let res = await api.attribute.enable(data)
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
        pageSize: this.data.pageSize,
        cat_id: this.data.cat_id
      }
      this.loading = true
      let res = await api.attribute.index(_params)
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
    getParams () {
      this.data.cat_id = this.$route.params.cat_id
      console.log('data.cat_id', this.data.cat_id)
    }
  },
  watch: {
    '$route': 'getParams'
  },
  computed: {
    header () {
      return {
        'X-Requested-Token': sessionStorage.getItem('token') ? sessionStorage.getItem('token') : null
      }
    }
  },
  mounted () {
    this.getParams()
    this.getData()
  }
}
</script>
<style>
.el-table .bg{
  background: #EDE7F6;
}
</style>
