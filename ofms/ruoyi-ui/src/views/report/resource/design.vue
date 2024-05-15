<template>
  <el-container class="layout-container">
    <el-aside width="320px">
      <el-select v-model="dataSourceValue" placeholder="请选择数据源" style="width: 100%;" clearable @change="selectDataSource">
        <el-option
          v-for="item in dataSourceList"
          :key="item.id"
          :label="item.connName"
          :value="{id:item.id,dbName:item.connDbName,dbType:item.connType}">
          <span style="float: left">{{ item.connName }}({{ item.connType}})</span>
          <span style="float: right; color: #8492a6; font-size: 13px">[{{ item.connDbName}}]</span>
        </el-option>
      </el-select>
      <el-table
        stripe
        :data="tableList"
        @row-dblclick="dbSelected"
        style="width: 100%;font-size:8px;">
        <el-table-column
          prop="name"
          label="表名">
        </el-table-column>
        <el-table-column
          prop="VALUE"
          label="描述">
        </el-table-column>
      </el-table>
    </el-aside>
    <el-main>
      <el-row>
        <el-col :span="24" style="background-color: #11A983;">
          <el-button-group >
            <el-tooltip class="item" effect="dark" content="运行" placement="top-end">
            <el-button type="primary" class="toolBtnClass" @click="cmdRun">
              <svg-icon icon-class="run" class="svgClass" />
            </el-button>
            </el-tooltip>
            <el-tooltip class="item" effect="dark" content="检查" placement="top-end">
            <el-button type="primary"  class="toolBtnClass" @click="cmdCheck">
              <svg-icon icon-class="check" class="svgClass" />
          </el-button>
           </el-tooltip>
              <el-tooltip class="item" effect="dark" content="格式化" placement="top-end">
            <el-button type="primary"  class="toolBtnClass" @click="cmdFormat">
              <svg-icon icon-class="format" class="svgClass" />
            </el-button>
              </el-tooltip>
                <el-tooltip class="item" effect="dark" content="清除" placement="top-end">
            <el-button type="primary"  class="toolBtnClass" @click="cmdClear">
              <svg-icon icon-class="clear" class="svgClass" />
            </el-button>
                </el-tooltip>
          </el-button-group>

        </el-col>
      </el-row>

      <codemirror
        ref="myCm"
        v-model="formData.queryText"
        :options="cmOptions"
        className = "code-mirror"
        @ready="onCmReady"
        @focus="onCmFocus"
        @input="onCmCodeChange" style="font-size: 14px;">
      </codemirror>
      <el-table :data="tableData" style="margin-top:0;" size="mini" border stripe >
        <el-table-column
          v-for="col in cols"
          :prop="col.prop" :label="col.label" :show-overflow-tooltip='true'  width='100'>
        </el-table-column>
      </el-table>
    </el-main>
  </el-container>
</template>

<script>
import sqlFormatter from "sql-formatter";
import 'codemirror/mode/sql/sql.js'
import 'codemirror/addon/hint/show-hint'
import 'codemirror/addon/hint/sql-hint'
//支持的语言
// import 'codemirror/mode/javascript/javascript.js'
// import 'codemirror/mode/css/css.js'
// import 'codemirror/mode/xml/xml.js'
// import 'codemirror/mode/clike/clike.js'
// import 'codemirror/mode/markdown/markdown.js'
// import 'codemirror/mode/python/python.js'
// import 'codemirror/mode/r/r.js'
// import 'codemirror/mode/shell/shell.js'
// import 'codemirror/mode/swift/swift.js'
// import 'codemirror/mode/vue/vue.js'
// 更换主题
// 查看 https://codemirror.net/demo/theme.html#neo 替换主题
import 'codemirror/theme/3024-night.css'
// require active-line.js
import 'codemirror/addon/selection/active-line.js'
import 'codemirror/addon/selection/selection-pointer'
// 全屏功能 由于项目复杂，自带的全屏功能一般不好使
import 'codemirror/addon/display/fullscreen.css'
import 'codemirror/addon/display/fullscreen'
// closebrackets
import 'codemirror/addon/edit/closebrackets.js'
// 自动括号匹配功能
import 'codemirror/addon/edit/matchbrackets'
// keyMap
import 'codemirror/mode/clike/clike.js'
// 调整scrollbar样式功能
import 'codemirror/addon/scroll/simplescrollbars.css'
import 'codemirror/addon/scroll/simplescrollbars'
//修改codemirror的height属性位置
//node_modules/codemirror/lib/codemirror.css，修改这里的CodeMirror内高度值为auto或直接上固定值即可

