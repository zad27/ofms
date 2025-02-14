<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="连接名称" prop="connname">
        <el-input
          v-model="queryParams.connname"
          placeholder="请输入连接名称"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="DB类型" prop="conntype">
        <el-select v-model="queryParams.conntype" placeholder="请选择数据库类型" clearable size="small">
          <el-option
            v-for="dict in dict.type.conn_type"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="IP地址" prop="connip">
        <el-input
          v-model="queryParams.connip"
          placeholder="请输入IP地址"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="端口号" prop="connport">
        <el-input
          v-model="queryParams.connport"
          placeholder="请输入端口号"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="数据库名" prop="conndbname">
        <el-input
          v-model="queryParams.conndbname"
          placeholder="请输入数据库名"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="用户名" prop="connusername">
        <el-input
          v-model="queryParams.connusername"
          placeholder="请输入用户名"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="附加参数" prop="connproperty">
        <el-input
          v-model="queryParams.connproperty"
          placeholder="请输入附加参数"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="创建日期" prop="createdate">
        <el-date-picker clearable size="small"
          v-model="queryParams.createdate"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="选择创建日期">
        </el-date-picker>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['report:resource:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['report:resource:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['report:resource:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          :loading="exportLoading"
          @click="handleExport"
          v-hasPermi="['report:resource:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="resourceList" @selection-change="handleSelectionChange" border>
      <el-table-column type="selection" width="50" align="center" />
      <el-table-column label="序号" align="center" prop="id" width="60"/>
      <el-table-column label="连接名称" align="center" prop="connname" width="80"/>
      <el-table-column label="DB类型" align="center" prop="conntype" width="80">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.conn_type" :value="scope.row.conntype"/>
        </template>
      </el-table-column>
      <el-table-column label="驱动包名" align="center" prop="conndriverclass" width="180"/>
      <el-table-column label="IP地址" align="center" prop="connip" width="120"/>
      <el-table-column label="端口号" align="center" prop="connport" width="60"/>
      <el-table-column label="数据库名" align="center" prop="conndbname" width="130"/>
      <el-table-column label="用户名" align="center" prop="connusername" width="60"/>
      <el-table-column label="附加参数" align="center" prop="connproperty" />
      <el-table-column label="创建日期" align="center" prop="createdate" width="110">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.createdate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['report:resource:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['report:resource:remove']"
          >删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改报数据源管理对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="700px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="100px" size="mini">
        <el-form-item label="连接名称" prop="connname">
          <el-input v-model="form.connname" placeholder="请输入连接名称" />
        </el-form-item>
        <el-form-item label="数据库类型" prop="conntype">
          <el-select v-model="form.conntype" placeholder="请选择数据库类型">
            <el-option
              v-for="dict in dict.type.conn_type"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="驱动包名" prop="conndriverclass">
          <el-input v-model="form.conndriverclass" placeholder="请输入驱动包名" />
        </el-form-item>
        <el-form-item label="IP地址" prop="connip">
          <el-input v-model="form.connip" placeholder="请输入IP地址" />
        </el-form-item>
        <el-form-item label="端口号" prop="connport">
          <el-input v-model="form.connport" placeholder="请输入端口号" />
        </el-form-item>
        <el-form-item label="数据库名" prop="conndbname">
          <el-input v-model="form.conndbname" placeholder="请输入数据库名" />
        </el-form-item>
        <el-form-item label="用户名" prop="connusername">
          <el-input v-model="form.connusername" placeholder="请输入用户名" />
        </el-form-item>
        <el-form-item label="密码" prop="connpassword">
        <!-- 1. type="password"   2. show-password -->
          <el-input v-model="form.connpassword" placeholder="请输入密码" type="password"/>
        </el-form-item>
        <el-form-item label="附加参数" prop="connproperty">
          <el-input v-model="form.connproperty" placeholder="请输入附加参数" />
        </el-form-item>
        <el-form-item label="创建日期" prop="createdate">
          <el-date-picker clearable size="small"
            v-model="form.createdate"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="选择创建日期">
          </el-date-picker>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
       <el-button @click="testConn">测试连接</el-button>
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listResource, getResource, delResource, addResource, updateResource, exportResource ,testResource } from "@/api/report/resource";

export default {
  name: "Resource",
  dicts: ['conn_type'],
  data() {
    return {
      // 遮罩层
      loading: true,
      // 导出遮罩层
      exportLoading: false,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 报数据源管理表格数据
      resourceList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        connname: null,
        conntype: null,
        connip: null,
        connport: null,
        conndbname: null,
        connusername: null,
        connproperty: null,
        createdate: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询报数据源管理列表 */
    getList() {
      this.loading = true;
      listResource(this.queryParams).then(response => {
        this.resourceList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        id: null,
        connname: null,
        conntype: null,
        conndriverclass: null,
        connip: null,
        connport: null,
        conndbname: null,
        connusername: null,
        connpassword: null,
        connproperty: null,
        createdate: null
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.id)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加报数据源管理";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getResource(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改报数据源管理";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateResource(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addResource(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 测试连接 */
    testConn(){
      //验证数据是否完整
      this.$refs["form"].validate(valid => {
        if (valid) {
            /** 测试连接 */
            testResource(this.form).then(response => {
              console.log(response.data);
              if(response.data){
                  this.$modal.msgSuccess("连接成功");
              }else{
                  this.$modal.msgSuccess("连接失败");
              }
            });
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const ids = row.id || this.ids;
      this.$modal.confirm('是否确认删除报数据源管理编号为"' + ids + '"的数据项？').then(function() {
        return delResource(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      const queryParams = this.queryParams;
      this.$modal.confirm('是否确认导出所有报数据源管理数据项？').then(() => {
        this.exportLoading = true;
        return exportResource(queryParams);
      }).then(response => {
        this.$download.name(response.msg);
        this.exportLoading = false;
      }).catch(() => {});
    }
  }
};
</script>
