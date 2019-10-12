<template lang="pug">
  <div>
    <el-form v-loading="f_loading" :model="ruleForm" :rules="rules" ref="ruleForm" label-width="150px">
      <el-form-item label="商品分类" prop="cat_id">
        <el-select v-model="ruleForm.cat_id" placeholder="请选择">
          <el-option v-for="item in categoryData" :key="item.cat_id" :label="item.cat_name" :value="item.cat_id" />
        </el-select>
      </el-form-item>
      <el-form-item label="商品货号" prop="goods_sn">
        <el-input v-model="ruleForm.goods_sn" placeholder="输入分类别名" />
      </el-form-item>
      <el-form-item label="商品名称" prop="goods_name">
        <el-input v-model="ruleForm.goods_name" placeholder="输入分类名称" />
      </el-form-item>
      <el-form-item label="商品简单描述" prop="goods_brief">
        <el-input type="textarea" v-model="ruleForm.goods_brief" />
      </el-form-item>
      <el-form-item label="本店售价" prop="shop_price">
        <el-input v-model="ruleForm.shop_price" placeholder="输入本店售价" />
      </el-form-item>
      <el-form-item label="市场价" prop="market_price">
        <el-input v-model="ruleForm.market_price" placeholder="输入市场价" />
      </el-form-item>
      <el-form-item label="成本价" prop="cost_price">
        <el-input v-model="ruleForm.cost_price" placeholder="输入成本价" />
      </el-form-item>
      <el-form-item label="商品库存" prop="goods_number">
        <el-input-number v-model="ruleForm.goods_number" :min="1" />
      </el-form-item>
      <el-form-item label="库存预警值" prop="warm_number">
        <el-input-number v-model="ruleForm.warm_number" :min="1" :max="50" />
      </el-form-item>
      <el-form-item label="商品图片" prop="goods_img">
        <el-upload name="file" accept=".jpg,.png,.jpeg" :headers="header" :action="path" list-type="picture-card" :data="uploadData" :on-preview="handlePictureCardPreview" :on-remove="handleRemove">
          <i class="el-icon-plus"></i>
        </el-upload>
        <el-dialog :visible.sync="dialogVisible">
          <img width="100%" :src="dialogImageUrl" alt="">
        </el-dialog>
        <!--el-upload class="upload-demo" :headers="header" show-file-list="true" name="file" accept=".jpg,.png,.jpeg" :action="path" :file-list="imgList" :data="uploadData" :show-file-list="false" :on-success="handleImgSuccess" :before-upload="beforeImgUpload">
            <el-button size="small" type="primary">点击上传</el-button>
            <div slot="tip" class="el-upload__tip">注：手机端专用,建议上传正方形图片（100*100）</div>
        </el-upload-->
      </el-form-item>
      <el-form-item label="商品运费" prop="freight">
        <el-radio-group v-model="ruleForm.freight">
          <el-radio :label="0">按地区运费</el-radio>
          <el-radio :label="1">按固定运费</el-radio>
          <el-radio :label="2">按运费模板</el-radio>
        </el-radio-group>
      </el-form-item>
      <el-form-item label="退货标识" v-model="ruleForm.return_type" prop="return_type">
        <el-checkbox-group v-model="ruleForm.return_type">
          <el-checkbox v-for="(item, key) in returnTypeOptions" :label="key" :key="key">{{item}}</el-checkbox>
        </el-checkbox-group>
      </el-form-item>
      <el-form-item label="详细描述" prop="goods_desc">
        <editor id="editor_id" height="500px" width="100%" v-model="ruleForm.goods_desc" :content.sync="ruleForm.goods_desc" :afterChange="afterChange()" pluginsPath="../../../static/kindeditor/plugins/" :loadStyleMode="false" @on-content-change="onContentChange"></editor>
      </el-form-item>
      <el-form-item label="排序" prop="sort_order">
          <el-input-number v-model="ruleForm.sort_order" :min="0" />
      </el-form-item>
      <!--el-form-item v-if="ruleForm.pid == 0" label="图标">
        <el-input v-model="ruleForm.icon" />
      </el-form-item-->
      <el-form-item label="加入推荐">
        <el-checkbox :label="1" prop="is_best" v-model="ruleForm.is_best">精品</el-checkbox>
        <el-checkbox :label="1" prop="is_new" v-model="ruleForm.is_new">新品</el-checkbox>
        <el-checkbox :label="1" prop="is_hot" v-model="ruleForm.is_hot">热销</el-checkbox>
      </el-form-item>
      <el-form-item label="上架">
        <el-switch v-model="ruleForm.is_on_sale" />
      </el-form-item>
      <el-form-item label="能作为普通商品销售">
        <el-switch v-model="ruleForm.is_alone_sale" />
      </el-form-item>
      <el-form-item label="属性类型">
        <el-select v-model="ruleForm.goods_type" placeholder="请选择" @change="getAttrs($event)">
          <el-option v-for="item in goodsTypeData" :key="item.cat_id" :label="item.cat_name" :value="item.cat_id" />
        </el-select>
      </el-form-item>
      <el-form-item label="商品规格" v-if="ruleForm.goods_type != ''">
        <template>
          <table>
            <tr v-for="(row, k) in attrs">
              <td width='10%'>{{row.attr_name}}</td>
              <td>
                <el-checkbox-group v-if="row.attr_input_type === 1" v-model="ruleForm.attr_check_list" @change="attrCkChange($event)">
                  <el-checkbox v-for="(item, key) in row.attr_values.split('\n')" :label="item" :key="item">{{item}}</el-checkbox>
                </el-checkbox-group>
                <template v-if="row.attr_cat_type === 1">
                  <div style="float:left;margin-right:10px;" v-for="row in colorPickers">
                  <el-color-picker :v-model="ruleForm[row.name]" :value="row.value" size="mini" :predefine="predefineColors" @change="colorPickerChange($event, row.idx)"></el-color-picker>&nbsp;&nbsp;
                  <a href="javascript:void(0);" @click="addColorPicker($event, row.idx)"><i :class="row.iconCls"></i></a>
                  </div>
                </template>
              </td>
            </tr>
          </table>
          <table width="100%" v-if="attrTabData.length > 0" class="table table-bordered">
            <thead>
              <tr style="border: 1px #EBEEF5 solid;">
                <th v-for="(val, key) in attrTabHeader" v-if="val !== ''" style="width:10%;border: 0px #EBEEF5 solid" align="center">{{val}}</th>
              </tr>
            </thead>
            <tbody>
              <tr v-for="row in attrTabData">
                <td v-if="row.size !== ''" align="center">{{row.size}}</td>
                <td v-if="row.color !== ''" align="center">{{row.color}}</td>
                <td><el-input v-model="row.product_price" placeholder="0.00" /></td>
                <td><el-input v-model="row.product_number" placeholder="0" /></td>
                <td><el-input v-model="row.product_warn_number" placeholder="1" /></td>
                <td><el-input v-model="row.product_sn" placeholder="" /></td>
                <td><el-input v-model="row.product_bar_code" placeholder="" /></td>
                <td></td>
              </tr>
            </tbody>
          </table>
        </template>
      </el-form-item>
      <el-form-item label="属性图片" v-if="ruleForm.goods_type != '' && (attrImgSizeTabData.length > 0 || attrImgColorTabData.length > 0)">
        <template>
          <div v-if="attrImgSizeTabData.length > 0" class="attr_img">
            <div>尺码</div>
            <div class="attr_img_item" v-for="row in attrImgSizeTabData">
              <el-input v-model="row.size" size="medium" class="attr_img_input" />
              <span class="attr_img_sort">排序</span>
              <el-input v-model="row.sort" size="medium" class="attr_img_input" />
              <el-upload class="upload-demo attr_img_upload" action="https://jsonplaceholder.typicode.com/posts/">
                <el-button size="small" type="primary">点击上传</el-button>
              </el-upload>
            </div>
          </div>
          <div v-if="attrImgColorTabData.length > 0" class="attr_img">
            <div>颜色</div>
            <div class="attr_img_item" v-for="row in attrImgColorTabData">
              <el-input v-model="row.color" size="medium" class="attr_img_input" />
              <span class="attr_img_sort">排序</span>
              <el-input v-model="row.sort" size="medium" class="attr_img_input" />
            </div>
          </div>
        </template>
      </el-form-item>
    </el-form>
    <div class="dialog-footer" slot="footer" align="center">
      <el-button @click="cancel">取 消</el-button>
      <el-button type="primary" @click="submit">确 定</el-button>
    </div>
  </div>