import 'codemirror/addon/comment/comment.js'
import 'codemirror/addon/dialog/dialog.js'
import 'codemirror/addon/dialog/dialog.css'
import 'codemirror/addon/search/searchcursor.js'
import 'codemirror/addon/search/search.js'
import 'codemirror/keymap/emacs.js'
import { getDataSource, getTableList,getTableColnums,runWithSql,checkWithSql } from '@/api/report/execsql'
export default {
  name: 'design',
  data() {

    return {
      tableData: [],
      formData:{
        queryText:''
      },
      cmOptions: {
        tabSize: 2,
        // 高亮选中行
        styleActiveLine: true,
        theme:'3024-night',
        lineNumbers: true,
        line: true,
        //编辑文本模式 ：  text/x-mysql    sql
        mode: 'sql',
        // 自动缩进
        smartIndent: true,
        // 在选择时是否显示光标
        showCursorWhenSelecting: true,
        // scrollbarStyle: 'overlay',
        // 自动括号匹配功能
        matchBrackets: true,
        viewportMargin: 1,
        lineWrapping: true,
        autofocus: true,
        autocorrect: true,
        spellcheck: true,
        // foldGutter: true,
        // gutters: ["CodeMirror-linenumbers", "CodeMirror-foldgutter"],
      },
      dataSourceList: [{
        id:1,
        connType:'Mysql',
        connName:'测试地址',
        connDbName:''
      }],
      dataSourceValue: '',
      tableList:[],
      TableColnums:[],
      cols:[]
    }
  },
  computed: {
    codemirror() {
      // return this.$refs.myCm.codemirror
    }
  },
  mounted(){
    //获取数据源信息
    this.getSourceList()
  },
  methods:{
    dbSelected(row) {
      getTableColnums(this.dataSourceValue.id,this.dataSourceValue.dbName,row.name).then(response => {
        this.TableColnums = response.data;
        //拼接查询语句
        let sqlText="select "
        for(let i=0;i<this.TableColnums.length;i++){
           sqlText+=this.TableColnums[i].ColumnName+","
        }
        sqlText=sqlText.slice(0,sqlText.length-1)
        sqlText +=" from "+row.name +" limit 1 "
        this.formData.queryText=sqlText
        this.tableData=[]
        this.cols=[]
        this.loading = false;
      });
    },
    getSourceList(){
      this.loading = true;
      getDataSource().then(response => {
        console.log(response.data)
        this.dataSourceList = response.data
        this.loading = false;
      });

    },
    selectDataSource(value){
      this.loading = true;
      this.dataSourceValue=value
      console.log("value.dbType:"+value.dbType)
      getTableList(value.id,value.dbName).then(response => {
        this.tableList = response.data;
        //数据源表为空，清空待执行的SQL语句
        if(this.tableList.length===0){
          this.formData.queryText =''
          this.cols=[]
          this.tableData=[]
        }
        this.loading = false;
      });
    },
    showSQL(val){
      this.formData.queryText = val?val:''
    },
    onCmReady(cm) {
      // this.codemirror.setSize("-webkit-fill-available", "auto")
    },
    onCmFocus(cm) {
      // console.log('the editor is focus!', cm)
    },
    onCmCodeChange(newCode) {
      // console.log('this is new code', newCode)
      this.formData.queryText = newCode
      this.$emit('codeChange',this.formData.queryText)
    },
    cmdFormat(){
      if(this.formData.queryText.trim().length!=0) {
        this.formData.queryText = (sqlFormatter.format(this.formData.queryText));
      }
    },
    cmdClear(){
      this.formData.queryText=''
    },
    cmdRun(){
      // 执行SQL语句之前的验证
      if(this.formData.queryText.trim().length===0){
        this.$message.error('SQL语句不能为空！');
        return
      }

      if(this.tableList.length===0){
        this.$message.error('数据源为空，不能执行！');
        return
      }

      this.loading = true;
      runWithSql(this.dataSourceValue.id,this.dataSourceValue.dbName,this.formData.queryText).then(response => {
        this.tableData=response.data
        //清空表格表头值
        this.cols=[]
        if(this.tableData.length>0){
          let colofzore=this.tableData[0]
          for(var key in colofzore){
            let tableCol={prop: key, label: key}
            this.cols.push(tableCol)
          }
        }
        this.loading = false;
      });
    },
    cmdCheck(){
    // 校验SQL语句之前的验证
      if(this.formData.queryText.trim().length===0){
        this.$message.error('SQL语句不能为空！');
        return
      }

      if(this.tableList.length===0){
        this.$message.error('数据源为空，不能执行！');
        return
      }

      this.loading = true;
      checkWithSql(this.dataSourceValue.dbType, this.formData.queryText).then(response => {
          console.log(response.data);
          this.loading = false;
      });
    }
  },
}
</script>

<style scoped>

.toolBtnClass{
  width: 40px;
  height: 40px;
  margin: 0;
  /*margin-bottom: 5px;*/
  padding-left: 0;
}
.el-container{
  height: 600px;
}

.atooltip .el-tooltip__popper[x-placement^="top"] .popper__arrow {
  border-top-color: pink;
}
.atooltip .el-tooltip__popper[x-placement^="top"] .popper__arrow:after {
  border-top-color: pink;
}
.atooltip {
  background: pink !important;
}

.layout-container{
  height: 715px;
}

.el-main {
  color: #333;
  margin: 0;
  padding: 0;
}

.el-aside {
  color: #333;
}
.code-mirror{
  font-size: 30px;
  line-height : 150%;
}


  /*.CodeMirror {*/
/*  font-size: 20px;*/
/*}*/

.svgClass {
  /*vertical-align: 0;*/
  height: 20px;
  width: 20px;
  margin-left: 10px;
}
/*text-align: right; font-size: 10px;*/
.CodeMirror {
 font-size: 20px;
 border: 1px solid #eee;
 height: auto;
}
</style>
