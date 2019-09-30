<template lang="pug">
  <div>
    <el-button class="mb-20" type="primary" icon="el-icon-plus" @click="add">添加</el-button>
    <el-table :data="data.data" border v-loading="loading" :row-class-name="tableRowClassName" row-key="attr_id">
      <el-table-column prop="attr_id" label="ID" align="center" width="100"></el-table-column>
      <el-table-column prop="attr_name" label="属性名称" align="center"></el-table-column>
      <el-table-column prop="goods_type.cat_name" label="商品类型" align="center"></el-table-column>
      <el-table-column prop="attr_type" label="属性是否可选" align="center">
        <template slot-scope="scope">
          <el-tag>{{scope.row.attr_type | attrTypeFilter}}</el-tag>
        </template>
      </el-table-column>
      <el-table-column prop="attr_input_type" label="属性值的录入方式" align="center">
        <template slot-scope="scope">
          <el-tag>{{scope.row.attr_input_type | inputTypeFilter}}</el-tag>
        </template>
      </el-table-column>
      <el-table-column prop="attr_values" label="可选值列表" align="center"></el-table-column>
      <el-table-column prop="sort_order" label="排序" align="center"></el-table-column>
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
        let res = await api.attribute.del(e.attr_id)
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
      this.$router.push({path: '/shop/attr/edit'})
    },
    edit (e) {
      this.$router.push({path: '/shop/attr/edit?id=' + e.attr_id})
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
