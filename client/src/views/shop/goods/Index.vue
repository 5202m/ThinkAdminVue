<template lang="pug">
  <div>
    <el-button class="mb-20" type="primary" icon="el-icon-plus" @click="add">添加</el-button>
    <el-table :data="data.data" border v-loading="loading">
      <el-table-column prop="goods_id" label="编号" align="center"></el-table-column>
      <el-table-column label="商品名称" align="center">
        <template slot-scope="scope">
          <el-image style="width:100px;height:100px" :src="scope.row.goods_img | showImgFilter" fit="fill"></el-image>
          <span>{{scope.row.goods_name}}</span>
        </template>
      </el-table-column>
      <el-table-column label="价格/货号/运费" align="left">
        <template slot-scope="scope">
          <span>价格：{{scope.row.shop_price}}</span><br />
          <span>货号：{{scope.row.goods_sn}}</span><br />
          <span>运费：{{scope.row.freight | freightFilter}}</span>
        </template>
      </el-table-column>
      <el-table-column label="标签" align="left">
        <template slot-scope="scope">
          <span>精品：<el-switch v-model="scope.row.is_best + ''" active-value="1" inactive-value="0" @change="enable(scope.row, 'is_best')" /></span><br />
          <span>新品：<el-switch v-model="scope.row.is_new + ''" active-value="1" inactive-value="0" @change="enable(scope.row, 'is_new')" /></span><br />
          <span>热销：<el-switch v-model="scope.row.is_hot + ''" active-value="1" inactive-value="0" @change="enable(scope.row, 'is_hot')" /></span><br />
          <span>上架：<el-switch v-model="scope.row.is_on_sale + ''" active-value="1" inactive-value="0" @change="enable(scope.row, 'is_on_sale')" /></span>
        </template>
      </el-table-column>
      <el-table-column prop="sort_order" label="排序" align="center"></el-table-column>
      <el-table-column prop="sku" label="SKU/库存" align="center"></el-table-column>
      <el-table-column label="审核状态" align="center">
        <template slot-scope="scope">
          <el-tag>{{scope.row.review_status | reviewStatusFilter}}</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="操作" width="260" align="center" fixed="right">
        <template slot-scope="scope">
          <el-button size="mini" type="primary" plain @click="edit(scope.row)">编辑</el-button>
          <!--el-button v-if="scope.row.status==1" size="mini" plain type="warning" @click="enable(scope.row)">禁用</el-button>
          <el-button v-else size="mini" plain type="success" @click="enable(scope.row)">启用</el-button-->
          <el-button size="mini" type="danger" plain @click="del(scope.row, scope.$index)">删除</el-button>
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
      this.$router.push({path: '/shop/good/add?id=' + e.goods_id})
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
    async enable (e, key) {
      let data = {
        'id': e.goods_id
      }
      if (key === 'is_best') {
        data.is_best = e.is_best ? 0 : 1
      } else if (key === 'is_new') {
        data.is_new = e.is_new ? 0 : 1
      } else if (key === 'is_hot') {
        data.is_hot = e.is_hot ? 0 : 1
      } else if (key === 'is_on_sale') {
        data.is_on_sale = e.is_on_sale ? 0 : 1
      }
      let res = await api.good.enable(data)
      util.response(res, this)
      if (res.code === 200) {
        e[key] = e[key] ? 0 : 1
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