</template>
<script>
import api from '@/api'
import util from '@/utils'
import upload from '@/api/upload'
export default{
  data () {
    return {
      data: [],
      loading: false,
      f_loading: false,
      dialogFormVisible: false,
      ruleForm: {
        cat_id: 0,
        goods_sn: '',
        goods_name: '',
        goods_brief: '',
        shop_price: '',
        market_price: '',
        cost_price: '',
        goods_number: 1,
        warm_number: 1,
        goods_img: [],
        freight: '',
        return_type: [],
        goods_desc: '',
        sort_order: 0,
        is_best: false,
        is_new: false,
        is_hot: false,
        is_on_sale: true,
        is_alone_sale: true,
        goods_type: '',
        attr_check_list: [],
        attr_color_list: [],
        color_0: ''
      },
      title: '添加商品分类',
      rules: {
        parent_id: [
          { required: true, message: '请选择上级分类', trigger: 'change' }
        ],
        cat_name: [
          { required: true, message: '请填写分类名称', trigger: 'blur' }
        ]
      },
      categoryData: [{
        cat_id: 0,
        cat_name: '顶级分类'
      }],
      options: [{
        cat_id: 0,
        cat_name: '顶级分类'
      }],
      goodsTypeData: [],
      type: 2,
      path: upload.upload(),
      imgList: [],
      returnTypeOptions: ['维修', '退货', '换货', '仅退款'],
      editorText: '直接初始化值',
      editorTextCopy: '',
      dialogImageUrl: '',
      dialogVisible: false,
      attrs: [],
      colorPickers: [{
        idx: 0,
        iconCls: 'el-icon-plus',
        name: 'color_0',
        value: ''
      }],
      attrTabHeader: {},
      attrTabData: [],
      attrImgSizeTabData: [],
      attrImgColorTabData: [],
      predefineColors: [
        '#000000',
        '#434343',
        '#666666',
        '#cccccc',
        '#d9d9d9',
        '#ffffff',
        '#980000',
        '#ff0000',
        '#ff9900',
        '#ffff00',
        '#00ff00',
        '#00ffff',
        '#4a86e8',
        '#0000ff',
        '#9900ff',
        '#ff00ff',
        '#e6b8af',
        '#f4cccc',
        '#fce5cd',
        '#fff2cc',
        '#d9ead3',
        '#d0e0e3',
        '#c9daf8',
        '#cfe2f3',
        '#d9d2e9',
        '#ead1dc',
        '#dd7e6b',
        '#ea9999',
        '#f9cb9c',
        '#ffe599',
        '#b6d7a8',
        '#a2c4c9',
        '#a4c2f4',
        '#9fc5e8',
        '#b4a7d6',
        '#d5a6bd',
        '#cc4125',
        '#e06666',
        '#f6b26b',
        '#ffd966',
        '#93c47d',
        '#76a5af',
        '#6d9eeb',
        '#6fa8dc',
        '#8e7cc3',
        '#c27ba0',
        '#a61c00',
        '#cc0000',
        '#e69138',
        '#f1c232',
        '#6aa84f',
        '#45818e',
        '#3c78d8',
        '#3d85c6',
        '#674ea7',
        '#a64d79',
        '#5b0f00',
        '#660000',
        '#783f04',
        '#7f6000',
        '#274e13',
        '#0c343d',
        '#1c4587',
        '#073763',
        '#20124d',
        '#4c1130'
      ]
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
        let res = await api.category.del(e.cat_id)
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
      this.title = '添加商品分类'
      this.type = 1
      this.$nextTick(() => {
        this.$refs['ruleForm'].resetFields()
        delete this.ruleForm.cat_id
        this.ruleForm.cat_name = ''
        this.ruleForm.parent_id = null
        this.ruleForm.cat_alias_name = ''
        this.ruleForm.keywords = ''
        this.ruleForm.cat_desc = ''
        this.ruleForm.show_in_nav = false
        this.ruleForm.is_show = true
        this.ruleForm.sort_order = 0
        this.ruleForm.touch_icon = ''
      })
    },
    edit (e) {
      this.dialogFormVisible = true
      this.title = '编辑商品分类'
      this.type = 2
      this.ruleForm.cat_id = e.cat_id
      this.ruleForm.cat_name = e.cat_name
      this.ruleForm.parent_id = e.parent_id
      this.ruleForm.cat_alias_name = e.cat_alias_name
      this.ruleForm.keywords = e.keywords
      this.ruleForm.cat_desc = e.cat_desc
      this.ruleForm.show_in_nav = !!e.show_in_nav
      this.ruleForm.is_show = !!e.is_show
      this.ruleForm.sort_order = e.sort_order
      this.ruleForm.touch_icon = e.touch_icon
    },
    cancel () {
      this.$router.push({path: '/shop/good/index'})
    },
    async submit () {
      this.f_loading = true
      this.$refs['ruleForm'].validate(async (valid) => {
        if (valid) {
          let res = []
          if (this.type === 1) {
            res = await api.category.save(this.ruleForm)
          } else {
            res = await api.category.update(this.ruleForm)
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
      let res = await api.category.enable(data)
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
      this.loading = true
      let res = await api.category.index()
      util.response(res, this)
      this.loading = false
      this.categoryData = res.data
      if (this.categoryData == null) {
        this.categoryData = [{cat_id: 0, cat_name: '顶级分类'}]
      }
      this.categoryData.unshift({cat_id: 0, cat_name: '顶级分类'})
      let typeRes = await api.goodType.typeList()
      util.response(typeRes, this)
      this.goodsTypeData = typeRes.data
      if (this.goodsTypeData == null) {
        this.goodsTypeData = []
      }
    },
    async getAttrs (event) {
      this.attrTabData = []
      let _params = {
        cat_id: event
      }
      let res = await api.attribute.list(_params)
      util.response(res, this)
      this.attrs = res.data
    },
    handleImgSuccess (res, file) {
      util.response(res, this)
      if (res.data) {
        let url = '/' + res.data.path + '/' + res.data.name
        this.ruleForm.touch_icon = url
        this.imgList.unshift({name: res.data.name, url: url})
      }
    },
    beforeImgUpload (file) {
      const isLt2M = file.size / 1024 / 1024 < 2
      if (file.type !== 'image/jpeg' && file.type !== 'image/jpg' && file.type !== 'image/png') {
        this.$message.error('上传头像图片只能是jpg/png/ipeg格式!')
        return false
      }
      if (!isLt2M) {
        this.$message.error('上传头像图片大小不能超过 2MB!')
        return false
      }
      return true
    },
    handleSizeChange (val) {
      console.log(`每页 ${val} 条`)
    },
    handleCurrentChange (val) {
      console.log(`当前页: ${val}`)
    },
    onContentChange (val) {
      this.editorTextCopy = val
      console.log(this.editorTextCopy)
    },
    afterChange () {
    },
    handleRemove (file, fileList) {
      console.log(file, fileList)
    },
    handlePictureCardPreview (file) {
      this.dialogImageUrl = file.url
      this.dialogVisible = true
    },
    addColorPicker (event, index) {
      if (event.target.className === 'el-icon-plus') {
        let idx = this.colorPickers[this.colorPickers.length - 1].idx + 1
        this.ruleForm['color_' + idx] = ''
        this.colorPickers.push({idx: idx, iconCls: 'el-icon-minus', name: this.ruleForm['color_' + idx]})
      } else {
        this.colorPickers.splice(index, 1)
        this.ruleForm.attr_color_list.splice(index, 1)
        this.attrImgColorTabData.splice(index, 1)
        delete this.ruleForm['color_' + index]
      }
    },
    colorPickerChange (value, idx) {
      let thiz = this
      thiz.attrTabHeader = {'size': '', 'color': '', 'price': '本店价', 'number': '库存', 'warn': '预警值', 'sn': '商品货号', 'code': '商品条形码', 'op': '操作'}
      thiz.ruleForm['color_' + idx] = value
      if (!value) {
        thiz.colorPickers.splice(idx, 1)
        thiz.attrImgColorTabData.splice(idx, 1)
        return
      }
      thiz.ruleForm.attr_color_list.push(value)
      thiz.attrImgColorTabData.push({'color': value, 'sort': 0})
      thiz.colorPickers.forEach(function (row, key) {
        if (key === idx) {
          row.value = value
        }
      })
      if (thiz.ruleForm.attr_color_list.length > 0) {
        thiz.attrTabHeader.color = '颜色'
      }
      if (thiz.ruleForm.attr_check_list.length > 0) {
        thiz.attrTabHeader.size = '尺码'
      }
      thiz.ruleForm.attr_color_list.forEach(function (item, key) {
        thiz.attrTabData.forEach(function (row) {
          if (row.color === '') {
            row.color = item
          } else if (row.color === item) {
          } else {
            thiz.attrTabData.push({
              'size': row.size,
              'color': item,
              'product_price': 0,
              'product_number': 0,
              'product_warn_number': 1,
              'product_sn': '',
              'product_bar_code': ''
            })
          }
        })
      })
    },
    attrCkChange (event) {
      let thiz = this
      thiz.attrTabHeader = {'size': '', 'color': '', 'price': '本店价', 'number': '库存', 'warn': '预警值', 'sn': '商品货号', 'code': '商品条形码', 'op': '操作'}
      thiz.attrTabData = []
      thiz.attrImgSizeTabData = []
      thiz.ruleForm.attr_check_list.forEach(function (item) {
        thiz.attrTabData.push({
          'size': item,
          'color': '',
          'product_price': 0,
          'product_number': 0,
          'product_warn_number': 1,
          'product_sn': '',
          'product_bar_code': ''
        })
        thiz.attrImgSizeTabData.push({'size': item, 'sort': 0})
      })
      if (thiz.ruleForm.attr_color_list.length > 0) {
        thiz.attrTabHeader.color = '颜色'
      }
      if (thiz.ruleForm.attr_check_list.length > 0) {
        thiz.attrTabHeader.size = '尺码'
      }
      thiz.ruleForm.attr_color_list.forEach(function (item, key) {
        thiz.attrTabData.forEach(function (row) {
          if (row.color === '') {
            row.color = item
          } else if (row.color === item) {
          } else {
            thiz.attrTabData.push({
              'size': row.size,
              'color': item,
              'product_price': 0,
              'product_number': 0,
              'product_warn_number': 1,
              'product_sn': '',
              'product_bar_code': ''
            })
          }
        })
      })
    }
  },
  computed: {
    header () {
      return {
        'X-Requested-Token': sessionStorage.getItem('token') ? sessionStorage.getItem('token') : null
      }
    },
    uploadData () {
      return {
        'type': 'goods_img'
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
    .attr_img {
        width:100%;clear: both;
    }
    .attr_img_item {
        width:25%;float:left;
    }
    .attr_img .attr_img_item .attr_img_sort {
        float:left;margin-right:5px;
    }
    .attr_img .attr_img_item .attr_img_input {
        width:32%;float:left;margin-right:5px;
    }
    .attr_img .attr_img_item .attr_img_upload {
        float:left;
    }
</style>
